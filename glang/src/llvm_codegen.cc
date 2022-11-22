#include "llvm_codegen.h"
#include <llvm-c/Core.h>
#include <llvm/IR/Instruction.h>
#include <llvm/ExecutionEngine/ExecutionEngine.h>
#include "llvm/IR/IRBuilder.h"
#include <llvm/IR/Constants.h>
#include <llvm/IR/IRPrintingPasses.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/Type.h>
#include <iostream>
#include <memory>
#include <vector>
#include "parser.h"


namespace glang {

llvm::LLVMContext g_context;
llvm::Module *module = new llvm::Module("src/main.c", g_context);
llvm::IRBuilder<> builder(g_context);


CodeGen::CodeGen() {
    module = new llvm::Module("main", g_context);
}
void CodeGen::generateCode(Block &root) {
    std::vector<llvm::Type *> arg_types;
    llvm::FunctionType *ftype = llvm::FunctionType::get(
        llvm::Type::getVoidTy(g_context),
        llvm::makeArrayRef(arg_types), false);
    main_function_ = llvm::Function::Create(
        ftype, llvm::GlobalValue::InternalLinkage, "main", module);
    llvm::BasicBlock *bblock = llvm::BasicBlock::Create(
        g_context, "entry", main_function_, nullptr);

    pushBlock(bblock);
    root.generateCode(*this); 
    llvm::ReturnInst::Create(g_context, bblock);
    popBlock();

    std::ostream& out = std::cout;
    std::string s;
    llvm::raw_string_ostream os(s);
    module->print(os, nullptr);
    out << s;
}

llvm::GenericValue CodeGen::runCode() {
    llvm::ExecutionEngine *engine =
        llvm::EngineBuilder(std::unique_ptr<llvm::Module>(module)).create();
    engine->finalizeObject();
    std::vector<llvm::GenericValue> no_args;
    llvm::GenericValue v = engine->runFunction(main_function_, no_args);
    return v;
}

std::map<std::string, llvm::Value *> &CodeGen::getLocals() {
    return blocks_.top()->locals;
}

llvm::BasicBlock *CodeGen::getCurrentBlock() {
    return blocks_.top()->block;
}

void CodeGen::pushBlock(llvm::BasicBlock *block) {
    blocks_.push(new CodeGenBlock());
    blocks_.top()->returnValue = nullptr;
    blocks_.top()->block = block;
}

void CodeGen::popBlock() {
    auto *top = blocks_.top();
    blocks_.pop();
    delete top;
}

void CodeGen::setCurrentReturnValue(llvm::Value *value) {
    blocks_.top()->returnValue = value;
}

llvm::Value *CodeGen::getCurrentReturnValue() {
    return blocks_.top()->returnValue;
}

llvm::Value *Identifier::generateCode(CodeGen &context) {
    if (context.getLocals().find(name) == context.getLocals().end()) {
        return nullptr;
    }
    return new llvm::LoadInst(context.getLocals()[name], "", false,
                              context.getCurrentBlock());
}

llvm::Value *Assignment::generateCode(CodeGen &context) {
    if (context.getLocals().find(lhs.name) == context.getLocals().end()) {
        return nullptr;
    }
    return new llvm::StoreInst(rhs.generateCode(context),
                               context.getLocals()[lhs.name], false,
                               context.getCurrentBlock());
}

llvm::Value *MethodCall::generateCode(CodeGen &context) {
    llvm::Function *function = context.module->getFunction(id.name);
    std::vector<llvm::Value *> args;
    Expressions::const_iterator it;
    for (it = arguments.begin(); it != arguments.end(); it++) {
        args.push_back((**it).generateCode(context));
    }
    llvm::CallInst *call = llvm::CallInst::Create(
        function, llvm::makeArrayRef(args), "", context.getCurrentBlock());
    return call;
}

llvm::Value *BinaryOperator::generateCode(CodeGen &context) {
    llvm::Instruction::BinaryOps instr;
    switch (op) {
        case TOK_PLUS:
            instr = llvm::Instruction::Add;
            goto math;
        case TOK_MINUS:
            instr = llvm::Instruction::Sub;
            goto math;
        case TOK_MUL:
            instr = llvm::Instruction::Mul;
            goto math;
        case TOK_DIV:
            instr = llvm::Instruction::SDiv;
            goto math;
    }

    return nullptr;

math:
    return llvm::BinaryOperator::Create(instr, lhs.generateCode(context),
                                        rhs.generateCode(context), "",
                                        context.getCurrentBlock());
}

llvm::Value *ExpressionStatement::generateCode(CodeGen &context) {
    return expression.generateCode(context);
}

llvm::Value *FunctionDeclaration::generateCode(CodeGen &context) {
    std::vector<llvm::Type *> arg_types;
    Variables::const_iterator it;
    for (it = arguments.begin(); it != arguments.end(); it++) {
        arg_types.push_back(llvm::Type::getInt32Ty(g_context));
    }
    llvm::FunctionType *ftype = llvm::FunctionType::get(
        llvm::Type::getInt32Ty(g_context), llvm::makeArrayRef(arg_types), false);
    llvm::Function *function = llvm::Function::Create(
        ftype, llvm::GlobalValue::InternalLinkage, id.name, context.module);
    llvm::BasicBlock *bblock = llvm::BasicBlock::Create(
        g_context, "entry", function, nullptr);
    context.pushBlock(bblock);

    llvm::Function::arg_iterator args_values = function->arg_begin();
    llvm::Value *argument_value;
    for (it = arguments.begin(); it != arguments.end(); it++) {
        (**it).generateCode(context);
        argument_value = &*args_values++;
        argument_value->setName((*it)->id.name);
        auto *inst = new llvm::StoreInst(
            argument_value, context.getLocals()[(*it)->id.name], false, bblock);
    }

    block.generateCode(context);
    llvm::ReturnInst::Create(g_context,
                             context.getCurrentReturnValue(), bblock);
    context.popBlock();
    return function;
}

llvm::Value  *VariableDeclaration::generateCode(CodeGen &context) {
    llvm::IRBuilder<> builder(g_context);
    llvm::Value *alloc =  new llvm::AllocaInst(
        llvm::Type::getInt32Ty(g_context), 0, id.name, context.getCurrentBlock());
    context.getLocals()[id.name] = alloc;
    if (assignmentExpression != nullptr) {
        Assignment assign(id, *assignmentExpression);
        assign.generateCode(context);
    }
    return alloc;
}

llvm::Value *Block::generateCode(CodeGen &context) {
    Statements::const_iterator it;
    llvm::Value *last = nullptr;
    for (it = statements.begin(); it != statements.end(); it++) {
        last = (**it).generateCode(context);
    }
    return last;
}

llvm::Value *Integer::generateCode(CodeGen& context) {
    return llvm::ConstantInt::get(
        llvm::Type::getInt32Ty(g_context), value, true);
}
} 

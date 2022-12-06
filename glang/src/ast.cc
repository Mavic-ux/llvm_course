#include "ast.h"

namespace glang {

CodeGenBlock::CodeGenBlock() {
    m_context = std::make_unique<llvm::LLVMContext>();
    m_module = std::make_unique<llvm::Module>("main", *m_context);
    m_builder = std::make_unique<llvm::IRBuilder<>>(*m_context);
}

void CodeGenBlock::ImportGraphics(std::shared_ptr<Scope> globalScope) {
    llvm::FunctionType* functType = llvm::FunctionType::get(m_builder->getInt32Ty(), false);
    std::string name = "__glang_gl_rand";
    auto&& decl = std::make_shared<glang::FuncDeclare>(name);
    llvm::Function* func = llvm::Function::Create(functType, llvm::Function::ExternalLinkage, name, *m_module);
    decl->setFunc(func);
    globalScope->insertDecl(name, decl);

    name = "__glang_gl_put_pixel";
    decl = std::make_shared<glang::FuncDeclare>(name);
    functType = llvm::FunctionType::get(
        m_builder->getVoidTy(), 
        {
            m_builder->getInt32Ty(), 
            m_builder->getInt32Ty(), 
            m_builder->getInt32Ty()
        }, 
        false
    );
    func = llvm::Function::Create(functType, llvm::Function::ExternalLinkage, name, *m_module);
    decl->setFunc(func);
    globalScope->insertDecl(name, decl);

    name = "__glang_gl_flush";
    decl = std::make_shared<glang::FuncDeclare>(name);
    functType = llvm::FunctionType::get(m_builder->getVoidTy(), false);
    func = llvm::Function::Create(functType, llvm::Function::ExternalLinkage, name, *m_module);
    decl->setFunc(func);
    globalScope->insertDecl(name, decl);
}

std::shared_ptr<Declare> Scope::getDeclIfAvailable(const std::string& name) const {
    std::shared_ptr<Declare> ret = nullptr;
    auto&& it = m_MapTable.find(name);
    if(it != m_MapTable.end()) {
        return it->second;
    }
    if(m_parent) {
        return m_parent->getDeclIfAvailable(name);
    }
    return ret;
}

llvm::Value* Scope::codegen(CodeGenBlock& cont) {
    for(auto&& child : m_childs) {
        child->codegen(cont);
    }
    return nullptr;
}

llvm::Value* Integer::codegen(CodeGenBlock& cont) {
    return cont.m_builder->getInt32(m_val);
}

llvm::Value* DeclareVarN::codegen(CodeGenBlock& cont) {
    auto&& builder = cont.m_builder;
    if (!m_alloca) {
        m_alloca = builder->CreateAlloca(builder->getInt32Ty());
    }
    return builder->CreateLoad(builder->getInt32Ty(), m_alloca);
}

void DeclareVarN::store(CodeGenBlock& cont, llvm::Value* val) {
    cont.m_builder->CreateStore(val, m_alloca);
}

void ArrAccessN::store(CodeGenBlock& cont, llvm::Value* val) {
    cont.m_builder->CreateStore(val, m_ptr);
}

llvm::Value* ArrAccessN::codegen(CodeGenBlock& cont) {
    auto&& module = cont.m_module;
    auto&& builder = cont.m_builder;
    auto&& context = cont.m_context;

    std::shared_ptr<DeclGlobalArrN> decl = std::dynamic_pointer_cast<DeclGlobalArrN>(m_arrDecl);
    auto* arr = decl->getArr();
    auto* arrTy = decl->getArrayType();

    auto* idx = m_access->codegen(cont);
    m_ptr = builder->CreateGEP(arrTy, arr, { builder->getInt32(0), idx, });
    return builder->CreateLoad(builder->getInt32Ty(), m_ptr);
}

llvm::Value* BinOpN::codegen(CodeGenBlock& cont) {
    llvm::Value* lhsCodeGen = m_lhs->codegen(cont);
    llvm::Value* rhsCodeGen = m_rhs->codegen(cont);
    switch (m_op) {
    case BinOp::Plus:
        return cont.m_builder->CreateAdd(lhsCodeGen, rhsCodeGen);
    case BinOp::Minus:
        return cont.m_builder->CreateSub(lhsCodeGen, rhsCodeGen);
    case BinOp::Div:
        return cont.m_builder->CreateSDiv(lhsCodeGen, rhsCodeGen);
    case BinOp::Mod:
        return cont.m_builder->CreateSRem(lhsCodeGen, rhsCodeGen);
    case BinOp::Mult:
        return cont.m_builder->CreateMul(lhsCodeGen, rhsCodeGen);
    case BinOp::And:
        return cont.m_builder->CreateAnd(lhsCodeGen, rhsCodeGen);
    case BinOp::Or:
        return cont.m_builder->CreateOr(lhsCodeGen, rhsCodeGen);
    case BinOp::Equal:
        return cont.m_builder->CreateICmpEQ(lhsCodeGen, rhsCodeGen);
    case BinOp::NotEqual:
        return cont.m_builder->CreateICmpNE(lhsCodeGen, rhsCodeGen);
    case BinOp::Greater:
        return cont.m_builder->CreateICmpSGT(lhsCodeGen, rhsCodeGen);
    case BinOp::Less:
        return cont.m_builder->CreateICmpSLT(lhsCodeGen, rhsCodeGen);
    case BinOp::GreaterOrEqual:
        return cont.m_builder->CreateICmpSGE(lhsCodeGen, rhsCodeGen);
    case BinOp::LessOrEqual:
        return cont.m_builder->CreateICmpSLE(lhsCodeGen, rhsCodeGen);
    case BinOp::Assign:
        if (std::shared_ptr<DeclareVarN> decl = std::dynamic_pointer_cast<DeclareVarN>(m_lhs)) {
            decl->store(cont, rhsCodeGen);
        } 
 
        return nullptr;
    }

    return nullptr;
}

llvm::Value* FuncCallN::codegen(CodeGenBlock& cont) {
    auto&& module = cont.m_module;
    auto&& builder = cont.m_builder;
    auto&& context = cont.m_context;

    auto* funcDecl = llvm::dyn_cast<llvm::Function>(m_funcDecl->codegen(cont));
    auto* funcTy = funcDecl->getFunctionType();

    std::vector<llvm::Value*> args;
    for (auto&& name : m_arg_names) {
        auto&& it = m_currScope->getDeclIfAvailable(name);
        args.push_back(it->codegen(cont));
    }

    auto* ret = builder->CreateCall(funcTy, funcDecl, args);
    return ret;
}


llvm::Value* UnOpN::codegen(CodeGenBlock& cont) {
    auto&& module = cont.m_module;
    auto&& builder = cont.m_builder;
    llvm::Value* valCodegen;
    if (m_val) {
        valCodegen = m_val->codegen(cont);
    }

    if (m_op == UnOp::Not){
            return cont.m_builder->CreateNot(valCodegen);
    };
    nullptr;
}


llvm::Value* IfOp::codegen(CodeGenBlock& cont) {
    auto&& module = cont.m_module;
    auto&& builder = cont.m_builder;
    auto&& context = cont.m_context;

    auto&& funcHeader = m_currentScope->getParentFunc();
    auto* func = module->getFunction(funcHeader->getName());

    llvm::BasicBlock *top = llvm::BasicBlock::Create(*context, "", func);
    llvm::BasicBlock *free_bl = llvm::BasicBlock::Create(*context, "", func);

    auto* conditionCodegen = m_condition->codegen(cont);

    builder->CreateCondBr(conditionCodegen, top, free_bl);
    builder->SetInsertPoint(top);
    m_block->codegen(cont);
    if (!top->getTerminator()) {
        builder->CreateBr(free_bl);
    }
    builder->SetInsertPoint(free_bl);
    return nullptr;
}

llvm::Value* WhileOp::codegen(CodeGenBlock& cont) {
    auto&& module = cont.m_module;
    auto&& builder = cont.m_builder;
    auto&& context = cont.m_context;

    auto&& funcHeader = m_currentScope->getParentFunc();
    auto* func = module->getFunction(funcHeader->getName());

    llvm::BasicBlock *top_bb = llvm::BasicBlock::Create(*context, "", func);
    llvm::BasicBlock *free_bb = llvm::BasicBlock::Create(*context, "", func);
    cont.topBlock = free_bb;
    llvm::BasicBlock *conditionBB = llvm::BasicBlock::Create(*context, "", func);

    builder->CreateBr(conditionBB);
    builder->SetInsertPoint(conditionBB);
    auto* conditionCodegen = m_condition->codegen(cont);
    builder->CreateCondBr(conditionCodegen, top_bb, free_bb);

    builder->SetInsertPoint(top_bb);
    auto* blockCodegen = m_block->codegen(cont);
    builder->CreateBr(conditionBB);

    builder->SetInsertPoint(free_bb);
    return nullptr;
}

llvm::Value* BreakOp::codegen(CodeGenBlock& cont) {
    cont.m_builder->CreateBr(cont.topBlock);
    return nullptr;
}

llvm::Value* FuncDeclare::codegen(CodeGenBlock& cont) {
    if (!m_func) {
        auto&& module = cont.m_module;
        auto&& builder = cont.m_builder;
        auto&& context = cont.m_context;

        std::vector<llvm::Type*> argTypes;
        for (std::size_t i = 0; i < m_arg_names.size(); ++i) {
            argTypes.push_back(builder->getInt32Ty());
        }

        llvm::FunctionType* functType = llvm::FunctionType::get(builder->getInt32Ty(), argTypes, false);
        m_func = llvm::Function::Create(functType, llvm::Function::ExternalLinkage, m_name, *module);
    }
    return m_func;
}

llvm::Value* FuncN::codegen(CodeGenBlock& cont) {
    auto&& module = cont.m_module;
    auto&& builder = cont.m_builder;
    auto&& context = cont.m_context;

    m_header->codegen(cont); 

    auto&& funcName = m_header->getName();
    auto* func = module->getFunction(funcName);

    llvm::BasicBlock *initBB = llvm::BasicBlock::Create(*context, "entry", func);
    builder->SetInsertPoint(initBB);

    auto&& argNames = m_header->getArgNames();
    auto&& MapTable = m_scope->getMapTable();

    for(std::size_t i = 0; i < argNames.size(); ++i) {
        auto&& it = MapTable.find(argNames[i]);
        if(it != MapTable.end()) {
            auto&& decl = std::dynamic_pointer_cast<DeclareVarN>(it->second);
            decl->codegen(cont);
            auto&& argVal = func->getArg(i);
            decl->store(cont, argVal);
        }
    }

    m_scope->codegen(cont);
    return nullptr;
}

llvm::Value* ReturnOp::codegen(CodeGenBlock& cont) {
    auto* valCodegen = m_val->codegen(cont);
    auto* ret = cont.m_builder->CreateRet(valCodegen);
    return ret;
}


} 
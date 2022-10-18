#include <iostream>
#include <fstream>
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"

llvm::GlobalVariable* board = nullptr;
llvm::GlobalVariable* new_board = nullptr;

llvm::LLVMContext context;

// ; ModuleID = 'src/main.cpp'
// source_filename = "src/main.cpp"
llvm::Module *module = new llvm::Module("src/main.cpp", context);
llvm::IRBuilder<> builder(context);


void llvm_global_variables(){
    llvm::Type* cur_type = llvm::ArrayType::get(builder.getInt8Ty () , 360000);

    // @board = dso_local global [360000 x i8] zeroinitializer, align 16
    module->getOrInsertGlobal ("board" , cur_type);
    board = module->getNamedGlobal("board");
    board->setDSOLocal(true);
    board->setLinkage (llvm::GlobalValue::CommonLinkage);
    board->setAlignment (llvm::MaybeAlign (16));
    board->setInitializer (llvm::ConstantAggregateZero::get (cur_type));

    // @next_board = dso_local global [360000 x i8] zeroinitializer, align 16
    module->getOrInsertGlobal ("next_board" , cur_type);
    new_board = module->getNamedGlobal("next_board");
    new_board->setDSOLocal(true);
    new_board->setLinkage (llvm::GlobalValue::CommonLinkage);
    new_board->setAlignment (llvm::MaybeAlign (16));
    new_board->setInitializer (llvm::ConstantAggregateZero::get (cur_type));
}

void llvm_count_cells(){
    /// define dso_local i32 @count_cells(i32 %0, i32 %1) #0 {
    llvm::FunctionType* funcType = llvm::FunctionType::get (
      builder.getInt32Ty(),
      {builder.getInt32Ty(), builder.getInt32Ty()},
      false);

    llvm::Function* func = llvm::Function::Create (
        funcType , llvm::Function::ExternalLinkage , "count_cells" , module);

    func->setDSOLocal(true);

    llvm::BasicBlock *b0 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b10 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b13 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b16 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b19 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b20 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b23 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b24 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b27 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b36 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b37 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b50 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b53 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b54 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b57 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b58 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b61 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b62 = llvm::BasicBlock::Create(context, "", func);

    builder.SetInsertPoint(b0);

    // %3 = alloca i32, align 4
    auto *i3 = builder.CreateAlloca(builder.getInt32Ty());
    i3->setAlignment(llvm::Align(4));

    // %4 = alloca i32, align 4
    auto *i4 = builder.CreateAlloca(builder.getInt32Ty());
    i4->setAlignment(llvm::Align(4));

    // %5 = alloca i32, align 4
    auto *i5 = builder.CreateAlloca(builder.getInt32Ty());
    i5->setAlignment(llvm::Align(4));

    // %6 = alloca i32, align 4
    auto *i6 = builder.CreateAlloca(builder.getInt32Ty());
    i6->setAlignment(llvm::Align(4));

    // %7 = alloca i32, align 4
    auto *i7= builder.CreateAlloca(builder.getInt32Ty());
    i7->setAlignment(llvm::Align(4));

    // store i32 %0, i32* %3, align 4
    auto *store_0 = builder.CreateStore(func->getArg(0), i3);
    store_0->setAlignment(llvm::Align(4));

    // store i32 %1, i32* %4, align 4
    auto *store_1 = builder.CreateStore(func->getArg(1), i4);
    store_1->setAlignment(llvm::Align(4));

    // store i32 0, i32* %5, align 4
    auto *store_2 = builder.CreateStore(llvm::ConstantInt::get(builder.getInt32Ty(), 0), i5);
    store_2->setAlignment(llvm::Align(4));

    // %8 = load i32, i32* %3, align 4
    auto *i8 = builder.CreateLoad(builder.getInt32Ty(), i3); 
    i8->setAlignment(llvm::Align(4));

    // %9 = icmp sgt i32 %8, 0
    auto *i9 = builder.CreateICmpSGT(i8, builder.getInt32(0));

    // br i1 %9, label %10, label %62
    // builder.CreateCondBr(i9, b10, b62);

    // builder.SetInsertPoint(b62);
    builder.CreateCondBr(i9, b10, b62);

    builder.SetInsertPoint(b10);

    // %11 = load i32, i32* %3, align 4
    auto *i11 = builder.CreateLoad(builder.getInt32Ty(), i3); 
    i11->setAlignment(llvm::Align(4));

    // %12 = icmp slt i32 %11, 599
    auto *i12 = builder.CreateICmpSLT(i11, builder.getInt32(599)); 
    
    // br i1 %12, label %13, label %62
    builder.CreateCondBr(i12, b13, b62);

    builder.SetInsertPoint(b13);

    // %14 = load i32, i32* %4, align 4
    auto *i14 = builder.CreateLoad(builder.getInt32Ty(), i4); 
    i14->setAlignment(llvm::Align(4));

    // %15 = icmp sgt i32 %14, 0
    auto *i15 = builder.CreateICmpSGT(i14, builder.getInt32(0)); 

    // br i1 %15, label %16, label %62
    builder.CreateCondBr(i15, b16, b62);

    builder.SetInsertPoint(b16);

    // %17 = load i32, i32* %4, align 4
    auto *i17 = builder.CreateLoad(builder.getInt32Ty(), i4); 
    i17->setAlignment(llvm::Align(4));

    // %18 = icmp slt i32 %17, 599
    auto *i18 = builder.CreateICmpSLT(i17, builder.getInt32(599)); 

    // br i1 %18, label %19, label %62
    builder.CreateCondBr(i18, b19, b62);


}

int main()
{
    LLVMInitializeNativeTarget();

    llvm_global_variables();

    llvm_count_cells();

    // IR dump
    std::string s;
    llvm::raw_string_ostream os(s);
    module->print(os, nullptr);
    os.flush();
    std::ofstream file;
    file.open("dumped_llvm_ir.ll");
    file << s;
    file.close();

    // Interpreter of LLVM IR
    // std::cout << "Running code... \n";
    // llvm::ExecutionEngine *ee = llvm::EngineBuilder(std::unique_ptr<llvm::Module>(module)).create();
    // ee->finalizeObject();
    // std::vector<llvm::GenericValue> noargs;
    // llvm::GenericValue v = ee->runFunction(m)

    return 0;
}

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

int main()
{
    llvm::LLVMContext context;

    // ; ModuleID = 'src/main.cpp'
    // source_filename = "src/main.cpp"
    llvm::Module* module = new llvm::Module("src/main.cpp", context);
    llvm::IRBuilder<> builder(context);

    // @board = dso_local global [360000 x i8] zeroinitializer, align 16
    // @next_board = dso_local global [360000 x i8] zeroinitializer, align 16

    llvm::Type* cur_type = llvm::ArrayType::get (builder.getInt8Ty () , 360000);

    module->getOrInsertGlobal ("board" , cur_type);
    board = module->getNamedGlobal("board");
    board->setDSOLocal(true);
    board->setLinkage (llvm::GlobalValue::CommonLinkage);
    board->setAlignment (llvm::MaybeAlign (16));
    board->setInitializer (llvm::ConstantAggregateZero::get (cur_type));

    module->getOrInsertGlobal ("new_board" , cur_type);
    new_board = module->getNamedGlobal("new_board");
    new_board->setDSOLocal(true);
    new_board->setLinkage (llvm::GlobalValue::CommonLinkage);
    new_board->setAlignment (llvm::MaybeAlign (16));
    new_board->setInitializer (llvm::ConstantAggregateZero::get (cur_type));

    // define dso_local i32 @count_cells(i32 %0, i32 %1) #0 {
    llvm::FunctionType* funcType = llvm::FunctionType::get (
      builder.getInt32Ty(),
      {builder.getInt32Ty(), builder.getInt32Ty()},
      false);

    llvm::Function* func = llvm::Function::Create (
        funcType , llvm::Function::ExternalLinkage , "count_cells" , module);
    func->setDSOLocal(true);

    llvm::BasicBlock *entryBB = llvm::BasicBlock::Create(context, "", func);
    builder.SetInsertPoint(entryBB);

    // IR dump
    std::cout << "#[LLVM IR]:\n";
    std::string s;
    llvm::raw_string_ostream os(s);
    module->print(os, nullptr);
    os.flush();
    std::cout << s;

    return 0;
}

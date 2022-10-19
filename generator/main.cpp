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

// ; ModuleID = 'src/main.c'
// source_filename = "src/main.c"
llvm::Module *module = new llvm::Module("src/main.c", context);
llvm::IRBuilder<> builder(context);

void llvm_global_variables(){
    llvm::Type* cur_type = llvm::ArrayType::get(builder.getInt8Ty() , 360000);

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
    
    // llvm::Attribute attr = llvm::Attribute::get(context, "less-precise-fpmad", "false");
    // func->addAttributes(0, llvm::AttributeSet::get(context, llvm::AttrBuilder(attr)));

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
    auto *store_2 = builder.CreateStore(builder.getInt32(0), i5);
    store_2->setAlignment(llvm::Align(4));

    // %8 = load i32, i32* %3, align 4
    auto *i8 = builder.CreateLoad(builder.getInt32Ty(), i3); 
    i8->setAlignment(llvm::Align(4));

    // %9 = icmp sgt i32 %8, 0
    auto *i9 = builder.CreateICmpSGT(i8, builder.getInt32(0));

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

    builder.SetInsertPoint(b19);

    //  store i32 -1, i32* %6, align 4
    auto *store_3 = builder.CreateStore(builder.getInt32(-1), i6);
    store_3->setAlignment(llvm::Align(4));

    builder.CreateBr(b20);

    builder.SetInsertPoint(b20);

    // %21 = load i32, i32* %6, align 4
    auto *i21 = builder.CreateLoad(builder.getInt32Ty(), i6); 
    i21->setAlignment(llvm::Align(4));

    // 22 = icmp sle i32 %21, 1
    auto *i22 = builder.CreateICmpSLE(i21, builder.getInt32(1)); 

    // br i1 %22, label %23, label %61
    builder.CreateCondBr(i22, b23, b61);

    builder.SetInsertPoint(b23);

    // store i32 -1, i32* %7, align 4
    auto *store_4 = builder.CreateStore(builder.getInt32(-1), i7);
    store_4->setAlignment(llvm::Align(4));

    // br label %24
    builder.CreateBr(b24);

    builder.SetInsertPoint(b24);

    // %25 = load i32, i32* %7, align 4
    auto *i25 = builder.CreateLoad(builder.getInt32Ty(), i7); 
    i25->setAlignment(llvm::Align(4));

    // %26 = icmp sle i32 %25, 1
    auto *i26 = builder.CreateICmpSLE(i25, builder.getInt32(1)); 

    // br i1 %26, label %27, label %57
    builder.CreateCondBr(i26, b27, b57);

    builder.SetInsertPoint(b27);

    // %28 = load i32, i32* %6, align 4
    auto *i28 = builder.CreateLoad(builder.getInt32Ty(), i6); 
    i28->setAlignment(llvm::Align(4));

    // %29 = icmp eq i32 %28, 0
    auto *i29 = builder.CreateICmpEQ(i28, builder.getInt32(0)); 

    // %30 = zext i1 %29 to i32
    auto *i30 = builder.CreateZExt(i29, builder.getInt32Ty()); 

    // %31 = load i32, i32* %7, align 4
    auto *i31 = builder.CreateLoad(builder.getInt32Ty(), i7); 
    i31->setAlignment(llvm::Align(4));

    // %32 = icmp eq i32 %31, 0
    auto *i32 = builder.CreateICmpEQ(i31, builder.getInt32(0)); 

    // %33 = zext i1 %32 to i32
    auto *i33 = builder.CreateZExt(i32, builder.getInt32Ty()); 

    // %34 = and i32 %30, %33
    auto *i34 = builder.CreateAnd(i30, i33);

    // %35 = icmp ne i32 %34, 0
    auto *i35 = builder.CreateICmpNE(i34, builder.getInt32(0)); 

    // br i1 %35, label %36, label %37
    builder.CreateCondBr(i35, b36, b37);

    builder.SetInsertPoint(b36);

    // br label %54
    builder.CreateBr(b54);

    builder.SetInsertPoint(b37);

    // %38 = load i32, i32* %4, align 4
    auto *i38 = builder.CreateLoad(builder.getInt32Ty(), i4); 
    i38->setAlignment(llvm::Align(4));

    // %39 = load i32, i32* %7, align 4
    auto *i39 = builder.CreateLoad(builder.getInt32Ty(), i7); 
    i39->setAlignment(llvm::Align(4));

    // %40 = add nsw i32 %38, %39
    auto *i40 = builder.CreateNSWAdd(i38, i39);

    // %41 = mul nsw i32 %40, 600
    auto *i41 = builder.CreateNSWMul(i40, builder.getInt32(600));   

    // %42 = load i32, i32* %3, align 4
    auto *i42 = builder.CreateLoad(builder.getInt32Ty(), i3); 
    i42->setAlignment(llvm::Align(4));

    // %43 = load i32, i32* %6, align 4
    auto *i43 = builder.CreateLoad(builder.getInt32Ty(), i6); 
    i43->setAlignment(llvm::Align(4));

    // %44 = add nsw i32 %42, %43
    auto *i44 = builder.CreateNSWAdd(i42, i43);

    // %45 = add nsw i32 %41, %44
    auto *i45 = builder.CreateNSWAdd(i41, i44);

    // %46 = sext i32 %45 to i64
    auto *i46 = builder.CreateSExt(i45, builder.getInt64Ty());

    // %47 = getelementptr inbounds [360000 x i8], [360000 x i8]* @board, i64 0, i64 %46
    llvm::Type* cur_type = llvm::ArrayType::get(builder.getInt8Ty() , 360000);
    llvm::Value *indices[2] = {builder.getInt64(0), i46};
    auto *i47 = builder.CreateInBoundsGEP(cur_type, board, llvm::ArrayRef<llvm::Value *>({indices}, 2));

    // %48 = load i8, i8* %47, align 1
    auto *i48 = builder.CreateLoad(builder.getInt8Ty(), i47); 
    i48->setAlignment(llvm::Align(1));

    // %49 = trunc i8 %48 to i1
    auto *i49 = builder.CreateTrunc(i48, builder.getInt1Ty()); 

    // br i1 %49, label %50, label %53 
    builder.CreateCondBr(i49, b50, b53);

    builder.SetInsertPoint(b50);

    // %51 = load i32, i32* %5, align 4
    auto *i51 = builder.CreateLoad(builder.getInt32Ty(), i5); 
    i51->setAlignment(llvm::Align(4));

    // %52 = add nsw i32 %51, 1
    auto *i52 = builder.CreateNSWAdd(i51, builder.getInt32(1));

    // store i32 %52, i32* %5, align 4
    auto *store_5 = builder.CreateStore(i52, i5);
    store_5->setAlignment(llvm::Align(4));

    // br label %53
    builder.CreateBr(b53);

    builder.SetInsertPoint(b53);

    //br label %54
    builder.CreateBr(b54);
    
    builder.SetInsertPoint(b54);

    // %55 = load i32, i32* %7, align 4
    auto *i55 = builder.CreateLoad(builder.getInt32Ty(), i7); 
    i55->setAlignment(llvm::Align(4));

    // %56 = add nsw i32 %55, 1
    auto *i56 = builder.CreateNSWAdd(i55, builder.getInt32(1));

    // store i32 %56, i32* %7, align 4
    auto *store_6 = builder.CreateStore(i56, i7);
    store_6->setAlignment(llvm::Align(4));

    // br label %24
    builder.CreateBr(b24);

    builder.SetInsertPoint(b57);

    // br label %58
    builder.CreateBr(b58);

    builder.SetInsertPoint(b58);
    // %59 = load i32, i32* %6, align 4
    auto *i59 = builder.CreateLoad(builder.getInt32Ty(), i6); 
    i59->setAlignment(llvm::Align(4));

    // %60 = add nsw i32 %59, 1
    auto *i60 = builder.CreateNSWAdd(i59, builder.getInt32(1));

    // store i32 %60, i32* %6, align 4
    auto *store_7 = builder.CreateStore(i60, i6);
    store_7->setAlignment(llvm::Align(4));

    // br label %20
    builder.CreateBr(b20);

    builder.SetInsertPoint(b61);    

    // br label %62
    builder.CreateBr(b62);

    builder.SetInsertPoint(b62);    

    // %63 = load i32, i32* %5, align 4
    auto *i63 = builder.CreateLoad(builder.getInt32Ty(), i5); 
    i63->setAlignment(llvm::Align(4));

    // ret i32 %63
    builder.CreateRet(i63);   

}

void llvm_update_board(){
     /// define dso_local i32 @count_cells(i32 %0, i32 %1) #0 {
    llvm::FunctionType* funcType = llvm::FunctionType::get(
      builder.getVoidTy(),
      false);

    llvm::Function* func = llvm::Function::Create (
        funcType , llvm::Function::ExternalLinkage , "update_board" , module);
    func->setDSOLocal(true);

    llvm::BasicBlock *b0 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b6 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b9 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b10 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b13 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b25 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b28 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b31 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b40 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b50 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b51 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b54 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b55 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b58 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b59 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b62 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b63 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b66 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b82 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b85 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b86 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b89 = llvm::BasicBlock::Create(context, "", func);

    builder.SetInsertPoint(b0);

    // %1 = alloca i32, align 4
    auto *i1 = builder.CreateAlloca(builder.getInt32Ty());
    i1->setAlignment(llvm::Align(4));

    // %2 = alloca i32, align 4
    auto *i2 = builder.CreateAlloca(builder.getInt32Ty());
    i2->setAlignment(llvm::Align(4));

    // %3 = alloca i32, align 4
    auto *i3 = builder.CreateAlloca(builder.getInt32Ty());
    i3->setAlignment(llvm::Align(4));

    // %4 = alloca i32, align 4
    auto *i4 = builder.CreateAlloca(builder.getInt32Ty());
    i4->setAlignment(llvm::Align(4));

    // %5 = alloca i32, align 4
    auto *i5 = builder.CreateAlloca(builder.getInt32Ty());
    i5->setAlignment(llvm::Align(4));

    // store i32 0, i32* %1, align 4
    auto *store_0 = builder.CreateStore(builder.getInt32(0), i1);
    store_0->setAlignment(llvm::Align(4));

    // br label %6
    builder.CreateBr(b6);

    builder.SetInsertPoint(b6);

    // %7 = load i32, i32* %1, align 4
    auto *i7 = builder.CreateLoad(i1); 
    i7->setAlignment(llvm::Align(4));

    // %8 = icmp slt i32 %7, 600
    auto *i8 = builder.CreateICmpSLT(i7, builder.getInt32(600)); 

    // br i1 %8, label %9, label %58
    builder.CreateCondBr(i8, b9, b58);

    builder.SetInsertPoint(b9);

    // store i32 0, i32* %2, align 4
    auto *store_1 = builder.CreateStore(builder.getInt32(0), i2);
    store_1->setAlignment(llvm::Align(4));

    // br label %10
    builder.CreateBr(b10);

    builder.SetInsertPoint(b10);

    // %11 = load i32, i32* %2, align 4
    auto *i11 = builder.CreateLoad(i2);
    i11->setAlignment(llvm::Align(4));

    // %12 = icmp slt i32 %11, 600
    auto *i12 = builder.CreateICmpSLT(i11, builder.getInt32(600));

    // br i1 %12, label %13, label %54
    builder.CreateCondBr(i1, b13, b54);

    builder.SetInsertPoint(b13);

    // %14 = load i32, i32* %2, align 4
    auto *i14 = builder.CreateLoad(i2); 
    i14->setAlignment(llvm::Align(4));

    // %15 = load i32, i32* %1, align 4
    auto *i15 = builder.CreateLoad(i1); 
    i15->setAlignment(llvm::Align(4));

    // %16 = call i32 @count_cells(i32 %14, i32 %15)
    auto *i16 = builder.CreateCall(module->getFunction("count_cells"), {i14, i15});

    // store i32 %16, i32* %3, align 4
    auto *store_2 = builder.CreateStore(i16, i3);
    store_2->setAlignment(llvm::Align(4));

    // %17 = load i32, i32* %1, align 4

    // %18 = mul nsw i32 %17, 600
    builder.SetInsertPoint(b28);

    // builder.SetInsertPoint(b31);

    // builder.SetInsertPoint(b40);

    // builder.SetInsertPoint(b50);

    // builder.SetInsertPoint(b51);

    // builder.SetInsertPoint(b54);

    // builder.SetInsertPoint(b55);

    // builder.SetInsertPoint(b58);

    // builder.SetInsertPoint(b59);

    // builder.SetInsertPoint(b62);

    // builder.SetInsertPoint(b63);

    // builder.SetInsertPoint(b66);

    // builder.SetInsertPoint(b82);

    // builder.SetInsertPoint(b85);

    // builder.SetInsertPoint(b86);

    // builder.SetInsertPoint(b89);

}

void llvm_main(){
    // define dso_local i32 @main(i32 %0, i8** %1) #0 
    llvm::FunctionType* funcType = llvm::FunctionType::get(
      builder.getInt32Ty(),
      {builder.getInt32Ty(), llvm::PointerType::get(builder.getInt8PtrTy(), 0)},
      false);

    llvm::Function* func = llvm::Function::Create (
        funcType , llvm::Function::ExternalLinkage , "main" , module);
    func->setDSOLocal(true);

    llvm::BasicBlock *b0 = llvm::BasicBlock::Create(context, "", func);
    llvm::BasicBlock *b6 = llvm::BasicBlock::Create(context, "", func);

    builder.SetInsertPoint(b0);

    // %3 = alloca i32, align 4
    auto *i3 = builder.CreateAlloca(builder.getInt32Ty());
    i3->setAlignment(llvm::Align(4));

    // %4 = alloca i32, align 4
    auto *i4 = builder.CreateAlloca(builder.getInt32Ty());
    i4->setAlignment(llvm::Align(4));

    // %5 = alloca i8**, align 8
    auto *i5 = builder.CreateAlloca(llvm::PointerType::get(builder.getInt8PtrTy(), 0));
    i5->setAlignment(llvm::Align(8));

    // store i32 0, i32* %3, align 4
    auto *store_0 = builder.CreateStore(builder.getInt32(0), i3);
    store_0->setAlignment(llvm::Align(4));

    // store i32 %0, i32* %4, align 4
    auto *store_1 = builder.CreateStore(func->getArg(0), i4);
    store_1->setAlignment(llvm::Align(4));
    
    // store i8** %1, i8*** %5, align 8
    auto *store_2 = builder.CreateStore(func->getArg(1),i5);
    store_2->setAlignment(llvm::Align(8));

    llvm::Type* cur_type = llvm::ArrayType::get(builder.getInt8Ty() , 360000);
    llvm::Value *indices[3] = {builder.getInt64(0), builder.getInt64(0)};
    auto *temp = builder.CreateInBoundsGEP(cur_type, board, llvm::ArrayRef<llvm::Value *>({indices}, 2));

    // call void @initial_board(i8* getelementptr inbounds ([360000 x i8], [360000 x i8]* @board, i64 0, i64 0))
    // builder.CreateCall(module->getFunction("initial_board"), {temp});

    // br label %6
    builder.CreateBr(b6);

    builder.SetInsertPoint(b6);

    builder.CreateCall(module->getFunction("update_board"));

    builder.CreateBr(b6);
    //  call void @update_board()draw


}

void llvm_declare_funcs(){
    // declare dso_local void @initial_board(i8*) #1
    llvm::FunctionType* initial_board_functype = llvm::FunctionType::get(
      builder.getVoidTy(),
      builder.getInt8PtrTy(),
      false);

    llvm::Function* initial_board_func = llvm::Function::Create(
        initial_board_functype , llvm::Function::ExternalLinkage , "initial_board" , module);
    initial_board_func->setDSOLocal(true);

    //declare dso_local void @draw(i8*) #1
    llvm::FunctionType* draw_functype = llvm::FunctionType::get(
      builder.getVoidTy(),
      builder.getInt8PtrTy(),
      false);

    llvm::Function* draw_func = llvm::Function::Create(
        draw_functype , llvm::Function::ExternalLinkage , "draw" , module);
    draw_func->setDSOLocal(true);
}

void dump_llmv_ir(){
    std::string s;
    llvm::raw_string_ostream os(s);
    module->print(os, nullptr);
    os.flush();
    std::ofstream file;
    file.open("generated_llvm_ir.ll");
    file << s;
    file.close();
}

int main()
{
    LLVMInitializeNativeTarget();

    llvm_global_variables();

    llvm_count_cells();

    llvm_update_board();

    llvm_main();

    llvm_declare_funcs();

    dump_llmv_ir();
   

    // Interpreter of LLVM IR
    // std::cout << "Running code... \n";
    // llvm::ExecutionEngine *ee = llvm::EngineBuilder(std::unique_ptr<llvm::Module>(module)).create();
    // ee->finalizeObject();
    // std::vector<llvm::GenericValue> noargs;
    // llvm::GenericValue v = ee->runFunction(m)

    return 0;
}

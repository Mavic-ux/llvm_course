#ifndef glang_LLVM_CODEGEN_H
#define glang_LLVM_CODEGEN_H

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Value.h>
#include <llvm/IR/Module.h>
#include <llvm/ExecutionEngine/GenericValue.h>
#include <map>
#include <stack>
#include <string>
#include "nodes.h"

namespace glang {

struct CodeGenBlock{
    llvm::BasicBlock *block;
    llvm::Value *returnValue;
    std::map<std::string, llvm::Value *> locals;
};

class CodeGen {
  public:
    CodeGen();

    void generateCode(Block &root);
    llvm::GenericValue runCode();

    std::map<std::string, llvm::Value*>& getLocals();
    llvm::BasicBlock *getCurrentBlock();

    void pushBlock(llvm::BasicBlock *block);
    void popBlock();

    void setCurrentReturnValue(llvm::Value *value);
    llvm::Value* getCurrentReturnValue();

    llvm::Module *module;

  private:
    std::stack<CodeGenBlock *> blocks_;
    llvm::Function *main_function_{};
};
}

#endif // glang_LLVM_CODEGEN_H

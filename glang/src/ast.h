#pragma once

#include "types.h"

#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/Constants.h"


namespace glang {

class Scope;

struct CodeGenBlock {
    CodeGenBlock();
    std::unique_ptr<llvm::LLVMContext> m_context = nullptr;
    std::unique_ptr<llvm::Module> m_module = nullptr;
    std::unique_ptr<llvm::IRBuilder<>> m_builder = nullptr;

    void ImportGraphics(std::shared_ptr<Scope> globalScope);
    llvm::BasicBlock* topBlock = nullptr;
};

class FuncDeclare;

struct INode {
    virtual llvm::Value* codegen(CodeGenBlock& context) = 0;
    virtual ~INode() {}
};

class Integer : public INode {
public:
    Integer(std::int32_t val) : m_val{val} {}
    std::int32_t get() const { return m_val; }
    llvm::Value* codegen(CodeGenBlock& context) override;
private: 
    std::int32_t m_val;
};

class BinOpN : public INode {
public:
    BinOpN(std::shared_ptr<INode> lhs, BinOp op, std::shared_ptr<INode> rhs) : m_lhs{lhs}, m_rhs{rhs}, m_op{op} {}
    llvm::Value* codegen(CodeGenBlock& context) override;
private:
    std::shared_ptr<INode> m_lhs, m_rhs;
    BinOp m_op;
};

class UnOpN : public INode {
public:
    UnOpN(UnOp op, std::shared_ptr<INode> val) : m_val{val}, m_op{op} {}
    llvm::Value* codegen(CodeGenBlock& context) override;
private:
    std::shared_ptr<INode> m_val;
    UnOp m_op;
};

struct Declare : public INode {
    virtual llvm::Value* codegen(CodeGenBlock& context) override = 0;
};

class DeclareVarN : public Declare {
public:
    llvm::Value* codegen(CodeGenBlock& context) override;
    void store(CodeGenBlock& context, llvm::Value* val);
private:
    llvm::Value* m_alloca = nullptr;
};

class Scope : public INode {
public:
    Scope(std::shared_ptr<Scope> parent) : m_parent{parent} {
        m_parentFunc = parent->getParentFunc();
    }

    void insertChild(std::shared_ptr<INode> child) { m_childs.push_back(child); }
    std::shared_ptr<Scope> getParent() const { return m_parent; }
    std::shared_ptr<Declare> getDeclIfAvailable(const std::string& name) const;
    void insertDecl(const std::string& name, std::shared_ptr<Declare> decl) { m_MapTable[name] = decl; }
    llvm::Value* codegen(CodeGenBlock& context) override;

    void setParentFunc(std::shared_ptr<FuncDeclare> parentFunc) { m_parentFunc = parentFunc; }
    std::shared_ptr<FuncDeclare> getParentFunc() const { return m_parentFunc; }

    using MapTable = std::unordered_map<std::string, std::shared_ptr<Declare>>;
    const MapTable& getMapTable() const { return m_MapTable; } 
private:
    std::vector<std::shared_ptr<INode>> m_childs;
    std::shared_ptr<Scope> m_parent = nullptr;
    std::shared_ptr<FuncDeclare> m_parentFunc = nullptr;
    MapTable m_MapTable;
};

class DeclGlobalArrN : public Declare {
public:
    DeclGlobalArrN(std::int32_t size) : m_size{size} {}
    void setName(const std::string& name) { m_name = name; }
    llvm::Value* codegen(CodeGenBlock& context) override;

    llvm::Constant* getArr() const { return m_array; }
    llvm::Type* getArrayType() const { return m_arrayType; }
private:
    std::int32_t m_size;
    llvm::Constant* m_array = nullptr;
    llvm::Type* m_arrayType = nullptr;
    std::string m_name;
};

class ArrAccessN : public INode {
public:
    ArrAccessN(std::shared_ptr<INode> access, std::shared_ptr<INode> arrDecl) :
        m_access{access}, m_arrDecl{arrDecl} {}

    llvm::Value* codegen(CodeGenBlock& context) override;
    void store(CodeGenBlock& context, llvm::Value* val);
private:
    std::shared_ptr<INode> m_access, m_arrDecl;
    llvm::Value* m_ptr = nullptr;
};

class IfOp : public INode {
public:
    IfOp(std::shared_ptr<Scope> block, std::shared_ptr<INode> condition, std::shared_ptr<Scope> currentScope) : 
        m_block{block},
        m_condition{condition},
        m_currentScope{currentScope} {}
    llvm::Value* codegen(CodeGenBlock& context) override;
private:
    std::shared_ptr<Scope> m_block;
    std::shared_ptr<INode> m_condition;
    std::shared_ptr<Scope> m_currentScope;
};

class WhileOp : public INode {
public:
    WhileOp(std::shared_ptr<Scope> block, std::shared_ptr<INode> condition, std::shared_ptr<Scope> currentScope) : 
        m_block{block}, 
        m_condition{condition},
        m_currentScope{currentScope} {}
    llvm::Value* codegen(CodeGenBlock& context) override;
private:
    std::shared_ptr<Scope> m_block;
    std::shared_ptr<INode> m_condition;
    std::shared_ptr<Scope> m_currentScope;
};

struct BreakOp : public INode {
    llvm::Value* codegen(CodeGenBlock& context) override;
};

class FuncDeclare : public Declare {
public:
    FuncDeclare(const std::string& name, const std::vector<std::string>& arg_names = {}) : m_arg_names{arg_names}, m_name{name} {}
    llvm::Value* codegen(CodeGenBlock& context) override;
    const std::vector<std::string>& getArgNames() const { return m_arg_names; }
    const std::string& getName() const { return m_name; }
    void setFunc(llvm::Function* func) { m_func = func; }
private:
    llvm::Function* m_func = nullptr;
    std::vector<std::string> m_arg_names;
    std::string m_name;
};

class FuncN : public INode {
public:
    FuncN(std::shared_ptr<Scope> scope, std::shared_ptr<FuncDeclare> header) : m_scope{scope}, m_header{header} {}
    llvm::Value* codegen(CodeGenBlock& context) override;
private:
    std::shared_ptr<Scope> m_scope;
    std::shared_ptr<FuncDeclare> m_header;
};

class FuncCallN : public INode {
public:
    FuncCallN(std::shared_ptr<INode> funcDecl, std::shared_ptr<Scope> currScope, const std::vector<std::string>& arg_names = {}) :
        m_currScope{currScope},
        m_arg_names{arg_names},
        m_funcDecl{funcDecl} {}
    llvm::Value* codegen(CodeGenBlock& context) override;
private:
    std::shared_ptr<Scope> m_currScope;
    std::vector<std::string> m_arg_names;
    std::shared_ptr<INode> m_funcDecl;
};

class ReturnOp : public INode {
public:
    ReturnOp(std::shared_ptr<INode> val) : m_val{val} {}
    llvm::Value* codegen(CodeGenBlock& context) override;
private:
    std::shared_ptr<INode> m_val;
};

}
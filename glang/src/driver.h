#pragma once

#ifndef yyFlexLexer
#include <FlexLexer.h>
#endif

#include <string>
#include <fstream>
#include <sstream>
#include <memory>

#include "parser.h"
#include "ast.h"

namespace yy {

class Driver final {
public:
    ~Driver() = default;
    Driver(std::istream& in, std::ostream& out);

    parser::token_type yylex(parser::semantic_type* yylval);
    bool parse();
    void codegen();
    void dumpIR(std::ostream& out);

    friend parser;
private:
    std::unique_ptr<yyFlexLexer> m_lexer = nullptr;
    glang::CodeGenBlock m_codegenCtx;
    std::shared_ptr<glang::Scope> m_currentScope = std::make_shared<glang::Scope>();
    std::vector<std::string> m_currentFunctionArgs;
};

} 

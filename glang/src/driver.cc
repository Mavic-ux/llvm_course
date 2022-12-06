#include "driver.h"

namespace yy {
    
Driver::Driver(std::istream& in, std::ostream& out) {
    m_lexer = std::make_unique<yyFlexLexer>(in, out);
    m_codegenCtx.ImportGraphics(m_currentScope);
}

bool Driver::parse() {
    parser parser(this);
    bool res = parser.parse();
    return !res;
}

void Driver::codegen() {
    m_currentScope->codegen(m_codegenCtx);
}

void Driver::dumpIR(std::ostream& out) {
    std::string s;
    llvm::raw_string_ostream os(s);
    m_codegenCtx.m_module->print(os, nullptr);
    os.flush();
    out << s;
}

parser::token_type Driver::yylex(parser::semantic_type* yylval) {
    auto token = static_cast<parser::token_type>(m_lexer->yylex());

    switch (token)
    {
    case parser::token_type::INTEGER:
        yylval->as<int>() = std::atoi(m_lexer->YYText());
        break;

    case parser::token_type::IDENTIFIER:
        yylval->emplace<std::string>(m_lexer->YYText());
        break;

    default:
        break;
    }

    return token;
}
}
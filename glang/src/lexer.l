%option c++
%option noyywrap debug
%{
#include "parser.h"
%}

WS [ \t\n\v]+
NAT_NUMBER [0-9][0-9]*(.[0-9]+)?
IDENTIFIER [a-zA-Z][a-zA-Z0-9_]*[_]*

%%
"return"    return yy::parser::token_type::RETURN;
"while"     return yy::parser::token_type::WHILE;
"if"        return yy::parser::token_type::IF;
"def"        return yy::parser::token_type::DEF;
"break"     return yy::parser::token_type::BREAK;

";"         return yy::parser::token_type::SCOLON;
"{"         return yy::parser::token_type::LCB;
"}"         return yy::parser::token_type::RCB;
"("         return yy::parser::token_type::LRB;
")"         return yy::parser::token_type::RRB;
"["         return yy::parser::token_type::LAB;
"]"         return yy::parser::token_type::RAB;
","         return yy::parser::token_type::COMMA;

"print"     return yy::parser::token_type::OUTPUT;

">="        return yy::parser::token_type::GREATER_OR_EQUAL;
"<="        return yy::parser::token_type::LESS_OR_EQUAL;
">"         return yy::parser::token_type::GREATER;
"<"         return yy::parser::token_type::LESS;
"=="        return yy::parser::token_type::EQUAL;
"!="        return yy::parser::token_type::NOT_EQUAL;

"="         return yy::parser::token_type::ASSIGN;

"?"         return yy::parser::token_type::INPUT;

"or"        return yy::parser::token_type::OR;
"and"        return yy::parser::token_type::AND;
"not"         return yy::parser::token_type::NOT;

"+"         return yy::parser::token_type::PLUS;
"-"         return yy::parser::token_type::MINUS;

"*"         return yy::parser::token_type::MUL;
"/"         return yy::parser::token_type::DIV;
"%"         return yy::parser::token_type::MOD;

{WS}        
{NAT_NUMBER}   return yy::parser::token_type::INTEGER;
{IDENTIFIER}   return yy::parser::token_type::IDENTIFIER;
                
%%
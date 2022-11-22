%{
#include <string>
#include <iostream>
#include "nodes.h"
#include "parser.h"

#define SAVE_TOKEN yylval.string = new std::string(yytext, yyleng)
#define TOKEN(t) (yylval.token = t)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-register"
%}

NAT_NUMBER     [0-9][0-9]*(.[0-9]+)?
IDENTIFIER     [a-zA-Z][a-zA-Z0-9_]*

%%
[ \t\n]         ; // ignore whitespace
{IDENTIFIER}    { SAVE_TOKEN; return TOK_IDENTIFIER; }
{NAT_NUMBER}    { SAVE_TOKEN; return TOK_INTEGER; }
"="             { return TOK_ASSIGN; }
"=="            { return TOK_EQUAL; }
"!="            { return TOK_NEQUAL; }
"("             { return TOK_LPAREN; }
")"             { return TOK_RPAREN; }
"{"             { return TOK_LBRACE; }
"}"             { return TOK_RBRACE; }
","             { return TOK_COMMA; }
"+"             { return TOKEN(TOK_PLUS; }
"-"             { return TOKEN(TOK_MINUS); }
"*"             { return TOKEN(TOK_MUL); }
"/"             { return TOKEN(TOK_DIV); }

%%

int yywrap() {
  return 1;
}

#pragma clang diagnostic pop
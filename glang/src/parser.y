%language "c++"

%define api.value.type variant

%code requires {
    #include <string>
    #include <memory>
    namespace yy { class Driver; }
    namespace glang { class Node; class Scope; class FuncDeclare; }
}

%code {
    #include "driver.h"
    #include "ast.h"
    namespace yy {parser::token_type yylex(parser::semantic_type* yylval, Driver* driver);}
}

%token <std::string> IDENTIFIER 
%token <int> INTEGER
%token LCB               "{"
       RCB               "}"
       LRB               "("
       RRB               ")"
       LAB               "["
       RAB               "]"
       COMMA             ","
       ASSIGN            "="
       OR                "||" 
       AND               "&&"
       NOT               "!"
       EQUAL             "=="
       NOT_EQUAL         "!="
       GREATER           ">"
       LESS              "<"
       LESS_OR_EQUAL     "<="
       GREATER_OR_EQUAL  ">="
       PLUS              "+"  
       MINUS             "-"
       MUL               "*"
       DIV               "/"
       MOD               "%"
       WHILE             "while"   
       RETURN            "return"
       BREAK             "break"
       IF                "if"
       DEF               "def"
       SCOLON            ";"

%nterm<std::shared_ptr<glang::Scope>>     globalScope
%nterm<std::shared_ptr<glang::Scope>>     scope
%nterm<std::shared_ptr<glang::Scope>>     closeSc
%nterm<std::shared_ptr<glang::Scope>>     openSc
%nterm<std::shared_ptr<glang::Node>>      func
%nterm<std::shared_ptr<glang::FuncDeclare>>  funcSign
%nterm<std::shared_ptr<glang::Node>>      argList


%%

program:        globalScope                         { driver->codegen(); };

globalScope:    globalScope globalArrDecl           {
                                                        auto&& scope = driver->m_currentScope;
                                                        scope->insertChild($2);
                                                    };
              | globalScope func                    { 
                                                        auto&& scope = driver->m_currentScope;
                                                        scope->insertChild($2);
                                                    };
              | /* empty */                         {};

globalArrDecl:  IDENTIFIER LAB INTEGER RAB SCOLON   {
                                                        auto&& scope = driver->m_currentScope;
                                                        auto&& node = std::make_shared<glang::DeclGlobalArrN>($3);
                                                        node->setName($1);
                                                        $$ = node;
                                                        scope->insertDecl($1, node);
                                                    };
                                                    

func:           DEF funcSign states closeSc            {
                                                        auto&& scope = driver->m_currentScope;
                                                        $$ = std::make_shared<glang::FuncN>($4, $2);
                                                        auto&& defName = $2->getName();
                                                        scope->insertDecl(defName, $2);
                                                    };
funcSign:       IDENTIFIER LRB argList RRB LCB      {
                                                        auto&& scope = driver->m_currentScope;
                                                        scope = std::make_shared<glang::Scope>(scope);
                                                        auto&& currentFunctionArgs = driver->m_currentFunctionArgs;

                                                        for(const std::string& name : currentFunctionArgs) {
                                                            auto&& node = std::make_shared<glang::DeclVarN>();
                                                            scope->insertDecl(name, node);
                                                        }

                                                        $$ = std::make_shared<glang::FuncDeclare>($1, currentFunctionArgs);
                                                        scope->setParentFunc($$);
                                                        currentFunctionArgs.clear();
                                                    };

argList:        argList COMMA IDENTIFIER            {
                                                        auto&& currentFunctionArgs = driver->m_currentFunctionArgs;
                                                        currentFunctionArgs.push_back($3); 
                                                    };
              | IDENTIFIER                          {
                                                        auto&& currentFunctionArgs = driver->m_currentFunctionArgs;
                                                        currentFunctionArgs.push_back($1); 
                                                    };
              | /* empty */                         {};

scope:          openSc states closeSc                 {$$ = $3;};

openSc:         LCB                                 {
                                                        auto&& scope = driver->m_currentScope;
                                                        scope = std::make_shared<glang::Scope>(scope);
                                                    };

closeSc:        RCB                                 {
                                                        auto&& scope = driver->m_currentScope;
                                                        $$ = scope;
                                                        scope = scope->getParent();
                                                    };

states:           state                                 {
                                                        auto&& scope = driver->m_currentScope;
                                                        scope->insertChild($1);
                                                    };

              | states state                            {
                                                        auto&& scope = driver->m_currentScope;
                                                        scope->insertChild($2);
                                                    };

state:          DeclVar                             { $$ = $1; };
              | if                                  { $$ = $1; };
              | while                               { $$ = $1; };
              | output                              { $$ = $1; };
              | return                              { $$ = $1; };
              | funcCall SCOLON                     { $$ = $1; };
              | BREAK SCOLON                        { $$ = std::make_shared<glang::BreakOp>(); }

DeclVar:        lval ASSIGN startExpr SCOLON        { $$ = std::make_shared<glang::BinOpN>($1, glang::BinOp::Assign, $3); };

lval:           IDENTIFIER                          {
                                                        auto&& scope = driver->m_currentScope;
                                                        auto&& node = scope->getDeclIfAvailable($1);
                                                        if(!node) {
                                                            node = std::make_shared<glang::DeclVarN>();
                                                            scope->insertDecl($1, node);
                                                        }
                                                        $$ = node;
                                                    };
              | ArrAcceess                           { $$ = $1; };

ArrAcceess:      IDENTIFIER LAB startExpr RAB        {
                                                        auto&& scope = driver->m_currentScope;
                                                        auto&& node = scope->getDeclIfAvailable($1);
                                                        $$ = std::make_shared<glang::ArrAccessN>($3, node);
                                                    };
funcCall:       IDENTIFIER LRB argList RRB          {
                                                        auto&& scope = driver->m_currentScope;
                                                        auto&& currentFunctionArgs = driver->m_currentFunctionArgs;
                                                        auto&& node = scope->getDeclIfAvailable($1);
                                                        $$ = std::make_shared<glang::FuncCallN>(node, scope, currentFunctionArgs);
                                                        currentFunctionArgs.clear();
                                                    };

if:          IF LRB startExpr RRB scope             {
                                                        auto&& scope = driver->m_currentScope;
                                                        $$ = std::make_shared<glang::IfN>($5, $3, scope);
                                                    };

while:       WHILE LRB startExpr RRB scope          {
                                                        auto&& scope = driver->m_currentScope;
                                                        $$ = std::make_shared<glang::WhileN>($5, $3, scope);
                                                    };

output:      OUTPUT startExpr SCOLON                { $$ = std::make_shared<glang::UnOpN>(glang::UnOp::Output, $2); };

return:      RETURN startExpr SCOLON                { $$ = std::make_shared<glang::ReturnOp>($2); };

%%

namespace yy {

    parser::token_type yylex (parser::semantic_type* yylval, Driver* driver) {
		return driver->yylex(yylval);
	}

    void parser::error (const std::string& msg) {
        std::cout << msg << " in line: " << std::endl;
	}
}
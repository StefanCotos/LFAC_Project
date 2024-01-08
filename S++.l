%{
#include <stdio.h>
#include "S++.tab.h"
%}

%option noyywrap
%%
"normal" {yylval.string = strdup(yytext); return INT_TYPE;}
"different" {yylval.string = strdup(yytext); return FLOAT_TYPE;}
"unique" {yylval.string = strdup(yytext); return CHAR_TYPE;}
"special" {yylval.string = strdup(yytext); return STRING_TYPE;}
"decision" {yylval.string = strdup(yytext); return BOOL_TYPE;}
"good" {yylval.string = strdup(yytext); return BOOL_TRUE;}
"bad" {yylval.string = strdup(yytext); return BOOL_FALSE;}
"group" {return CLASS;}
"eq" {return EQUAL;}
"neq" {return NOT_EQUAL;}
"leq" {return LOWER_EQUAL;}
"geq" {return GREAT_EQUAL;}
":" {return ASSIGN;}
"import" {return IMPORT;} // cin
"export" {return EXPORT;} // cout
"give" {return GIVE;} // return
"_const_" {yylval.string = strdup(yytext); return CONST;}
"_&_" {return AND;}
"_|_" {return OR;}
"_!_" {return NOT;}
"_if_" {return IF_STATEMENT;}
"_else_" {return ELSE_STATEMENT;}
"_else_if_" {return ELSE_IF_STATEMENT;}
"_while_" {return WHILE_STATEMENT;}
"_for_" {return FOR_STATEMENT;}
"_loop_" {return LOOP_STATEMENT;}
"_stop_" {return STOP;}
"_+_" {return PLUS;}
"_-_" {return MINUS;}
"_*_" {return MUL;}
"_/_" {return DIV;}
"_%_" {return MOD;}
"Eval" {return EVAL;}
"TypeOf" {return TYPEOF;}
"func" {return DEF_FUNC;}

"main_start" {return MAIN_START;}
"main_stop" {return MAIN_STOP;}

[_][A-Za-z]+ {yylval.string = strdup(yytext); return ID;}
[A-Za-z] {yylval.char_type = (strdup(yytext)[0]); return CHAR;}
[A-Za-z]+ {yylval.string = strdup(yytext); return STRING;}
[0-9]+ {yylval.string = strdup(yytext); return NR;}

[ \t] ;
"\r"|"\n"|"\r\n" {yylineno++;}
. {return yytext[0];}

 
%%
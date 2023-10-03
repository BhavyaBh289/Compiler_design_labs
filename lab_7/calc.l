%{
#include "y.tab.h"
%}
%%
[0-9] { yylval.val=yytext;return (id);}
('-')|('+')|('*')|('/') { return (yytext);}
%%
int yywrap(){
return 1;
}

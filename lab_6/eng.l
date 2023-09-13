%{
#include "y.tab.h"
%}
%%
he|she|It { /*printf("\"%s\" is a pronoun\n",yytext);*/ return (pronoun);}
is|was|are { /*printf("\"%s\" is a verb\n",yytext);*/return (verb);}
a|an|the { /*printf("\"%s\" is a article\n",yytext);*/return (article);}
boy|girl { /*printf("\"%s\" is a noun\n",yytext);*/return (noun);}
"." { /*printf("\"%s\" is a fullstop\n",yytext);*/return (fs);}
"and"|"or" { /*printf("\"%s\" is a conj\n",yytext);*/return (conj);}
. {}
%%
int yywrap(){
return 1;
}

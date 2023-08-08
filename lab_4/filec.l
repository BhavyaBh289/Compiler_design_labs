digit [0-9]
letter [a-zA-Z]
%%
("void ")|("main ")|("printf") {printf("\n\"%s\" is keyword\n",yytext);}
{letter}({letter}|{digit}|_)* {printf("\n%s is a identifier\n",yytext); }
%%
void main(){
    yyin=fopen("1.c","r");
    yylex();
}

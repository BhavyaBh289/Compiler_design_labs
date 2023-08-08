digit [0-9]
letter [a-zA-Z]
%%
("void ")|("main ")|("printf")|("int ")|("char ")|("bool ") {fprintf(yyout,"\n\"%s\" is keyword\n",yytext);}
{letter}({letter}|{digit}|_)* {fprintf(yyout,"\n%s is a identifier\n",yytext); }
"%"{letter} {char t = yytext[1];/*fprintf(yyout,"\n%d\n",t);*/ if(t ==100){fprintf(yyout,"\ninteger\n");}}
"(" {fprintf(yyout,"in normal bracket\n");}
")" {fprintf(yyout,"out of normal bracket\n");}
"{" {fprintf(yyout,"in curly bracket\n");}
"}" {fprintf(yyout,"out of curly bracket\n");}
%%
void main(){
    yyin=fopen("1.c","r");
    yyout=fopen("2.c","w");
    yylex();
}

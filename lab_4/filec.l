digit [0-9]
letter [a-zA-Z]
%%
("void ")|("main ")|("printf")|("int ")|("char ")|("bool ") {fprintf(yyout,"\"%s\" is keyword\n",yytext);}
{letter}({letter}|{digit}|_)* {fprintf(yyout,"\"%s\" is a identifier\n",yytext); }
"%"{letter} {char t = yytext[1]; if(t ==100){fprintf(yyout,"integer\n");}}
"#include"({letter}|" "|digit|"<"|"."|">")* {{fprintf(yyout,"library %s \n",yytext);}}
("=")|("+")|("-")|("<")|(">") {}
("(")|(")")|("{")|("}") {/*fprintf(yyout,"bracket\n");*/}
";" {fprintf(yyout,"semicolon\n");}
(\n|" "|{digit}|"\""|",") {}

%%
void main(){
    yyin=fopen("1.c","r");
    yyout=fopen("1.txt","w");
    yylex();
}

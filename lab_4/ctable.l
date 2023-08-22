%{
#include<string.h>
char * keywords [] = {"void ","main ","printf","int ","char ","bool ","else","if","while"};

int keycheck [] ={0,0,0,0,0,0,0,0,0};
char* operators [] ={"+","-","=",";","(",")","{","}","[","]","<",">"};
int opcheck[] ={0,0,0,0,0,0,0,0,0,0,0,0};
char  identifiers [20][100];
int iddone=0;
void cpystr(char *target, char *source)
{
    while(*source)
    {
        *target = *source;
        source++;
        target++;
    }
    *target = '\0';
}
%}
digit [0-9]
letter [a-zA-Z]
%%
("void ")|("main ")|("printf")|("int ")|("char ")|("bool ")|("else")|("if") {for (int i = 0;i<9;i++){if(strcmp(yytext,keywords[i])==0){keycheck[i]=1;}}}
{letter}({letter}|{digit}|_)* {int i;for (i = 0;i<iddone;i++){if(strcmp(yytext,identifiers[i])==0){break;}}/*printf("%d",i);*/if(iddone==0){cpystr(identifiers[0],yytext); iddone++;}else{if(strcmp(yytext,identifiers[i])!=0){iddone++;cpystr(identifiers[iddone],yytext);}} /*if(strcmp(yytext,identifiers[i])==0){iddone++;strcpy(identifiers[iddone],yytext);*/}
"%"{letter} {char t = yytext[1]; if(t ==100){fprintf(yyout,"integer\n");}}
"#include"({letter}|" "|digit|"<"|"."|">")* {{fprintf(yyout,"library %s \n",yytext);}}
("=")|("+")|("-")|("<")|(">")|("(")|(")")|("{")|("}")|(";") {for (int i = 0;i<12;i++){if(strcmp(yytext,operators[i])==0){opcheck[i]=1;}}}
("\\n"|\n|" "|{digit}|"\""|",") {}

%%
void main(){

    yyin=fopen("1.c","r");
    yyout=fopen("2.txt","w");

    yylex();
    fprintf(yyout,"keywords are \n");
    for (int i = 0;i<9;i++){
/*         printf("%d",keycheck[i]); */
        if(keycheck[i]==1){
            fprintf(yyout,"%s, ",keywords[i]);
        }
    }
    fprintf(yyout,"\noperators are \n");
    for (int i = 0;i<12;i++){
/*         printf("%d",keycheck[i]); */
        if(opcheck[i]==1){
            fprintf(yyout,"\"%s\", ",operators[i]);
        }
    }
    fprintf(yyout,"\nidentifiers are \n");

    for (int i = 0;i<iddone;i++){
        fprintf(yyout,"%s ,",identifiers[i]);
    }
    fclose(yyin);
    fclose(yyout);
}

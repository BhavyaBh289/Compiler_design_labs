 
/* alphabet [0-9a-zA-Z] */
%{
    int charn, wordn, linen ;
%}

%%
[\n] {wordn++; linen++; printf("%dcharacters & %d words\n",charn,wordn); charn=0; wordn=0;}
[ ^ \t] {wordn++;printf("%dcharacters \n",charn); charn=0; }
. {charn++;}
%%
int main(void){
    yylex();
    printf(" %d lines\n",linen);
    return 0;
}
int yywrap( ){
    return 1;
}

/* alphabet [0-9a-zA-Z] */
%{
    int charn, wordn, linen ;
%}

%%
[\n] {wordn++; linen++; /*printf("%dcharachters & %d words\n",charn,wordn); charn=0; wordn=0;*/}
[ ^ \t] {wordn++;/*printf("%dcharachters \n",charn); charn=0;*/ }
. {charn++;}
%%
int main(void){
    yylex();
    printf("%d characters & %d words & %d lines\n", charn, wordn, linen);
    return 0;
}
int yywrap( ){
    return 1;
}

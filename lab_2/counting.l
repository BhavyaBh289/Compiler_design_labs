
%{
    int charn, wordn, linen ;
%}

%%
[\n] {wordn++; linen++;}
[ ^ \t] {wordn++; }
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

%{
    #include<stdio.h>

%}
%token pronoun noun verb article
%start  Sentence
%%
Sentence : sub verb article noun {printf("correct grammer");} ;
sub : noun | pronoun ;

%%
void yyerror(){
    printf("error");
}
int main(){
    yyparse();
    return 0;
}


%{
    #include<stdio.h>
%}
%token pronoun noun verb article fs conj
%start  Sentence
%%
Sentence : simple fs {printf("simple Sentence");} |
compound fs {printf("compound Sentence");}| Sentence Sentence ;
simple :sub verb article noun ;
compound: simple conj simple ;
sub : noun | pronoun ;

%%
void yyerror(){
    printf("error");
}
int main(){
    yyparse();
    return 0;
}


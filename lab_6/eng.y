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
    extern FILE * yyin;
    yyin=fopen("1.txt","r");
    while(!feof(yyin)){
        yyparse();
    }
    return 0;
}


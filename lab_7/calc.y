%{
    #include<stdio.h>
%}
%token id
%start  S
%union {
    int val;
}
%%
S : S '+' t     {$$ = $1+$3;}
    |S '-' t    {$$ = $1-$3;}
    | t         {$$ = $1;};
t : t '*' f     {$$ = $1*$3;}
    | t '/' f   {$$ = $1/$3;}
    | f         {$$ = $1;};
f : '(' S ')'   {$$ = $2;}
    | id        {$$ = $1;};

%%
void yyerror(){
    printf("error");
}
int main(){
    yyparse();
    return 0;
}


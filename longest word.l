%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap

%%

[a-zA-Z]+ {
    int len = strlen(yytext);
    if (len > max_length) {
        max_length = len;
    }
}

\n {
    printf("Length of the longest word: %d\n", max_length);
    max_length = 0;
}

. ;

%%

int max_length = 0;

int main() {
    yylex();
    return 0;
}

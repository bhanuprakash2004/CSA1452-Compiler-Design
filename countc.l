/* Ignore redundant spaces, tabs, and newlines */
[\ \t\n]+ ;

/* Ignore single-line comments */
\/\/.*?\n ;

/* Ignore multi-line comments */
%%
\/\*.*?\*\/ ;

/* Define regular expressions for tokens */
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]* { yylval = strdup(yytext); }

INTEGER [0-9]+ ;

OPERATOR [\+\-\*\/\%<>=!&|~^?] ;

STRING_LITERAL "\"" .*\"" ;

KEYWORD (int|return|printf|scanf|if|else|for|while|break|continue|do)[ \t\n]* ;

/* Count characters, lines, and words */
.|\n {
  char_count++;
  if (yytext[0] == '\n') {
    line_count++;
  }
  if (isalnum(yytext[0]) || yytext[0] == '_') {
    word_count++;
  }
}

/* Error handling */
.|\n { printf("LEX error: unrecognized character '%s'\n", yytext); exit(1); }

%%

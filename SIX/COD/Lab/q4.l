letter[a-zA-Z]
digit[0-9]

%%

{digit}+("E"("+"|"-")?{digit}+)? printf("\n%s\tis real number",yytext);  

%%


import lexer.com.compiler.*;
import lexer.utils.Symbols;

%%

%public
%class Lexer
%line
%column
%unicode
%debug

%{
  StringBuffer string = new StringBuffer();
  
  private Symbol constructSymbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }

  private Symbol constructSymbol(int type, Object value) {
  return new Symbol(type, yyline, yycolumn, value);
  }
%}



%type Symbol
%eofval{
    return constructSymbol(Symbols.EMPTY,"");
%eofval}

ALPHA=[A-Za-z]
DIGIT=[0-9]
NONZERO_DIGIT=[1-9]
NEWLINE=\r|\n|\r\n
WHITESPACE = {NEWLINE} | [ \t\f]
ID = {ALPHA}({ALPHA}|{DIGIT}|_)*
INT = (({NONZERO_DIGIT}+{DIGIT}*)|0)
FLOAT = {INT}(\.{DIGIT}+)
OPERATORS= = | \+ | - | \* | \/ | <-- | > | >= | < | <= | \!= | && | \|\| | \! | \^
STRING_TEXT = [^\"]*

%state STRING

%%


<YYINITIAL> {
  {OPERATORS}     {return constructSymbol(Symbols.OP);}
  ","             {return constructSymbol(Symbols.COLON);}    
  ";"             {return constructSymbol(Symbols.S_COLON);}    
  "("             {return constructSymbol(Symbols.L_PAR);}    
  ")"             {return constructSymbol(Symbols.R_PAR);}    
  "{"             {return constructSymbol(Symbols.L_CURLY);}    
  "}"             {return constructSymbol(Symbols.R_CURLY);}    
  
  \"{STRING_TEXT}\" {
    String stringWithNoQuotes =  yytext().substring(1,yylength()-1);
    return constructSymbol(Symbols.STRING,stringWithNoQuotes);
  }

  \"{STRING_TEXT} {
    String stringWithNoQuotes =  yytext().substring(1,yylength());
    return constructSymbol(Symbols.ERROR,stringWithNoQuotes);
  }

  {FLOAT}         {return constructSymbol(Symbols.FLOAT);}
  {INT}           {return constructSymbol(Symbols.INT);}
  {ID}            {return constructSymbol(Symbols.ID);}
  

}

{NEWLINE} { }
{WHITESPACE} { }

[^] { return constructSymbol(Symbols.ERROR); }


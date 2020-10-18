import lexer.com.compiler.*;
import lexer.utils.Tokens;

%%

%public
%class Lexer
%line
%char
%state COMMENT
%unicode

%debug

%{
  StringBuffer string = new StringBuffer();
  
  private Token constructToken(Tokens type) {
    return new Token(type.name(),yytext());
  }
  private Token constructToken(Tokens type,String attribute) {
    return new Token(type.name(),attribute);
  }
%}


%type Token
%eofval{
    return constructToken(Tokens.EMPTY,"");
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
  {OPERATORS}     {return constructToken(Tokens.OP);}
  ","             {return constructToken(Tokens.COLON);}    
  ";"             {return constructToken(Tokens.S_COLON);}    
  "("             {return constructToken(Tokens.L_PAR);}    
  ")"             {return constructToken(Tokens.R_PAR);}    
  "{"             {return constructToken(Tokens.L_CURLY);}    
  "}"             {return constructToken(Tokens.R_CURLY);}    
  
  \"{STRING_TEXT}\" {
    String stringWithNoQuotes =  yytext().substring(1,yylength()-1);
    return constructToken(Tokens.STRING,stringWithNoQuotes);
  }

  \"{STRING_TEXT} {
    String stringWithNoQuotes =  yytext().substring(1,yylength());
    return constructToken(Tokens.ERROR,stringWithNoQuotes);
  }

  {FLOAT}         {return constructToken(Tokens.FLOAT);}
  {INT}           {return constructToken(Tokens.INT);}
  {ID}            {return constructToken(Tokens.ID);}
  

}

{NEWLINE} { }
{WHITESPACE} { }

[^] { return constructToken(Tokens.ERROR); }


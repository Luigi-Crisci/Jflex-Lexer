package lexer.utils;

public enum Tokens {
    //Keywords
    IF,
    THEN,
    ELSE,
    WHILE,
    FOR,
    INT,
    FLOAT,
    ID,
    OP,
    //Separators
    L_PAR,
    R_PAR,
    L_CURLY,
    R_CURLY,
    COLON,
    S_COLON,
    STRING,
    ERROR,
    EMPTY;

    public static int compareTo(Tokens x,Tokens y) {
        for(Tokens currentTokens: values()){
            if(currentTokens.equals(x))
                return 1;
            if(currentTokens.equals(y))
                return -1;
        }
        return 0;
    }
}


package lexer.utils;

public class Symbols {
    //Keywords
    public static final int IF = 1;
    public static final int THEN = 2;
    public static final int ELSE = 3;
    public static final int WHILE = 4;
    public static final int FOR = 5;
    public static final int INT = 6;
    public static final int FLOAT = 7;
    public static final int ID = 8;
    public static final int OP = 9;
    // = Separators
    public static final int L_PAR = 10;
    public static final int R_PAR = 11;
    public static final int L_CURLY = 12;
    public static final int R_CURLY = 13;
    public static final int COLON = 14;
    public static final int S_COLON = 15;
    public static final int STRING = 16;
    public static final int ERROR = 17;
    public static final int EMPTY = 18;

    public static int compareTo(int x,int y) {
        return Integer.compare(x, y);
    }
}

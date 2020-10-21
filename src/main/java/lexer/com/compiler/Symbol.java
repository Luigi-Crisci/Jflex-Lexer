package lexer.com.compiler;

public class Symbol {
	
	int type;
	int x;
	int y;
	Object attribute;

	public Symbol(int type, int x, int y) {
		this.type = type;
		this.x = x;
		this.y = y;	
		attribute = null;
	}

	public Symbol(int type, int x, int y, Object attribute) {
		this.type = type;
		this.x = x;
		this.y = y;
		this.attribute = attribute;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public Object getAttribute() {
		return attribute;
	}

	public void setAttribute(Object attribute) {
		this.attribute = attribute;
	}

	@Override
	public String toString() {
		return "Symbol [attribute=" + attribute + ", type=" + type + ", x=" + x + ", y=" + y + "]";
	}


	
		
	
	
}

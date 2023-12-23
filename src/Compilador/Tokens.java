
package Compilador;

public enum Tokens {
    programa, 
    num,
    Entero("int"),
    Default ("default"),
    Float("float"),
    Boolean("boolean"),
    String("String"),
    litstring, 
    True("true"),
    False("false"),
    PuntoComa(";"),
    DosPuntos(":"),
    Coma(","),
    Suma("+"),
    Resta("-"),
    Producto("*"),
    Division("/"),
    AbreLLave("{"),
    CierreLLave("}"),
    AbreParentesis("("),
    CierraParentesis(")"),
    Igual("="),
    Menor("<"),
    Mayor(">"),
    Diferencia("!="),
    mI("<="),
    MI(">="),
    DobleIgual("=="),
    Switch("switch"),
    Do("do"),
    While("while"),
    Case("case"),
    Break("break"),
    print, 
    scan,
    id, 
    ERROR;
    
    private final String simbolo;

    private Tokens() {
        this.simbolo = null;
    }

    private Tokens(String simbolo) {
        this.simbolo = simbolo;
    }

    public String getSimbolo() {
        return simbolo;
    }
}

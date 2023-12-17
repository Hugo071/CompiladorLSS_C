
package Compilador;
import static Compilador.Tokens.*;
import java.util.Map;
import java.util.LinkedHashMap;

class Token {
    public String lexema;
    public String token;
    public int nLinea;

    public Token(String lexema, String token, int nLinea) {
        this.lexema = lexema;
        this.token = token;
        this.nLinea = nLinea;
    }

    public String getLexema() {
        return lexema;
    }

    public void setLexema(String lexema) {
        this.lexema = lexema;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getnLinea() {
        return nLinea;
    }

    public void setnLinea(int nLinea) {
        this.nLinea = nLinea;
    }
    
    @Override
    public String toString() {
        return super.toString(); 
    }
    
    
}

%%

%class Lexer
%type Tokens
%line
%column
%{
   public String lexeme;
   InfoTokens t = new InfoTokens();
   Map<String,Token> tablaSimbolos = new LinkedHashMap<>();
%}

terminadorDeLinea = \r|\n|\r\n
entradaDeCaracter = [^\r\n]
espacioEnBlanco = {terminadorDeLinea} | [ \t\f]
comentarioTradicional   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
finDeLineaComentario = "//" {entradaDeCaracter}* {terminadorDeLinea}?
contenidoComentario = ( [^*] | \*+ [^/*] )*
comentarioDeDocumentacion = "/**" {contenidoComentario} "*"+ "/"
comentario = {comentarioTradicional} | {finDeLineaComentario} | {comentarioDeDocumentacion}

letra = [a-zA-ZñÑ_$á-źÁ-Ź]
digito = [0-9]
espacio = [ ]+
caracter = \'(\\.|[^\'\\])?\'
carinc = \'(\\.|[^\'\\])?
flotante = (-?[1-9][0-9]*\.[0-9]*[1-9])|(0\.0)|(-?[1-9][0-9]*\.0)|(-?[1-9][0-9]*\.[0-9]*[1-9][eE][-+][1-9][0-9]*)|(-?0\.[0-9]*[1-9][eE][-+][1-9][0-9]*)
entero = (0|-?[1-9][0-9]*)
num = {entero} | {flotante}
tipo = entero|flotante|caracter|cadena|booleano

id = {letra}({letra}|{digito})*
%%

{comentario}|{espacioEnBlanco} { /* Ignorar */ }

/* Reservadas */
programa {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"programa",yyline); return programa;}
{num} {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"num",yyline); return num;}
int {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"int",yyline); return Entero;}
default {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"default",yyline); return Default;}
float {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"float",yyline); return Float;}
char {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"char",yyline); return Char;}
boolean {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"boolean",yyline); return Boolean;}
char {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"char",yyline); return Char;}
true {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"true",yyline); return True;}
false {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"false",yyline); return False;}
switch {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"switch",yyline); return Switch;}
do {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"do",yyline); return Do;}
while {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"while",yyline); return While;}
case {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"case",yyline); return Case;}
break {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"break",yyline); return Break;}
print {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"print",yyline); return print;}
scan {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"scan",yyline); return scan;}
";" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),";",yyline); return PuntoComa;}
":" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"°",yyline); return DosPuntos;}
"," {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),",",yyline); return Coma;}
"+" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"+",yyline); return Suma;}
"-" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"-",yyline); return Resta;}
"*" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"*",yyline); return Producto;}
"/" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"/",yyline); return Division;}
"{" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"{",yyline); return AbreLLave;}
"}" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"}",yyline); return CierreLLave;}
"(" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"(",yyline); return AbreParentesis;}
")" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),")",yyline); return CierraParentesis;}
"=" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),":=",yyline); return Igual;}
"<" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"<",yyline); return Menor;}
">" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),">",yyline); return Mayor;}
"!=" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"!=",yyline); return Diferencia;}
"<=" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"@",yyline); return mI;}
">=" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"#",yyline); return MI;}
"==" {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"==",yyline); return DobleIgual;}
{id} {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"id",yyline); tablaSimbolos.put(yytext(),t1); return id;}
{caracter} {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); Token t1 = new Token(yytext(),"vchar",yyline); return vchar;}
 . {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); return ERROR;}
   {carinc} {t.numeroLinea=yyline; t.lexema=yytext(); lexeme=yytext(); return ERROR;} 

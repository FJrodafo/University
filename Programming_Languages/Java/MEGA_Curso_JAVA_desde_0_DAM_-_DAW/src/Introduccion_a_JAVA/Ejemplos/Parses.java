package Introduccion_a_JAVA.Ejemplos;

public class Parses {
    public static void main(String[] args) {
        char n = '4';

        // String texto = Character.toString(n);
        // int a = Integer.parseInt(texto);
        int a = Character.getNumericValue(n);

        int b = 3, c = (int) Math.pow(a, b);
        System.out.println(c);
    }
}

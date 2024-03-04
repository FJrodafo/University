package Introduccion_a_JAVA.Ejemplos;

public class Escapes {
    public static void main(String[] args) {

        char character1 = '\u2605';
        char character2 = '\u27a0';

        String text = "\n\n\t" + character1 + " Esto es una cadena\n\t" + character2 + " Esto sigue siendo una cadena\n\n";

        System.out.println(text);
    }
}

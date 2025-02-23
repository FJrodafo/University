package Introduccion_a_JAVA.Ejemplos;

public class Cadenas {
    public static void main(String[] args) {

        String frase = "Java Master";
        int longitud = frase.length();

        System.out.println(frase);
        System.out.println(longitud);

        System.out.println(frase.length());
        System.out.println("[" + frase + "] tiene " + longitud + " carácteres.");

        frase = "Java es un lenguaje!";
        longitud = frase.length();

        System.out.println("[" + frase + "] tiene " + longitud + " carácteres.");

        int posicion = frase.indexOf("w");
        System.out.println("La posición de 'n' es: " + posicion);
        char letraN = frase.charAt(9);
        System.out.println("La posición 9 es: " + letraN);

        char primeraLetra = frase.charAt(0);
        System.out.println("La primera letra es: " + primeraLetra);
        System.out.println("La primera letra es: " + frase.charAt(0));

        char segundaLetra = frase.charAt(1);
        System.out.println("La segunda letra es: " + segundaLetra);
        System.out.println("La segunda letra es: " + frase.charAt(1));

        System.out.println("La última letra es: " + frase.charAt(frase.length() - 1));

        frase = "Java Master";
        char lastLetter = frase.charAt(frase.length() - 1);

        System.out.println("La última letra es: " + lastLetter);

        String fraseMayusculas = frase.toUpperCase();
        System.out.println(frase + " \u2192 " + fraseMayusculas);

        String fraseMinusculas = frase.toLowerCase();
        System.out.println(frase + " \u2192 " + fraseMinusculas);

        String palabra1 = frase.substring(0, 4);
        System.out.println(palabra1);

        String palabra2 = frase.substring(5, 11);
        System.out.println(palabra2);

        System.out.println(palabra1 + " " + palabra2);

        frase = "    Java Master    ";
        System.out.println(frase);

        String cortado = frase.trim();
        System.out.println(cortado);
        System.out.println(frase.trim());
    }
}

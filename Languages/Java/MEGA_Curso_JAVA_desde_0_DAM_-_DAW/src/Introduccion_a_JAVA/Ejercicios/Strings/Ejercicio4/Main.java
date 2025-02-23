package Introduccion_a_JAVA.Ejercicios.Strings.Ejercicio4;

import java.util.Scanner;

/*
 * Strings - Ejercicio 4
 * 
 * Crea un programa que reciba una palabra e indique si es un palíndromo.
 * Un palíndromo es una palabra que se lee igual de derecha a izquierda, que de izquierda a derecha.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce una palabra: Reconocer
 *     Salida:
 *         [reconocer] es un palíndromo!
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        String palabra = "", invertida = "";
        boolean palindromo = true;

        System.out.print("Introduce una palabra: ");
        palabra = teclado.nextLine().toLowerCase();

        // Primera solución: Invertir la palabra.
        for (int i = palabra.length() - 1; i >= 0; i--) {
            invertida += palabra.charAt(i);
        }
        if (palabra.equals(invertida)) {
            System.out.println("[" + palabra + "] es un palíndromo!");
        } else {
            System.out.println("[" + palabra + "] no es un palíndromo.");
        }

        // Segunda solución: Más eficiente.
        // Sin String auxiliar y menos vueltas del bucle.
        for (int i = 0; i < palabra.length() / 2; i++) {
            if (palabra.charAt(i) != palabra.charAt(palabra.length() - 1 - i)) {
                palindromo = false;
                break;
            }
        }
        if (palindromo) {
            System.out.println("[" + palabra + "] es un palíndromo!");
        } else {
            System.out.println("[" + palabra + "] no es un palíndromo.");
        }

        teclado.close();
    }
}

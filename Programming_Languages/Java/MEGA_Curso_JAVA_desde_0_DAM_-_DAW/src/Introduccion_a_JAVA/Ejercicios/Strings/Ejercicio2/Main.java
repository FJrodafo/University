package Introduccion_a_JAVA.Ejercicios.Strings.Ejercicio2;

import java.util.Scanner;

/*
 * Strings - Ejercicio 2
 * 
 * Crea un programa que reciba 5 palabras y luego nos muestre la que tiene una longitud mayor.
 * Si hay más de una palabra con la longitud mayor, se deberá mostrar la primera que aparezca.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Ada, Mesa, ab, c, Alba.
 *     Salida:
 *         Mesa
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        String palabra = "", palabraLarga = "";

        for (int i = 0; i < 5; i++) {
            System.out.print("Introduce una palabra (" + (i + 1) + " de 5): ");
            palabra = teclado.nextLine();

            if (palabra.length() > palabraLarga.length()) {
                palabraLarga = palabra;
            }
        }

        System.out.println("La palabra más larga es: " + palabraLarga);

        teclado.close();
    }
}

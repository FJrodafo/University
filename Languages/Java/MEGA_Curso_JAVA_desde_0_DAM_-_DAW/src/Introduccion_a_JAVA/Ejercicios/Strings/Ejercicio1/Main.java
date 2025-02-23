package Introduccion_a_JAVA.Ejercicios.Strings.Ejercicio1;

import java.util.Scanner;

/*
 * Strings - Ejercicio 1
 * 
 * Crea un programa que te pida una palabra y escriba las letras separadas por espacios.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce una palabra: Programación
 *     Salida:
 *         P r o g r a m a c i ó n
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        String palabra = "";

        System.out.print("Introduce una palabra: ");
        palabra = teclado.nextLine();

        for (int i = 0; i < palabra.length(); i++) {
            System.out.print(palabra.charAt(i) + " ");
        }

        System.out.println();

        teclado.close();
    }
}

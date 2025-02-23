package Introduccion_a_JAVA.Ejercicios.Strings.Ejercicio3;

import java.util.Scanner;

/*
 * Strings - Ejercicio 3
 * 
 * Crea un programa que reciba 5 palabras y luego nos muestre la que tiene una longitud mayor.
 * Si hay más de una palabra con la longitud mayor, se deberá mostrar la primera que aparezca.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce una frase: Hoy es viernes, 27 de octubre de 202?
 *     Salida:
 *         La frase tiene 8 palabras.
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        String frase = "";
        int palabras = 1;

        System.out.print("Introduce una frase: ");
        frase = teclado.nextLine().trim();

        for (int i = 0; i < frase.length(); i++) {
            if (frase.charAt(i) == ' ' && frase.charAt(i + 1) != ' ') {
                palabras++;
            }
        }

        if (frase.equals("")) {
            System.out.println("La frase no tiene ninguna palabra.");
        } else {
            System.out.println("La frase tiene " + palabras + " palabra" + (palabras > 1 ? "s." : "."));
        }

        teclado.close();
    }
}

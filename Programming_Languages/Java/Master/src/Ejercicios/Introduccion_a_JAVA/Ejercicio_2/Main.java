package Ejercicios.Introduccion_a_JAVA.Ejercicio_2;

import java.util.Scanner;

/*
 * Introducción a JAVA - Ejercicio 2
 * 
 * Dado un número entero positivo, determinar cuántos dígitos tiene.
 * 
 * EJEMPLO:
 *     Entrada:
 *         12749
 *     Salida:
 *         El número introducido tiene 5 dígitos.
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        System.out.print("Introduce un número entero positivo: ");
        int num = teclado.nextInt();
        int digitos = 1;

        if (num < 0) {
            System.out.println("No se puede introducir un número negativo.");
        } else {
            while (num > 9) {
                num /= 10;
                digitos++;
            }

            System.out.println("El número introducido tiene " + digitos + (digitos == 1 ? " cifra." : " cifras."));
        }

        teclado.close();
    }
}
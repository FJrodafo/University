package Introduccion_a_JAVA.Ejercicios.Iniciacion.Ejercicio1;

import java.util.Scanner;

/*
 * Introducción a JAVA - Ejercicio 1
 * 
 * Leer una cantidad 'N' y luego introducir 'N' números enteros.
 * Se pide imprimir el mayor, el menor y las veces que aparece cada uno.
 * 
 * EJEMPLO:
 *     Entrada:
 *         ¿Cuantos números quieres introducir?: 5
 * 
 *         Introduce un número (1 de 5): 3
 *         Introduce un número (2 de 5): 3
 *         Introduce un número (3 de 5): 8
 *         Introduce un número (4 de 5): 1
 *         Introduce un número (5 de 5): 8
 *     Salida:
 *         El mínimo es 1 y aparece 1 vez.
 *         El máximo es 8 y aparece 2 veces.
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        int cantidadNumeros, numActual;
        int contador = 0, contadorMax = 0, contadorMin = 0, max = Integer.MIN_VALUE, min = Integer.MAX_VALUE;

        System.out.print("¿Cuantos números quieres introducir?: ");
        cantidadNumeros = teclado.nextInt();
        System.out.println();

        while (contador < cantidadNumeros) {
            System.out.print("Introduce un número (" + (contador + 1) + " de " + cantidadNumeros + "): ");
            numActual = teclado.nextInt();

            // Máximo
            if (numActual > max) {
                max = numActual;
                contadorMax = 1;
            } else if (numActual == max) {
                contadorMax++;
            }
            // Mínimo
            if (numActual < min) {
                min = numActual;
                contadorMin = 1;
            } else if (numActual == min) {
                contadorMin++;
            }

            contador++;
        }

        System.out.println("\nEl mínimo es " + min + " y aparece " + contadorMin + (contadorMin == 1 ? " vez." : " veces."));
        System.out.println("El máximo es " + max + " y aparece " + contadorMax + (contadorMax == 1 ? " vez." : " veces."));

        teclado.close();
    }
}

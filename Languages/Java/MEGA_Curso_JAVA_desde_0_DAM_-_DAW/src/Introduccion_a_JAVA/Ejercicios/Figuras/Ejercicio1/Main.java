package Introduccion_a_JAVA.Ejercicios.Figuras.Ejercicio1;

import java.util.Scanner;

/*
 * Figuras - Ejercicio 1
 * 
 * Dibujar un rectángulo formado por asteriscos(*).
 * Se debe pedir base y altura del rectángulo.
 * Además, añade código adicional para que dibuje dicho rectángulo sin relleno.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce la base del rectángulo: 10
 *         Introduce la altura del rectángulo: 5
 *     Salida:
 *         * * * * * * * * * * 
 *         * * * * * * * * * * 
 *         * * * * * * * * * * 
 *         * * * * * * * * * * 
 *         * * * * * * * * * * 
 * 
 *         * * * * * * * * * * 
 *         *                 * 
 *         *                 * 
 *         *                 * 
 *         * * * * * * * * * * 
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        int base = 0, altura = 0;

        System.out.print("Introduce la base del rectángulo: ");
        base = teclado.nextInt();

        System.out.print("Introduce la altura del rectángulo: ");
        altura = teclado.nextInt();

        System.out.println();

        // Con relleno
        for (int i = 0; i < altura; i++) {
            for (int j = 0; j < base; j++) {
                System.out.print("* ");
            }
            System.out.println();
        }

        System.out.println();

        // Sin relleno
        for (int i = 0; i < altura; i++) {
            for (int j = 0; j < base; j++) {
                if (i == 0 || i == altura - 1 || j == 0 || j == base - 1) {
                    System.out.print("* ");
                } else {
                    System.out.print("  ");
                }
            }
            System.out.println();
        }

        teclado.close();
    }
}

package Introduccion_a_JAVA.Ejercicios.Figuras.Ejercicio2;

import java.util.Scanner;

/*
 * Figuras - Ejercicio 2
 * 
 * Dibujar un triángulo rectángulo formado por asteriscos(*).
 * Se debe pedir la altura del triángulo.
 * Además, añade código adicional para que dibuje dicho triángulo sin relleno.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce la altura del triángulo: 5
 *     Salida:
 *         * 
 *         * * 
 *         * * * 
 *         * * * * 
 *         * * * * * 
 * 
 *         * 
 *         * * 
 *         *   * 
 *         *     * 
 *         * * * * * 
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        int altura = 0;

        System.out.print("Introduce la altura del triángulo: ");
        altura = teclado.nextInt();

        System.out.println();

        // Con relleno
        for (int i = 0; i < altura; i++) {
            for (int j = 0; j <= i; j++) {
                System.out.print("* ");
            }
            System.out.println();
        }

        System.out.println();

        // Sin relleno
        for (int i = 0; i < altura; i++) {
            for (int j = 0; j <= i; j++) {
                if (i == 0 || i == altura - 1 || j == 0 || j == i) {
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

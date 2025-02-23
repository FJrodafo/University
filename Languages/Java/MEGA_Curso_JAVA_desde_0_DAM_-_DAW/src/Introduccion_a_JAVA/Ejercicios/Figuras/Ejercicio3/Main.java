package Introduccion_a_JAVA.Ejercicios.Figuras.Ejercicio3;

import java.util.Scanner;

/*
 * Figuras - Ejercicio 3
 * 
 * Dibujar un triángulo equilátero formado por asteriscos(*).
 * Se debe pedir la altura del triángulo.
 * Además, añade código adicional para que dibuje dicho triángulo sin relleno.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce la altura del triángulo: 5
 *     Salida:
 *                 * 
 *               * * * 
 *             * * * * * 
 *           * * * * * * * 
 *         * * * * * * * * * 
 * 
 *                 * 
 *               *   * 
 *             *       * 
 *           *           * 
 *         * * * * * * * * * 
 * 
 * 
 *                 *   
 *               *   *   
 *             *   *   *   
 *           *   *   *   *   
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        int altura = 0;

        System.out.print("Introduce la altura del triángulo: ");
        altura = teclado.nextInt();

        // altura --> 5
        // base = filas * 2 - 1 --> 9
        // 4 espacio 1 asterisco 4 espacio (indice 4)
        // 3 espacio 3 asterisco 3 espacio (indice 3, 4, 5)
        // 2 espacio 5 asterisco 2 espacio (indice 2, 3, 4, 5, 6)
        // 1 espacio 7 asterisco 1 espacio (indice 1, 2, 3, 4, 5, 6, 7)
        // 0 espacio 9 asterisco 0 espacio (indice 0, 1, 2, 3, 4, 5, 6, 7, 8)

        int base = altura * 2 - 1;

        System.out.println();

        // Con relleno
        for (int i = 0; i < altura; i++) {
            for (int j = 0; j < base; j++) {
                // Alternativa: if (j >= altura - 1 - i && j <= altura - 1 + i) {...
                if (j >= base / 2 - i && j <= base / 2 + i) {
                    System.out.print("* ");
                } else {
                    System.out.print("  ");
                }
            }
            System.out.println();
        }

        System.out.println();

        // Sin relleno
        for (int i = 0; i < altura; i++) {
            for (int j = 0; j < base; j++) {
                if (j == base / 2 - i || j == base / 2 + i || i == altura - 1) {
                    System.out.print("* ");
                } else {
                    System.out.print("  ");
                }
            }
            System.out.println();
        }

        System.out.println();

        // Especial
        for (int i = 0; i < altura; i++) {
            int cont = i % 2;
            for (int j = 0; j < base; j++) {
                if (j >= base / 2 - i && j <= base / 2 + i && cont % 2 == 1) {
                    System.out.print("* ");
                } else {
                    System.out.print("  ");
                }
                cont++;
            }
            System.out.println();
        }

        teclado.close();
    }
}

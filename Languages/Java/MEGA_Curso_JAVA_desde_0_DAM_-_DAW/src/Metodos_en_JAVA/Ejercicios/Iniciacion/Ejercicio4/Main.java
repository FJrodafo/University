package Metodos_en_JAVA.Ejercicios.Iniciacion.Ejercicio4;

import java.util.Scanner;

/*
 * Métodos en JAVA - Ejercicio 4
 * 
 * Utiliza el método del ejercicio anterior para que, dado un número, calcule su tabla de multiplicar del 1 al 10
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce un número: 4
 *     Salida:
 *         Tabla de multiplicar del 4
 *                  1 * 4 = 4
 *                  2 * 4 = 8
 *                  3 * 4 = 12
 *                  4 * 4 = 16
 *                  5 * 4 = 20
 *                  6 * 4 = 24
 *                  7 * 4 = 28
 *                  8 * 4 = 32
 *                  9 * 4 = 36
 *                 10 * 4 = 40
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        System.out.print("Introduce un número: ");
        int num = teclado.nextInt();

        tablaMult(num);

        teclado.close();
    }

    static int mult(int a, int b) {
        return a * b;
    }

    static void tablaMult(int num) {
        System.out.println("Tabla de multiplicar del " + num);
        for (int i = 1; i <= 10; i++) {
            if (i < 10) {
                System.out.println("\t " + i + " * " + num + " = " + mult(i, num));
            } else {
                System.out.println("\t" + i + " * " + num + " = " + mult(i, num));
            }
        }
    }
}

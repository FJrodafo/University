package Ejemplos;

import java.util.Date;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Matrix {
    public static void main(String[] args) {
        Date fecha = new Date();
        System.out.println("\n---- " + fecha + " ----\n");
        // BasicMatrix();
        RandomMatrix();
        System.out.println("\n---- Programa finalizado ----\n");
    }

    static void BasicMatrix() {
        int[][] matrix = { { 1, 4, 5 }, { 6, 7, 2, 4 }, { 8, 3 }, { 0, 4, 7, 1 } };
        // int[][] matrix = new int[10][10];
        for (int rows = 0; rows < matrix.length; rows++) {
            for (int cols = 0; cols < matrix[rows].length; cols++) {
                // matrix[rows][cols] = rows;
                // matrix[rows][cols] = cols;
                // matrix[rows][cols] = rows + cols;
                // matrix[rows][cols] = (rows + cols) % 9;
                System.out.print(matrix[rows][cols] + " ");
            }
            System.out.print("\n");
        }
    }

    static void RandomMatrix() {
        Scanner teclado = new Scanner(System.in);
        boolean salir;
        do {
            salir = false;
            try {
                System.out.print("Introduce el número de filas: ");
                int rows = teclado.nextInt();
                System.out.print("Introduce el número de columnas: ");
                int cols = teclado.nextInt();
                int[][] matrix = new int[rows][cols];
                System.out.print("\n");
                for (int i = 0; i < matrix.length; i++) {
                    for (int j = 0; j < matrix[i].length; j++) {
                        int numRandom = (int) (Math.random() * 9);
                        matrix[i][j] = numRandom;
                        System.out.print(matrix[i][j] + " ");
                    }
                    System.out.print("\n");
                }
                System.out.println("\nPosición matrix[2][4] equivalente a la fila 3 columna 5 --> " + matrix[2][4]);
                salir = true;
            } catch (InputMismatchException e) {
                System.out.println("Error al introducir un número.");
                teclado.next();
            } catch (ArrayIndexOutOfBoundsException e) {
                System.out.println("\nError! No existe la posición matrix[2][4]\n");
            }
        } while (!salir);
        teclado.close();
    }
}

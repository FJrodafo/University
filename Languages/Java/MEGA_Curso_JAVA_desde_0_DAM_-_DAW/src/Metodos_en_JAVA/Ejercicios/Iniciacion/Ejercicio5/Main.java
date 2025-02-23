package Metodos_en_JAVA.Ejercicios.Iniciacion.Ejercicio5;

import java.util.Scanner;

/*
 * Métodos en JAVA - Ejercicio 5
 * 
 * Implementa un método que dado un número diga si éste es par.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce un número: 5
 *     Salida:
 *         El número 5 es impar.
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        System.out.print("Introduce un número: ");
        int num = teclado.nextInt();

        mostrarParImpar(num);

        teclado.close();
    }

    static boolean esPar(int num) {
        return num % 2 == 0 ? true : false;
    }

    static void mostrarParImpar(int num) {
        if (esPar(num)) {
            System.out.println("El número " + num + " es par.");
        } else {
            System.out.println("El número " + num + " es impar.");
        }
    }
}

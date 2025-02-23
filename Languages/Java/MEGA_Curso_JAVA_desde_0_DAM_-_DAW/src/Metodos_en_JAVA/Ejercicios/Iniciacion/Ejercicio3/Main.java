package Metodos_en_JAVA.Ejercicios.Iniciacion.Ejercicio3;

import java.util.Scanner;

/*
 * Métodos en JAVA - Ejercicio 3
 * 
 * Implementa un método que, dados dos números, los multiplique.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce el primer número: 3
 *         Introduce el segundo número: 6
 *     Salida:
 *         3 * 6 = 18
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        int num1 = 0, num2 = 0;

        System.out.print("Introduce el primer número: ");
        num1 = teclado.nextInt();
        System.out.print("Introduce el segundo número: ");
        num2 = teclado.nextInt();

        System.out.println(num1 + " * " + num2 + " = " + mult(num1, num2));

        teclado.close();
    }

    static int mult(int a, int b) {
        return a * b;
    }
}

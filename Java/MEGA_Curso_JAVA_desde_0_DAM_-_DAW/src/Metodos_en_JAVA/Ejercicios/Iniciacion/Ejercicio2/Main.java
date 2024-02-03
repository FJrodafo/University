package Metodos_en_JAVA.Ejercicios.Iniciacion.Ejercicio2;

import java.util.Scanner;

/*
 * Métodos en JAVA - Ejercicio 2
 * 
 * Implementa un método que, dado un número entero, calcule el cubo.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce un número: 5
 *     Salida:
 *         El cubo de 5 es 125
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        System.out.print("Introduce un número: ");
        int num = teclado.nextInt();

        System.out.println("El cubo de " + num + " es " + cubo(num));

        teclado.close();
    }

    static int cubo(int num) {
        return num * num * num;
    }
}

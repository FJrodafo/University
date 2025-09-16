package Metodos_en_JAVA.Ejercicios.Recursividad.Ejercicio3;

import java.util.Scanner;

/*
 * Recursividad en JAVA - Ejercicio 1
 * 
 * Implementa un método que dado un número entero positivo, lo imprima invertido por pantalla.
 * El número se debe pasar como parámetro.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce un número: 145
 *     Salida:
 *         Número invertido: 541
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        System.out.print("Introduce un número: ");
        int num = teclado.nextInt();

        System.out.print("Número invertido: ");

        invertir(num);

        teclado.close();

        // final int NUM = 145;
        // mostrarNumeroInvertido(NUM);
    }

    static void invertir(int num) {
        if (num >= 0 && num < 10) {
            System.out.println(num);
        } else {
            System.out.print(num % 10);
            invertir(num / 10);
        }
    }

    static void mostrarNumeroInvertido(int num) {
        System.out.print("Número invertido: ");
        invertir(num);
    }
}

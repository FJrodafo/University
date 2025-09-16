package Metodos_en_JAVA.Ejercicios.Recursividad.Ejercicio2;

import java.util.Scanner;

/*
 * Recursividad en JAVA - Ejercicio 1
 * 
 * Implementa un método que obtenga el resultado de elevar un número a otro.
 * Ambos números se deben pasar como parámetros.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce la base: 2
 *         Introduce el exponente: 5
 *     Salida:
 *         2 elevado a 5 es igual a 32
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        System.out.print("Introduce la base: ");
        int base = teclado.nextInt();

        System.out.print("Introduce el exponente: ");
        int exponente = teclado.nextInt();

        System.out.println(base + " elevado a " + exponente + " es igual a " + potencia(base, exponente));

        teclado.close();

        // final int BASE = 2;
        // final int EXPONENTE = 5;
        // mostrarPotencia(BASE, EXPONENTE);
    }

    static int potencia(int base, int exponente) {
        if (exponente == 0) {
            return 1;
        } else {
            return base * potencia(base, --exponente);
        }
    }

    static void mostrarPotencia(int base, int exponente) {
        int potencia = potencia(base, exponente);
        System.out.println(base + " elevado a " + exponente + " es igual a " + potencia);
    }
}

package Metodos_en_JAVA.Ejercicios.Recursividad.Ejercicio1;

import java.util.Scanner;

/*
 * Recursividad en JAVA - Ejercicio 1
 * 
 * Implementa un método que obtenga la cantidad de dígitos de un número entero positivo.
 * El número se debe pasar como parámetro.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce un número entero positivo: 144
 *     Salida:
 *         El número 144 tiene 3 dígitos.
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        System.out.print("Introduce un número entero positivo: ");
        int num = teclado.nextInt();

        System.out.println("El número " + num + " tiene " + digitos(num) + (digitos(num) > 1 ? " dígitos." : " dígito."));

        teclado.close();

        // final int NUM = 144;
        // mostrarDigitos(NUM);
    }

    static int digitos(int num) {
        if (num <= 0) {
            return 0;
        } else {
            return 1 + digitos(num / 10);
        }
    }

    static void mostrarDigitos(int num) {
        int digitos = digitos(num);
        System.out.println("El número " + num + " tiene " + digitos + (digitos > 1 ? " dígitos." : " dígito."));
    }
}

package Introduccion_a_JAVA.Ejercicios.Iniciacion.Ejercicio3;

import java.util.Scanner;

/*
 * Introducción a JAVA - Ejercicio 3
 * 
 * Escribir un programa que pida números enteros positivos hasta que se introduzca un cero.
 * A continuación debe mostrar la suma total de dichos números.
 * Se deben incluir todos los números positivos que hemos ido introduciendo por teclado.
 * No se pueden utilizar Arrays.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce un número entero positivo (0 para terminar): 3
 *         Introduce un número entero positivo (0 para terminar): 4
 *         Introduce un número entero positivo (0 para terminar): 5
 *         Introduce un número entero positivo (0 para terminar): 6
 *         Introduce un número entero positivo (0 para terminar): -2
 *         Introduce un número entero positivo (0 para terminar): 8
 *         Introduce un número entero positivo (0 para terminar): 0
 *     Salida:
 *         3 + 4 + 5 + 6 + 8 = 26
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        int num = 0, total = 0;
        String resultado = "";

        do {
            System.out.print("Introduce un número entero positivo (0 para terminar): ");
            num = teclado.nextInt();

            if (num > 0) {
                total += num;
                resultado += num + " + ";
            }
        } while (num != 0);

        System.out.println(resultado + "\b\b= " + total);

        teclado.close();
    }
}

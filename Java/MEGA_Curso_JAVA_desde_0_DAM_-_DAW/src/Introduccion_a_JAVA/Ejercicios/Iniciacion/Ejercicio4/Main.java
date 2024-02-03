package Introduccion_a_JAVA.Ejercicios.Iniciacion.Ejercicio4;

import java.util.Scanner;

/*
 * Introducción a JAVA - Ejercicio 4
 * 
 * Dada una secuencia de números enteros positivos acabada en 0.
 * Obtener la suma de aquellos números tales que su número de dígitos sea igual a la suma de las mismas.
 * No se pueden utilizar Arrays.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce un número entero positivo (0 para terminar): 1
 *         Introduce un número entero positivo (0 para terminar): -111
 *         Introduce un número entero positivo (0 para terminar): 5
 *         Introduce un número entero positivo (0 para terminar): 111
 *         Introduce un número entero positivo (0 para terminar): 66
 *         Introduce un número entero positivo (0 para terminar): 201
 *         Introduce un número entero positivo (0 para terminar): 27
 *         Introduce un número entero positivo (0 para terminar): 0
 *     Salida:
 *         1 + 111 + 201 = 313
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        String resultado = "";
        int num = 0, total = 0;

        do {
            System.out.print("Introduce un número entero positivo (0 para terminar): ");
            num = teclado.nextInt();

            int digitos = 1;
            int suma = num % 10;
            int aux = num;

            while (aux > 9) {
                aux /= 10;
                digitos++;
                suma += aux % 10;
            }

            if (digitos == suma) {
                resultado += num + " + ";
                total += num;
            }
        } while (num != 0);

        System.out.println(resultado + "\b\b= " + total);

        teclado.close();
    }
}

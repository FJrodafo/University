package Metodos_en_JAVA.Ejercicios.Iniciacion.Ejercicio6;

import java.util.Scanner;

/*
 * Métodos en JAVA - Ejercicio 6
 * 
 * Implementa un método para mostrar un menú de 6 opciones, con su número correspondiente, la última opción será para salir.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce un número: 6
 *     Salida:
 *         Menú principal
 *         Selecciona una opción entre 1 y 6
 *         1 - Esta es la opción 1
 *         2 - Esta es la opción 2
 *         3 - Esta es la opción 3
 *         4 - Esta es la opción 4
 *         5 - Esta es la opción 5
 *         6 - Salir
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        System.out.print("Introduce un número: ");
        int num = teclado.nextInt();

        menu(num);

        teclado.close();
    }

    static void menu(int opciones) {
        System.out.println("Menú principal\nSelecciona una opción entre 1 y " + opciones);
        for (int i = 1; i < opciones; i++) {
            System.out.println(i + " - Esta es la opción " + i);
        }
        System.out.println(opciones + " - Salir");
    }
}

package Metodos_en_JAVA.Ejercicios.Iniciacion.Ejercicio1;

import java.util.Scanner;

/*
 * Métodos en JAVA - Ejercicio 1
 * 
 * Implementa un método que, dado un nombre, muestre un saludo.
 * 
 * EJEMPLO:
 *     Entrada:
 *         Introduce un nombre: Fran
 *     Salida:
 *         ¡Hola Fran! ¿Qué tal estás?
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        System.out.print("Introduce un nombre: ");
        String nombre = teclado.nextLine();

        saludar(nombre);

        teclado.close();
    }

    static void saludar(String nombre) {
        System.out.println("¡Hola " + nombre + "! ¿Qué tal estás?");
    }
}

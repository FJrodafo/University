package Introduccion_a_JAVA.Ejemplos;

import java.util.Scanner; // Importamos la libraría del escáner

public class EscanerTeclado {
    public static void main(String[] args) {

        // Llamada al escáner
        Scanner teclado = new Scanner(System.in);

        // Variables
        int n;
        String nombre;

        System.out.print("Introduzca un número entero: ");
        n = teclado.nextInt();
        teclado.nextLine();
        System.out.println("El cuadrado de " + n + " es " + (int) Math.pow(n, 2));

        System.out.print("Introduzca su nombre: ");
        nombre = teclado.nextLine();
        System.out.println("Hola " + nombre + "!");

        // Cerrar el escáner
        teclado.close();
    }
}

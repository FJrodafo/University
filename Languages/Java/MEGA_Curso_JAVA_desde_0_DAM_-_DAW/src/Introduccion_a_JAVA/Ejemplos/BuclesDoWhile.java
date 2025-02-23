package Introduccion_a_JAVA.Ejemplos;

import java.util.Scanner;

public class BuclesDoWhile {
    public static void main(String[] args) {

        Scanner teclado = new Scanner(System.in);

        int n = 0;
        int total = 0;

        do {
            System.out.print("Introduce un número distinto a cero para seguir el bucle: ");
            n = teclado.nextInt();
            total += n;
        } while (n != 0);

        System.out.println("La suma es: " + total);

        teclado.close();
    }
}

package Introduccion_a_JAVA.Ejemplos;

import java.util.Scanner;

public class BuclesFor {
    public static void main(String[] args) {

        for (int i = 0; i <= 10; i++) {
            System.out.print(i + " ");
        }
        System.out.println();

        Scanner teclado = new Scanner(System.in);

        double media = 0;

        System.out.print("Introduce cuántos números quieres: ");
        int cantidadNumeros = teclado.nextInt();

        for (int i = 0; i < cantidadNumeros; i++) {
            System.out.print("Introduce un número (" + (i + 1) + " de " + cantidadNumeros + "): ");
            int num = teclado.nextInt();
            media += num;
        }

        System.out.println("La media es: " + (media / cantidadNumeros));

        teclado.close();
    }
}

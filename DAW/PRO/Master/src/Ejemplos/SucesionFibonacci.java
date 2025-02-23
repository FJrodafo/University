package Ejemplos;

import java.util.Date;

public class SucesionFibonacci {
    public static void main(String[] args) {
        Date fecha = new Date();
        System.out.println("\n---- " + fecha + " ----\n");
        int a = 0, b = 1, c = 0;
        for (int i = 0; i < 10; i++) {
            System.out.print(a + " ");
            c = a + b;
            a = b;
            b = c;
        }
        System.out.println();
        System.out.println("\n---- Programa finalizado ----\n");
    }
}

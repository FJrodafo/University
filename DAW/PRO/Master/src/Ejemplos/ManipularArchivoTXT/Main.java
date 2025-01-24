package Ejemplos.ManipularArchivoTXT;

import java.util.Date;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        ManipularArchivoTXT txt = new ManipularArchivoTXT();
        int opcion = 0;
        boolean salir = false;
        Date fecha = new Date();
        System.out.println("\n---- " + fecha + " ----\n");
        Scanner teclado = new Scanner(System.in);
        do {
            String menu = "    MENU\n1 - Escribir\n2 - Leer\n3 - Resetear\n4 - Salir";
            Menu.mostrarMenu(menu);
            try {
                System.out.print("Elige una opción: ");
                opcion = teclado.nextInt();
            } catch (InputMismatchException e) {
                teclado.next();
            }
            switch (opcion) {
                case 1:
                    txt.EscribirArchivoTXT();
                    break;
                case 2:
                    txt.LeerArchivoTXT();
                    break;
                case 3:
                    txt.ResetearArchivoTXT();
                    break;
                case 4:
                    salir = true;
                    break;
                default:
                    System.out.println("Debes introducir un número del 1 al 4");
                    break;
            }
        } while (!salir);
        teclado.close();
        System.out.println("\n---- Programa finalizado ----\n");
    }
}

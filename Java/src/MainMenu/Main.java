package MainMenu;

import java.util.Date;
import java.util.InputMismatchException;
import java.util.Locale;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        int opcion = 0;
        boolean salir = false;
        Date fecha = new Date();
        System.out.println("\n---- " + fecha + " ----\n");
        Scanner teclado = new Scanner(System.in);
        teclado.useDelimiter("\n");
        teclado.useLocale(Locale.US);
        do {
            String menu = "    MENU\n1 - Opción\n2 - Opción\n3 - Opción\n4 - Salir";
            Menu.mostrarMenu(menu);
            try {
                System.out.print("Elige una opción: ");
                opcion = teclado.nextInt();
            } catch (InputMismatchException e) {
                teclado.next();
            }
            switch (opcion) {
                case 1:
                    System.out.println("Elegiste la primera opción");
                    break;
                case 2:
                    System.out.println("Elegiste la segunda opción");
                    break;
                case 3:
                    System.out.println("Elegiste la tercera opción");
                    break;
                case 4:
                    System.out.println("Elegiste la cuarta opción");
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

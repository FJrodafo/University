package Ejercicios.MiTienda;

import java.util.Date;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Tienda tienda = new Tienda();
        int opcion = 0;
        boolean salir = false;
        Date fecha = new Date();
        System.out.println("\n---- " + fecha + " ----\n");
        Scanner teclado = new Scanner(System.in);
        do {
            String menu = "    MENU\n1 - Agregar producto\n2 - Eliminar producto\n3 - Buscar producto\n4 - Listar productos\n5 - Salir";
            Menu.mostrarMenu(menu);
            try {
                System.out.print("Elige una opción: ");
                opcion = teclado.nextInt();
            } catch (InputMismatchException e) {
                teclado.next();
            }
            switch (opcion) {
                case 1:
                    tienda.agregarProducto();
                    break;
                case 2:
                    tienda.eliminarProducto();
                    break;
                case 3:
                    tienda.buscarProducto();
                    break;
                case 4:
                    tienda.listarProductos();
                    break;
                case 5:
                    salir = true;
                    break;
                default:
                    System.out.println("Debes introducir un número del 1 al 5");
                    break;
            }
        } while (!salir);
        teclado.close();
        System.out.println("\n---- Programa finalizado ----\n");
    }
}

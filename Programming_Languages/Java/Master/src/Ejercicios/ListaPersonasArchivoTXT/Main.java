package Ejercicios.ListaPersonasArchivoTXT;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        ListaPersonas ap = new ListaPersonas();
        int opcion = 0;
        boolean salir = false;
        Date fecha = new Date();
        System.out.println("\n---- " + fecha + " ----\n");
        Scanner teclado = new Scanner(System.in);
        try {
            // Esta parte del código resetea la lista cada vez que se reinicia el programa
            BufferedWriter fw = new BufferedWriter(new FileWriter("src/Ejercicios/ListaPersonasArchivoTXT/ListaPersonas.txt"));
            fw.write("Nombre, Edad [Género]");
            fw.close();
        } catch (IOException e) {
            System.out.println(e);
        }
        do {
            String menu = "    MENU\n1 - Agregar persona\n2 - Eliminar persona\n3 - Buscar persona\n4 - Listar personas\n5 - Salir";
            Menu.mostrarMenu(menu);
            try {
                System.out.print("Elige una opción: ");
                opcion = teclado.nextInt();
            } catch (InputMismatchException e) {
                teclado.next();
            }
            switch (opcion) {
                case 1:
                    ap.agregarPersona();
                    break;
                case 2:
                    ap.eliminarPersona();
                    break;
                case 3:
                    ap.buscarPersona();
                    break;
                case 4:
                    ap.listarPersonas();
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

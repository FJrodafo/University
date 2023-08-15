package Ejercicios.Games;

import java.util.Date;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        IGames dados = new Dados();
        IGames adivinaNumero = new AdivinaNumero();
        IGames palabraSecreta = new PalabraSecreta();
        IGames carreraCoches = new CarreraCoches();
        int opcion = 0;
        boolean salir = false;
        Date fecha = new Date();
        System.out.println("\n---- " + fecha + " ----\n");
        Scanner teclado = new Scanner(System.in);
        do {
            String menu = "    MENU\n1 - Dados\n2 - Adivina el número\n3 - Palabra secreta\n4 - Carrera de coches\n5 - Salir";
            Menu.mostrarMenu(menu);
            try {
                System.out.print("Elige una opción: ");
                opcion = teclado.nextInt();
            } catch (InputMismatchException e) {
                teclado.next();
            }
            switch (opcion) {
                case 1:
                    dados.inicio();
                    dados.desarrollo();
                    dados.fin();
                    break;
                case 2:
                    adivinaNumero.inicio();
                    adivinaNumero.desarrollo();
                    adivinaNumero.fin();
                    break;
                case 3:
                    palabraSecreta.inicio();
                    palabraSecreta.desarrollo();
                    palabraSecreta.fin();
                    break;
                case 4:
                    carreraCoches.inicio();
                    carreraCoches.desarrollo();
                    carreraCoches.fin();
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

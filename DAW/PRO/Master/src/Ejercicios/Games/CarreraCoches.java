package Ejercicios.Games;

import java.util.InputMismatchException;
import java.util.Random;
import java.util.Scanner;

public class CarreraCoches implements IGames {
    // Atributos
    private String jugador1, jugador2, cocheJugador1, cocheJugador2;
    private int posicionJugador1, posicionJugador2, meta;
    private boolean valido;
    // Declaramos el escáner
    private Scanner teclado;

    // Constructor
    public CarreraCoches() {
        jugador1 = null;
        jugador2 = null;
        cocheJugador1 = null;
        cocheJugador2 = null;
        posicionJugador1 = 0;
        posicionJugador2 = 0;
        meta = 100;
        valido = false;
        teclado = new Scanner(System.in);
    }

    @Override
    public void inicio() {
        System.out.println("Bienvenido al juego Carrera de coches!");
        System.out.println("El primero en llegar a 100 gana la carrera.");
        do {
            valido = false;
            System.out.print("Jugador 1, introduce tu nombre: ");
            this.jugador1 = teclado.nextLine();
            if (jugador1.isBlank()) {
                System.out.println("El nombre del jugador 1 no puede estar vacío.");
            } else {
                valido = true;
            }
        } while (!valido);
        do {
            valido = false;
            System.out.print("Jugador 2, introduce tu nombre: ");
            this.jugador2 = teclado.nextLine();
            if (jugador2.isBlank()) {
                System.out.println("El nombre del jugador 2 no puede estar vacío.");
            } else {
                valido = true;
            }
        } while (!valido);
        String menu = "1. Coche rojo\n2. Coche azul\n3. Coche verde\n4. Coche amarillo";
        Menu.mostrarMenu(menu);
        do {
            try {
                valido = false;
                System.out.print(jugador1 + " selecciona tu coche: ");
                this.cocheJugador1 = seleccionarCoche();
                valido = true;
            } catch (InputMismatchException e) {
                System.out.println("Debes introducir un número del 1 al 4");
                teclado.next();
            }
        } while (!valido);
        do {
            try {
                valido = false;
                System.out.print(jugador2 + " selecciona tu coche: ");
                this.cocheJugador2 = seleccionarCoche();
                valido = true;
            } catch (InputMismatchException e) {
                System.out.println("Debes introducir un número del 1 al 4");
                teclado.next();
            }
        } while (!valido);
        System.out.println("Que comience la carrera!");
    }

    @Override
    public void desarrollo() {
        Random random = new Random();
        while (this.posicionJugador1 < this.meta && this.posicionJugador2 < this.meta) {
            teclado.nextLine();
            int tiradaJugador1 = random.nextInt(6) + 1;
            int tiradaJugador2 = random.nextInt(6) + 1;
            this.posicionJugador1 += tiradaJugador1;
            this.posicionJugador2 += tiradaJugador2;
            System.out.println(this.jugador1 + " ha sacado un " + tiradaJugador1 + " en los dados. Posición de " + this.jugador1 + ": " + this.posicionJugador1 + "/100");
            System.out.println(this.jugador2 + " ha sacado un " + tiradaJugador2 + " en los dados. Posición de " + this.jugador2 + ": " + this.posicionJugador2 + "/100");
            System.out.print("Presiona Enter para continuar...");
        }
    }

    @Override
    public void fin() {
        System.out.println();
        if (this.posicionJugador1 >= this.meta) {
            System.out.println(this.jugador1 + " ha ganado la carrera con su coche " + this.cocheJugador1 + "!");
        } else {
            System.out.println(this.jugador2 + " ha ganado la carrera con su coche " + this.cocheJugador2 + "!");
        }
    }

    /**
     * 
     * @return case 1, 2, 3, 4 or default
     */
    private String seleccionarCoche() {
        int opcion = teclado.nextInt();
        switch (opcion) {
            case 1:
                return "rojo";
            case 2:
                return "azul";
            case 3:
                return "verde";
            case 4:
                return "amarillo";
            default:
                return "sin pintar";
        }
    }
}

package Ejercicios.Games;

import java.util.Scanner;

public class Dados implements IGames {
    // Atributos
    private String jugador1, jugador2;
    private int resultadoJugador1, resultadoJugador2;
    private boolean valido;
    // Declaramos el escáner
    private Scanner teclado;

    // Constructor
    public Dados() {
        jugador1 = null;
        jugador2 = null;
        resultadoJugador1 = 0;
        resultadoJugador2 = 0;
        valido = false;
        teclado = new Scanner(System.in);
    }

    @Override
    public void inicio() {
        System.out.println("Bienvenido al juego Dados!");
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
    }

    @Override
    public void desarrollo() {
        System.out.println("Comencemos!");
        resultadoJugador1 = (int) (Math.random() * 6) + 1;
        resultadoJugador2 = (int) (Math.random() * 6) + 1;
        System.out.println(jugador1 + " lanzó un dado y sacó un " + resultadoJugador1);
        System.out.println(jugador2 + " lanzó un dado y sacó un " + resultadoJugador2);
    }

    @Override
    public void fin() {
        if (resultadoJugador1 > resultadoJugador2) {
            System.out.println(jugador1 + " ganó la partida!");
        } else if (resultadoJugador1 < resultadoJugador2) {
            System.out.println(jugador2 + " ganó la partida!");
        } else {
            System.out.println("Empate!");
        }
    }
}

package Ejercicios.Games;

import java.util.InputMismatchException;
import java.util.Scanner;

public class AdivinaNumero implements IGames {
    // Atributos
    private int numeroAleatorio, tuNumero, intentos;
    // Declaramos el escáner
    private Scanner teclado;

    // Constructor
    public AdivinaNumero() {
        numeroAleatorio = 0;
        tuNumero = 0;
        intentos = 1;
        teclado = new Scanner(System.in);
    }

    @Override
    public void inicio() {
        System.out.println("Bienvenido al juego Adivina el número!");
        numeroAleatorio = (int) (Math.random() * 10) + 1;
        intentos = 1;
    }

    @Override
    public void desarrollo() {
        try {
            System.out.print("Adivina un número entre 1 y 10: ");
            tuNumero = teclado.nextInt();
        } catch (InputMismatchException e) {
            teclado.next();
        }
        if (tuNumero == numeroAleatorio) {
            System.out.print("Ganaste!");
        } else {
            System.out.println("No adivinaste, intenta de nuevo...");
            intentos++;
            desarrollo();
        }
    }

    @Override
    public void fin() {
        System.out.println(" Número de intentos: " + intentos);
    }
}

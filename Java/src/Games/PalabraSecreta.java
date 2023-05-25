package Games;

import java.util.Random;
import java.util.Scanner;

public class PalabraSecreta implements IGames {
    // Constantes
    private final String[] palabras = { "programacion", "programar", "programador", "programadora", "java", "teclado", "juegos", "adivinar" };
    private final int MAX_OPORTUNIDADES = 6;
    // Variables
    private String palabraSecreta;
    private int oportunidadesRestantes;
    private char[] letrasAdivinadas;
    // Declaramos el escáner
    Scanner teclado = new Scanner(System.in);

    // Constructor
    public PalabraSecreta() {
        this.palabraSecreta = palabras[new Random().nextInt(palabras.length)];
        this.oportunidadesRestantes = MAX_OPORTUNIDADES;
        this.letrasAdivinadas = new char[palabraSecreta.length()];
        for (int i = 0; i < palabraSecreta.length(); i++) {
            letrasAdivinadas[i] = '_';
        }
    }

    @Override
    public void inicio() {
        System.out.println("Bienvenido al juego Palabra secreta!");
        System.out.println("El objetivo del juego es adivinar la palabra secreta.");
        System.out.println("La palabra secreta está compuesta por " + palabraSecreta.length() + " letras.");
        System.out.println("Tienes " + MAX_OPORTUNIDADES + " oportunidades para adivinar.");
    }

    @Override
    public void desarrollo() {
        while (oportunidadesRestantes > 0 && !palabraAdivinada()) {
            System.out.println("Palabra: " + String.valueOf(letrasAdivinadas));
            System.out.println("Oportunidades restantes: " + oportunidadesRestantes);
            System.out.print("Ingresa una letra: ");
            char letra = teclado.next().charAt(0);
            if (!adivinarLetra(letra)) {
                oportunidadesRestantes--;
                System.out.println("Letra incorrecta. Te quedan " + oportunidadesRestantes + " oportunidades.");
            } else {
                System.out.println("Letra correcta!");
            }
        }
    }

    @Override
    public void fin() {
        if (palabraAdivinada()) {
            System.out.println("Felicidades, ganaste! La palabra secreta era: " + palabraSecreta);
        } else {
            System.out.println("Lo siento, perdiste! La palabra secreta era: " + palabraSecreta);
        }
    }

    private boolean adivinarLetra(char letra) {
        boolean adivino = false;
        for (int i = 0; i < palabraSecreta.length(); i++) {
            if (palabraSecreta.charAt(i) == letra) {
                letrasAdivinadas[i] = letra;
                adivino = true;
            }
        }
        return adivino;
    }

    private boolean palabraAdivinada() {
        for (char letra : letrasAdivinadas) {
            if (letra == '_') {
                return false;
            }
        }
        return true;
    }
}

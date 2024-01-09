package Ejemplos;

import java.util.Date;
import java.util.Scanner;

public class ContarPalabras {
    public static void main(String[] args) {
        String texto = null;
        Date fecha = new Date();
        System.out.println("\n---- " + fecha + " ----\n");
        Scanner teclado = new Scanner(System.in);
        System.out.print("Hola! Escribe algo: ");
        texto = teclado.nextLine();
        teclado.close();
        int countWords = texto.split("\\s").length;
        if (texto == "") {
            System.out.println("Escribiste 0 palabras.");
        } else {
            System.out.println("Escribiste " + countWords + (countWords == 1 ? " palabra." : " palabras."));
        }
        System.out.println("\n---- Programa finalizado ----\n");
    }
}

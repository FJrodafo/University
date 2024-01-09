package Ejemplos;

import java.util.Date;
import java.util.InputMismatchException;
import java.util.Scanner;

public class AreaCirculo {
    public static void main(String[] args) {
        double radio = 0, area = 0;
        Date fecha = new Date();
        System.out.println("\n---- " + fecha + " ----\n");
        try (Scanner teclado = new Scanner(System.in)) {
            System.out.print("Introduce el radio del círculo: ");
            radio = teclado.nextDouble();
            area = (3.14 * (radio * radio));
            System.out.println("El área del circulo es: " + area);
        } catch (InputMismatchException e) {
            System.out.println("Error al introducir un número.");
        }
        System.out.println("\n---- Programa finalizado ----\n");
    }
}

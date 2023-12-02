package Introduccion_a_JAVA.Ejemplos;

import java.util.Date;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Operadores {
    public static void main(String[] args) {
        int num1 = 0, num2 = 0;
        Date fecha = new Date();
        System.out.println("\n---- " + fecha + " ----\n");
        try {
            Scanner teclado = new Scanner(System.in);
            System.out.print("Introduce un número: ");
            num1 = teclado.nextInt();
            System.out.print("Introduce otro número: ");
            num2 = teclado.nextInt();
            teclado.close();
            System.out.println("\n---- Resultados ----\n");
            System.out.println(num1 + " + " + num2 + " = " + (num1 + num2));
            System.out.println(num1 + " - " + num2 + " = " + (num1 - num2));
            System.out.println(num1 + " * " + num2 + " = " + (num1 * num2));
            System.out.println(num1 + " / " + num2 + " = " + (num1 / num2));
            System.out.println(num1 + " % " + num2 + " = " + (num1 % num2));
        } catch (ArithmeticException e) {
            System.out.println("\nError al tratar de dividir entre cero.");
        } catch (InputMismatchException e) {
            System.out.println("\nError al introducir un número.");
        }
        System.out.println("\n---- Programa finalizado ----\n");
    }
}

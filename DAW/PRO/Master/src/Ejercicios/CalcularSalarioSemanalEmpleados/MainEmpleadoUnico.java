package Ejercicios.CalcularSalarioSemanalEmpleados;

import java.util.Date;
import java.util.InputMismatchException;
import java.util.Scanner;

public class MainEmpleadoUnico {
    public static void main(String[] args) {
        // Variables
        String nombre = null;
        double horasTrabajadas = 0.0d;
        boolean salir = false;
        // Imprimimos la fecha actual
        Date fecha = new Date();
        System.out.println("\n---- " + fecha + " ----\n");
        // Declarar el escáner
        Scanner teclado = new Scanner(System.in);
        // Pedir el nombre del empleado
        System.out.print("Ingrese el nombre del empleado: ");
        nombre = teclado.next();
        // Bucle dowhile y try_catch para que se introduzcan los datos correctamente
        do {
            try {
                // Pedir las horas trabajadas del empleado
                System.out.print("Ingrese las horas trabajadas del empleado: ");
                horasTrabajadas = teclado.nextDouble();
                salir = true;
            } catch (InputMismatchException e) {
                System.out.println("Error al introducir un número.");
                teclado.next();
            }
        } while (!salir);
        // Cerrar el escáner
        teclado.close();
        // Crear un objeto Empleado con los datos ingresados
        Empleado e = new Empleado(nombre, horasTrabajadas);
        // Mostrar el salario semanal del empleado
        System.out.printf("El salario semanal de %s es de: $%.2f\n", e.getNombre(), e.getSalarioSemanal());
        // El programa ha finalizado correctamente
        System.out.println("\n---- Programa finalizado ----\n");
    }
}

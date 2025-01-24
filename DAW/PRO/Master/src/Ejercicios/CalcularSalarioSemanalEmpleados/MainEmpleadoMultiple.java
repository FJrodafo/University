package Ejercicios.CalcularSalarioSemanalEmpleados;

import java.util.Date;
import java.util.InputMismatchException;
import java.util.Scanner;

public class MainEmpleadoMultiple {
    public static void main(String[] args) {
        // Variables
        int numEmpleados = 0;
        String nombre = null;
        double horasTrabajadas = 0.0d;
        boolean salir = false;
        // Imprimimos la fecha actual
        Date fecha = new Date();
        System.out.println("\n---- " + fecha + " ----\n");
        // Declarar el escáner
        Scanner teclado = new Scanner(System.in);
        // Bucle dowhile y try_catch para que se introduzcan los datos correctamente
        do {
            try {
                // Pedir el número de empleados
                System.out.print("Ingrese el número de empleados: ");
                numEmpleados = teclado.nextInt();
                salir = true;
            } catch (InputMismatchException e) {
                System.out.println("Error al introducir un número.");
                teclado.next();
            }
        } while (!salir);
        // Crear un Array con el número de empleados
        Empleado[] empleados = new Empleado[numEmpleados];
        // Bucle fori para añadir los datos de los empleados
        for (int i = 0; i < empleados.length; i++) {
            // Pedir el nombre del empleado
            System.out.print("Ingrese el nombre del empleado " + (i + 1) + ": ");
            nombre = teclado.next();
            // Bucle dowhile y try_catch para que se introduzcan los datos correctamente
            salir = false;
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
            // Crear un objeto Empleado con los datos ingresados
            empleados[i] = new Empleado(nombre, horasTrabajadas);
        }
        // Cerrar el escáner
        teclado.close();
        // Bucle foreach para mostrar el salario semanal de cada empleado
        for (Empleado e : empleados) {
            System.out.printf("El salario semanal de %s es de: $%.2f\n", e.getNombre(), e.getSalarioSemanal());
        }
        // El programa ha finalizado correctamente
        System.out.println("\n---- Programa finalizado ----\n");
    }
}

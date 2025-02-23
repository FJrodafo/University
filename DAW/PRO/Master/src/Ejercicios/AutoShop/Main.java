package Ejercicios.AutoShop;

import java.time.DateTimeException;
import java.time.LocalDate;
import java.util.Date;
import java.util.InputMismatchException;
import java.util.Locale;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        // Creamos un objeto concesionario
        Concesionario concesionario = new Concesionario();
        // Creamos un objeto Vehiculo
        Vehiculo v = null;
        // Atributos del vehículo
        String marca = null, matricula = null, descripcion = null, nombrePropietario = null, dniPropietario = null;
        int numKm = 0, dia = 0, mes = 0, anio = 0;
        double precio = 0d;
        LocalDate fechaMatriculacion = null;
        // Declaramos la variable valido para asegurarnos de que los datos son válidos
        boolean valido = false;
        // Declaramos las variables para el funcionamiento del menú
        String menu = null;
        int opcion = 0;
        boolean salir = false;
        // Imprimimos la fecha actual
        Date fecha = new Date();
        System.out.println("\n---- " + fecha + " ----\n");
        // Declaramos el escáner
        Scanner teclado = new Scanner(System.in);
        // Para no tener problemas con los espacios en el escáner usamos lo siguiente:
        teclado.useDelimiter("\n");
        // Para no tener problemas con los decimales en el escáner usamos lo siguiente:
        teclado.useLocale(Locale.US);
        // Bucle para mantener el programa activo hasta que la variable salir sea true
        do {
            // Imprimimos el menú con sus opciones
            menu = "    MENU\n1 - Nuevo vehículo\n2 - Listar vehículos\n3 - Buscar vehículo\n4 - Modificar datos\n5 - Salir";
            Menu.mostrarMenu(menu);
            try {
                // Pedimos al usuario que elija una opción del menú
                System.out.print("Elige una opción: ");
                opcion = teclado.nextInt();
                // Utilizo un switch para representar el contenido del menú
                switch (opcion) {
                    case 1:
                        System.out.print("Introduce la marca: ");
                        marca = teclado.next();
                        do {
                            valido = false;
                            System.out.print("Introduce la matrícula: ");
                            matricula = teclado.next();
                            if (!Validaciones.validarMatricula(matricula)) {
                                System.out.println("La matrícula debe contener 4 números y 3 letras. [NNNN LLL]");
                            } else {
                                valido = true;
                            }
                        } while (!valido);
                        do {
                            valido = false;
                            try {
                                System.out.print("Introduce el número de kilómetros: ");
                                numKm = teclado.nextInt();
                                if (!Validaciones.esPositivo(numKm)) {
                                    // throw new Exception("El número de kilómetros tiene que ser positivo.");
                                    System.out.println("El número de kilómetros tiene que ser positivo.");
                                } else {
                                    valido = true;
                                }
                            } catch (InputMismatchException e) {
                                System.out.println("Error al introducir un número.");
                                teclado.next();
                            }
                        } while (!valido);
                        do {
                            do {
                                valido = false;
                                try {
                                    System.out.print("Introduce el día de la fecha de matriculación: ");
                                    dia = teclado.nextInt();
                                    System.out.print("Introduce el mes de la fecha de matriculación: ");
                                    mes = teclado.nextInt();
                                    System.out.print("Introduce el año de la fecha de matriculación: ");
                                    anio = teclado.nextInt();
                                    fechaMatriculacion = LocalDate.of(anio, mes, dia);
                                    valido = true;
                                } catch (InputMismatchException e) {
                                    System.out.println("Error al introducir la fecha de matriculación.");
                                    teclado.next();
                                } catch (DateTimeException e) {
                                    System.out.println("Error al introducir la fecha de matriculación.");
                                }
                            } while (!valido);
                            valido = false;
                            if (Validaciones.fechaMayorHoy(fechaMatriculacion)) {
                                // throw new Exception("La fecha de matriculación no puede ser mayor que hoy.");
                                System.out.println("La fecha de matriculación no puede ser mayor que hoy.");
                            } else {
                                valido = true;
                            }
                        } while (!valido);
                        System.out.print("Introduce la descripción: ");
                        descripcion = teclado.next();
                        do {
                            valido = false;
                            try {
                                System.out.print("Introduce el precio en euros: ");
                                precio = teclado.nextDouble();
                                if (!Validaciones.esPositivo(numKm)) {
                                    // throw new Exception("El precio tiene que ser positivo.");
                                    System.out.println("El precio tiene que ser positivo.");
                                } else {
                                    valido = true;
                                }
                            } catch (InputMismatchException e) {
                                System.out.println("Error al introducir un número.");
                                teclado.next();
                            }
                        } while (!valido);
                        do {
                            valido = false;
                            System.out.print("Introduce el nombre del propietario: ");
                            nombrePropietario = teclado.next();
                            if (!Validaciones.validarNombre(nombrePropietario)) {
                                System.out.println("Nombre no válido, asegúrate de introducir el nombre completo.");
                            } else {
                                valido = true;
                            }
                        } while (!valido);
                        do {
                            valido = false;
                            System.out.print("Introduce el DNI del propietario: ");
                            dniPropietario = teclado.next();
                            if (!Validaciones.validarDNI(dniPropietario)) {
                                // throw new Exception("DNI no válido");
                                System.out.println("DNI no válido.");
                            } else {
                                valido = true;
                            }
                        } while (!valido);
                        v = new Vehiculo(marca, matricula, numKm, fechaMatriculacion, descripcion, precio,
                                nombrePropietario, dniPropietario);
                        switch (concesionario.insertarVehiculo(v)) {
                            case 0:
                                System.out.println("El vehículo ha sido creado correctamente.");
                                break;
                            case -1:
                                System.out.println("El concesionario está lleno, capacidad máxima de 4 vehículos.");
                                break;
                            case -2:
                                System.out.println("Ya existe un vehículo con la misma matrícula.");
                                break;
                            default:
                                break;
                        }
                        break;
                    case 2:
                        if (v != null) {
                            concesionario.listarVehiculos();
                        } else {
                            System.out.println("Concesionario vacío.");
                        }
                        break;
                    case 3:
                        do {
                            valido = false;
                            System.out.print("Introduce la matrícula: ");
                            matricula = teclado.next();
                            if (!Validaciones.validarMatricula(matricula)) {
                                System.out.println("La matrícula debe contener 4 números y 3 letras. [NNNN LLL]");
                            } else {
                                v = concesionario.buscarVehiculo(matricula);
                                if (v != null) {
                                    System.out.println(v.toString());
                                    valido = true;
                                } else {
                                    System.out.println("No existe vehículo con la matrícula introducida.");
                                    valido = true;
                                }
                            }
                        } while (!valido);
                        break;
                    case 4:
                    do {
                        valido = false;
                        System.out.print("Introduce la matrícula: ");
                        matricula = teclado.next();
                        if (!Validaciones.validarMatricula(matricula)) {
                            System.out.println("La matrícula debe contener 4 números y 3 letras. [NNNN LLL]");
                        } else {
                            if (concesionario.modificarKilometros(matricula, numKm)) {
                                do {
                                    valido = false;
                                    try {
                                        System.out.print("Introduce el número de kilómetros: ");
                                        numKm = teclado.nextInt();
                                        if (!Validaciones.esPositivo(numKm)) {
                                            // throw new Exception("El número de kilómetros tiene que ser positivo.");
                                            System.out.println("El número de kilómetros tiene que ser positivo.");
                                        } else {
                                            valido = true;
                                        }
                                    } catch (InputMismatchException e) {
                                        System.out.println("Error al introducir un número.");
                                        teclado.next();
                                    }
                                } while (!valido);
                                v.setNumKm(numKm);
                                System.out.println("Kilómetros actualizados correctamente.");
                                valido = true;
                            } else {
                                System.out.println("No existe vehículo con la matrícula introducida.");
                                valido = true;
                            }
                        }
                    } while (!valido);
                    break;
                    case 5:
                        salir = true;
                        break;
                    /*
                     * En caso de que el usuario no introduzca alguna de las opciones del menú, se
                     * le pedirá que introduzca un número válido
                     */
                    default:
                        System.out.println("Debes introducir un número del 1 al 5");
                        break;
                }
            } catch (InputMismatchException e) {
                /*
                 * Al usar este try_catch nos aseguramos de que el programa no se cuelgue en
                 * caso de que el usuario introduzca un valor no numérico
                 */
                System.out.println("Error al introducir un número.");
                teclado.next();
            }
        } while (!salir);
        // Cerramos el escáner
        teclado.close();
        // El programa ha finalizado correctamente
        System.out.println("\n---- Programa finalizado ----\n");
    }
}

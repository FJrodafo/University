package Ejercicios.ListaPersonasArchivoTXT;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

public class ListaPersonas {
    private ArrayList<Persona> listaPersonas;
    private Persona persona;
    private Scanner teclado;
    private String nombre;
    private byte edad;
    private char genero;
    private boolean valido;

    public ListaPersonas() {
        this.listaPersonas = new ArrayList<>();
        this.teclado = new Scanner(System.in);
    }

    public void agregarPersona() {
        do {
            valido = false;
            System.out.print("Introduzca el nombre de la persona que desea agregar: ");
            nombre = teclado.nextLine();
            if (nombre.isBlank()) {
                System.out.println("El nombre de la persona no puede estar vacío.");
            } else {
                valido = true;
            }
        } while (!valido);
        do {
            valido = false;
            try {
                System.out.print("Introduzca la edad de la persona que desea agregar: ");
                edad = teclado.nextByte();
                teclado.nextLine();
                if (!Validaciones.validarEdad(edad)) {
                    System.out.println("La edad de la persona no puede estar vacía.");
                } else {
                    valido = true;
                }
            } catch (InputMismatchException e) {
                System.out.println("Error al introducir la edad de la persona.");
                teclado.next();
            }
        } while (!valido);
        do {
            try {
                System.out.print("¿La persona es hombre o mujer? [H/M]: ");
                genero = teclado.nextLine().charAt(0);
            } catch (StringIndexOutOfBoundsException e) {
                valido = false;
            }
            if (genero == 'H' || genero == 'h') {
                persona = new Hombre(nombre, edad, genero);
                try {
                    BufferedWriter fw = new BufferedWriter(new FileWriter("src/Ejercicios/ListaPersonasArchivoTXT/ListaPersonas.txt", true));
                    fw.newLine();
                    fw.write(persona.toString());
                    fw.close();
                } catch (IOException e) {
                    System.out.println(e);
                }
                valido = true;
            } else if (genero == 'M' || genero == 'm') {
                persona = new Mujer(nombre, edad, genero);
                try {
                    BufferedWriter fw = new BufferedWriter(new FileWriter("src/Ejercicios/ListaPersonasArchivoTXT/ListaPersonas.txt", true));
                    fw.newLine();
                    fw.write(persona.toString());
                    fw.close();
                } catch (IOException e) {
                    System.out.println(e);
                }
                valido = true;
            } else {
                System.out.println("Introduce 'H' si es hombre, 'M' si es mujer.");
                valido = false;
            }
        } while (!valido);
        listaPersonas.add(persona);
    }

    public void eliminarPersona() {
        if (listaPersonas.isEmpty()) {
            System.out.println("Actualmente no hay personas en la lista.");
        } else {
            System.out.print("Introduzca el nombre de la persona que desea eliminar: ");
            String nombrePersona = teclado.nextLine();
            boolean personaEncontrada = false;
            for (Persona persona : listaPersonas) {
                if (persona.getNombre().equals(nombrePersona)) {
                    listaPersonas.remove(persona);
                    System.out.println("Persona eliminada correctamente.");
                    personaEncontrada = true;
                    break;
                }
            }
            if (!personaEncontrada) {
                System.out.println("La persona introducida no exite en la lista.");
            } else {
                try {
                    BufferedWriter fw = new BufferedWriter(new FileWriter("src/Ejercicios/ListaPersonasArchivoTXT/ListaPersonas.txt"));
                    fw.write("Nombre, Edad [Género]");
                    for (Persona persona : listaPersonas) {
                        fw.newLine();
                        fw.write(persona.toString());
                    }
                    fw.close();
                } catch (IOException e) {
                    System.out.println(e);
                }
            }
        }
    }

    public void buscarPersona() {
        if (listaPersonas.isEmpty()) {
            System.out.println("Actualmente no hay personas en la lista.");
        } else {
            System.out.print("Introduzca el nombre de la persona que desea buscar: ");
            String nombrePersona = teclado.nextLine();
            boolean personaEncontrada = false;
            for (Persona persona : listaPersonas) {
                if (persona.getNombre().equals(nombrePersona)) {
                    System.out.println("Nombre, Edad [Género]");
                    System.out.println(persona);
                    personaEncontrada = true;
                    break;
                }
            }
            if (!personaEncontrada) {
                System.out.println("La persona introducida no exite en la lista.");
            }
        }
    }

    public void listarPersonas() {
        if (listaPersonas.isEmpty()) {
            System.out.println("Actualmente no hay personas en la lista.");
        } else {
            String contenido = "";
            try {
                BufferedReader fr = new BufferedReader(new FileReader("src/Ejercicios/ListaPersonasArchivoTXT/ListaPersonas.txt"));
                int c;
                while ((c = fr.read()) != -1) {
                    contenido += (char) c;
                }
                fr.close();
            } catch (FileNotFoundException e) {
                System.out.println(e);
            } catch (IOException e) {
                System.out.println(e);
            }
            System.out.println(contenido);
        }
    }
}

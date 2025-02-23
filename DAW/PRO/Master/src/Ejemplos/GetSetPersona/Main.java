package Ejemplos.GetSetPersona;

public class Main {
    public static void main(String[] args) {
        /*
         * Creamos un constructor vacío (Sin parámetros) para utilizar los métodos y las
         * funciones de la clase Persona (Aquí estaríamos creando dos objetos)
         */
        Persona p1 = new Persona();
        Persona p2 = new Persona();
        // Llamamos al método setNombre para añadirle un valor a la variable nombre
        p1.setNombre("Fran");
        p2.setNombre("Alba");
        // Llamamos al método setEdad para añadirle un valor a la variable edad
        p1.setEdad(22);
        p2.setEdad(23);
        // Imprimimos la información recopilada por pantalla
        System.out.println("La persona 1 se llama: " + p1.getNombre() + " y tiene " + p1.getEdad() + " años.");
        System.out.println("La persona 2 se llama: " + p2.getNombre() + " y tiene " + p2.getEdad() + " años.");
    }
}

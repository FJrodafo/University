package Ejercicios.ListaPersonasArchivoTXT;

public class Persona {
    private String nombre;
    private byte edad;

    public Persona(String nombre, byte edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    public String getNombre() {
        return nombre;
    }

    public byte getEdad() {
        return edad;
    }
}

package Ejercicios.ListaPersonasArchivoTXT;

public class Hombre extends Persona {
    private final char genero;

    public Hombre(String nombre, byte edad, char genero) {
        super(nombre, edad);
        this.genero = 'H';
    }

    @Override
    public String toString() {
        return getNombre() + ", " + getEdad() + " [" + genero + "]";
    }
}

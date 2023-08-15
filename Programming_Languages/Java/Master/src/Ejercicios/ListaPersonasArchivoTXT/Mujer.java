package Ejercicios.ListaPersonasArchivoTXT;

public class Mujer extends Persona {
    private final char genero;

    public Mujer(String nombre, byte edad, char genero) {
        super(nombre, edad);
        this.genero = 'M';
    }

    @Override
    public String toString() {
        return getNombre() + ", " + getEdad() + " [" + genero + "]";
    }
}

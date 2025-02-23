package Ejercicios.ListaPersonasArchivoTXT;

public class Validaciones {
    public static boolean validarEdad(byte edad) {
        if (edad > 0) {
            return true;
        } else {
            return false;
        }
    }
}

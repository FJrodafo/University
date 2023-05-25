package MiTienda;

public class Validaciones {
    public static boolean validarPrecio(float precio) {
        if (precio > 0) {
            return true;
        } else {
            return false;
        }
    }
}

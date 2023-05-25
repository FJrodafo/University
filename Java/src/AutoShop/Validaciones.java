package AutoShop;

import java.time.LocalDate;

public class Validaciones {
    /**
     * Valida una matrícula verificando que contenga cuatro números y tres letras
     * 
     * @param matricula
     * @return
     */
    public static boolean validarMatricula(String matricula) {
        return matricula.matches("^[0-9]{4}\s[B|C|D|F|G|H|J|K|L|M|N|P|R|S|T|V|W|X|Y|Z]{3}$");
    }

    public static boolean esPositivo(int num) {
        if (num >= 0) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean fechaMayorHoy(LocalDate fecha) {
        LocalDate hoy = LocalDate.now();
        if (hoy.isBefore(fecha)) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean validarNombre(String nombre) {
        if (nombre.length() > 40) {
            return false;
        }
        char caracter = ' ';
        int numEspacios = 0;
        for (int i = 0; i < nombre.length(); i++) {
            caracter = nombre.charAt(i);
            if (caracter == ' ') {
                numEspacios++;
            }
            if (Character.isDigit(caracter)) {
                return false;
            }
        }
        if (numEspacios >= 1) {
            return true;
        }
        return false;
    }

    /**
     * Valida un DNI verificando que contiene ocho números y su letra
     * correspondiente
     * 
     * @param DNI
     * @return true/false
     */
    public static boolean validarDNI(String DNI) {
        // Verifica que el String DNI tenga 9 carácteres
        if (DNI.length() != 9) {
            return false;
        }
        // Del String DNI guarda solamente los números
        String DNInums = DNI.substring(0, DNI.length() - 1);
        // Del String DNI guarda solamente la letra
        char DNIletra = DNI.charAt(DNI.length() - 1);
        // Convertir el String de números en un int
        int numsDNI;
        try {
            numsDNI = Integer.parseInt(DNInums);
        } catch (NumberFormatException e) {
            return false;
        }
        // Verifica que la letra sea una letra y no un carácter cualquiera
        if (!Character.isAlphabetic(DNIletra)) {
            return false;
        }
        // Array de caracteres que contiene las letras de un DNI en su respectivo orden
        char letrasDNI[] = { 'T', 'R', 'W', 'A', 'G', 'M', 'Y', 'F', 'P', 'D', 'X', 'B', 'N', 'J', 'Z', 'S', 'Q', 'V',
                'H', 'L', 'C', 'K', 'E' };
        // Operación para calcular la letra que le corresponde a los números del DNI
        int resto = numsDNI % 23;
        // Una vez hecho el cálculo asignamos la letra correspondiente
        char DNIletraFinal = letrasDNI[resto];
        // Juntamos los números y la letra correspondiente
        String DNIfinal = DNInums + DNIletraFinal;
        // Nos aseguramos de que el DNI introducido sea idéntico al calculado
        if (DNI.equals(DNIfinal)) {
            return true;
        } else {
            return false;
        }
    }
}

package Introduccion_a_JAVA.Ejemplos;

public class CondicionesSwitch {
    public static void main(String[] args) {

        int x = 3;

        switch (x) {
            case 1:
            case 2:
            case 3:
                System.out.println("El valor de x estaba entre 1 y 3");
                break;
            case 4:
            case 5:
                System.out.println("El valor de x era 4 o 5");
                break;
            case 6:
                System.out.println("El valor de x era 6");
                x = 10;
                System.out.println("Operaciones auxiliares completadas");
                break;
            default:
                System.out.println("Mensaje por defecto");
                break;
        }

        char letra = 'b';
        letra = Character.toUpperCase(letra);

        switch (letra) {
            case 'A':
                System.out.println("Letra --> A");
                break;
            case 'B':
                System.out.println("Letra --> B");
                break;
            case 'C':
                System.out.println("Letra --> C");
                break;
            case 'D':
                System.out.println("Letra --> D");
                break;
            default:
                System.out.println("Mensaje por defecto");
                break;
        }

        String palabra = "A4";

        switch (palabra) {
            case "A1":
                System.out.println("Piso A1");
                break;
            case "A2":
                System.out.println("Piso A2");
                break;
            case "A3":
                System.out.println("Piso A3");
                break;
            case "A4":
                System.out.println("Piso A4");
                break;
            default:
                System.out.println("Mensaje por defecto");
                break;
        }
    }
}

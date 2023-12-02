package Introduccion_a_JAVA.Ejemplos;

public class Condiciones {
    public static void main(String[] args) {

        int x = 1, y = 4;
        boolean condicion1 = x == 1 && y == 4;
        boolean condicion2 = x + y++ == 6;

        if (x == 1) {
            System.out.println("x vale 1");
        } else {
            System.out.println("x no vale 1");
        }

        if (x == 2) {
            System.out.println("x vale 1");
        } else {
            System.out.println("x no vale 1");
        }

        if (y == 1) {
            System.out.println("y vale 1");
        } else if (y == 2) {
            System.out.println("y vale 2");
        } else {
            System.out.println("y es mayor que 2");
        }

        if (x == 1 && y == 4) {
            System.out.println("x vale 1 e y vale 4");
        }

        if (condicion1) {
            System.out.println("x vale 1 e y vale 4");
        }

        if (!condicion2) {
            System.out.println("Texto de prueba");
        }
    }
}

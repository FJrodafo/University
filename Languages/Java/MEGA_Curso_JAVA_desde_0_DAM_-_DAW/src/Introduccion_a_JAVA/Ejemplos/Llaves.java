package Introduccion_a_JAVA.Ejemplos;

public class Llaves {
    public static void main(String[] args) {
        {
            int i = 2, j = 2;
            System.out.println(i + j);
        }

        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                System.out.print(" " + j + " ");
            }
            System.out.println();
        }
    }
}

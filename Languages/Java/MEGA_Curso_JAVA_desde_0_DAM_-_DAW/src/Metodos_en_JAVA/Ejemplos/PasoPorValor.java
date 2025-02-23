package Metodos_en_JAVA.Ejemplos;

public class PasoPorValor {

    static int num = 2; // Variable global

    public static void main(String[] args) {

        // int num = 10; // Variable local
        int doble = doble(num);

        System.out.println("num = " + num + "\ndoble = " + doble);
    }

    static int doble(int num) {
        num *= 2;

        return num;
    }
}

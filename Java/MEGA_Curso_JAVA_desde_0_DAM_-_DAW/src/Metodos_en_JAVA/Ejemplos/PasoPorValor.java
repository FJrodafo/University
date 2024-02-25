package Metodos_en_JAVA.Ejemplos;

public class PasoPorValor {
    public static void main(String[] args) {
        int num = 10;
        int doble = doble(num);

        System.out.println("num = " + num + "\ndoble = " + doble);
    }

    static int doble(int num) {
        num *= 2;

        return num;
    }
}

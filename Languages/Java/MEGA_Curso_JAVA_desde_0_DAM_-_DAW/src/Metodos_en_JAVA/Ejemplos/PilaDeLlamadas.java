package Metodos_en_JAVA.Ejemplos;

public class PilaDeLlamadas {
    public static void main(String[] args) {
        int x = proceso1(4);

        System.out.println("x = " + x);
    }

    static int proceso1(int a) {
        int x = 0;

        for (int i = 0; i <= a; i += 2) {
            x += proceso2(i, i + 1);
        }

        return x;
    }

    static int proceso2(int a, int b) {
        int y = 1;

        for (int i = 0; i < a + b; i++) {
            y++;
        }

        return y;
    }
}

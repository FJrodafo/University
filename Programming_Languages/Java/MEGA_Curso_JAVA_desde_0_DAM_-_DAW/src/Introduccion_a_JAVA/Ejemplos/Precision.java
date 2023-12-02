package Introduccion_a_JAVA.Ejemplos;

public class Precision {
    public static void main(String[] args) {

        double a = 0.1 + 0.2;
        System.out.println(a); // 0.30000000000000004

        double b = 0.1f + 0.2f;
        System.out.println(b); // 0.30000001192092896

        float c = 0.1f + 0.2f;
        System.out.println(c); // 0.3

        double d = 10 / 3;
        System.out.println(d); // 3.0

        double e = 10 / 3.0;
        System.out.println(e); // 3.3333333333333335
    }
}

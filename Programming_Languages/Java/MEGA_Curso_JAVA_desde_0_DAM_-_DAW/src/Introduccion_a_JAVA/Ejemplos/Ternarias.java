package Introduccion_a_JAVA.Ejemplos;

public class Ternarias {
    public static void main(String[] args) {

        int a = 1, b = 2, c = 3;
        boolean condicion;

        condicion = a == 1 ? true : false;
        System.out.println(condicion); // true

        condicion = b == 1 ? true : false;
        System.out.println(condicion); // false

        int n = c == 1 ? c * 2 : a + b;
        System.out.println(n); // 3
    }
}

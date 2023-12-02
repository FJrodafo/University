package Introduccion_a_JAVA.Ejemplos;

public class Precedencia {
    public static void main(String[] args) {

        int n = 2;
        int m = n++ * 3 + 2 + (++n);
        // 2 * 3 + 2 + 4 = 12
        System.out.println(m);

        n = 2;
        int x = ++n + 2 + 3 * n++;
        // 3 + 2 + 3 * 3 = 14
        System.out.println(x);

        n = 2;
        int y = ++n + 2 + 3 * (n++ + 1);
        // 3 + 2 + 3 * (3 + 1) = 17
        System.out.println(y);

        n = 2 + 3 / 2 * 8 / 4 + 5;
        // n = 2 + (3 / 2 * 8 / 4) + 5 = 9
        System.out.println(n);

        n *= 4 + 2 * 3;
        // n = n * (4 + 2 * 3) = 90
        System.out.println(n);

        n += n++ + 3 - n;
        // n = n + (n++) + 3 - n = 92
        System.out.println(n);

        double d1 = 1, d2 = 2, d3;
        d3 = d2++ + d1 / d2 * 3 + d1;
        // d3 = (d2++) + (d1 / d2 * 3) + d1 = 4.0
        System.out.println(d3);

        boolean cond1 = true, cond2 = false, cond3 = false;
        int a = 1, b = 2, c = 3;
        cond3 = a++ == b || a == b;
        // true
        System.out.println(cond3);
        cond3 = a++ == c || b != --c && cond1 ^ cond3;
        // false
        System.out.println(cond3);
        cond3 = !(!cond2) || cond1 && !cond3 ^ cond3 && cond2;
        // false
        System.out.println(cond3);
    }
}

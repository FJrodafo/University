package Introduccion_a_JAVA.Ejemplos;

public class ClaseMath {
    public static void main(String[] args) {

        int n = 2, m = 4, radio = 5;
        double area, resultado = Math.pow(n, m), raiz = Math.sqrt(resultado);
        area = Math.PI * radio * radio;
        area = Math.PI * Math.pow(radio, 2);

        // 256.0
        System.out.println(Math.pow(n, 8));

        // 78.53981633974483
        System.out.println(area);

        // 78.53981633974483
        System.out.println(area);

        // 79.0
        System.out.println("El area por arriba es " + Math.ceil(area));

        // 78.0
        System.out.println("El area por debajo es " + Math.floor(area));

        // El area redondeada es 79
        System.out.println("El area redondeada es " + Math.round(area));

        // 78.53981633974483
        System.out.println(Math.sqrt(area * area));

        // 4.0
        System.out.println(Math.sqrt(Math.pow(n, 4)));

        // 2 elevado a 4 = 16
        System.out.println(n + " elevado a " + m + " = " + (int) resultado);

        // La raiz cuadrada de 16 es 4
        System.out.println("La raiz cuadrada de " + (int) resultado + " es " + (int) raiz);

        // Genera un número aleatorio entre 0 y 1 sin incluir el 1
        double random1 = Math.random();
        System.out.println(random1);

        // Genera un número aleatorio entre 0 y 10 sin incluir el 10
        double random2 = (int) (Math.random() * 10);
        System.out.println(random2);

        // Genera un número aleatorio de 1 a 4
        double random3 = (int) (Math.random() * 4 + 1);
        System.out.println(random3);

        double err = Math.sqrt(-2);
        // NaN --> Not a Number
        System.out.println("La raíz cuadrada de -2 es " + err);
        // ¿Es la raíz cuadrada de -2 un NaN?: true
        System.out.println("¿Es la raíz cuadrada de -2 un NaN?: " + Double.isNaN(err));

        err = 1.0 / 0.0;
        // 1.0 / 0.0 = Infinity
        System.out.println("1.0 / 0.0 = " + err);
        // ¿Es 1.0 entre 0.0 infinito?: true
        System.out.println("¿Es 1.0 entre 0.0 infinito?: " + Double.isInfinite(1.0 / 0.0));
    }
}

package Metodos_en_JAVA.Ejemplos.TrianguloRecursivo.Ejemplo1;

public class Main {
    public static void main(String[] args) {
        int altura = 4;
        triangulo(altura);
    }

    static void triangulo(int n) {
        trianguloRecursivo(0, 1, n);
    }

    static void trianguloRecursivo(int contB, int contA, int n) {
        if (contB < contA) {
            System.out.print("* ");
            trianguloRecursivo(contB + 1, contA, n);
        } else {
            System.out.println();
            if (contA < n) {
                trianguloRecursivo(0, contA + 1, n);
            }
        }
    }
}

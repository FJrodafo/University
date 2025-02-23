package Metodos_en_JAVA.Ejemplos.TrianguloRecursivo.Ejemplo2;

public class Main {
    public static void main(String[] args) {
        triangulo(4);
    }

    static void triangulo(int n) {
        if (n > 0) {
            triangulo(n - 1);
            filaTriangulo(n);
        }
    }

    static void filaTriangulo(int n) {
        if (n > 0) {
            System.out.print("* ");
            filaTriangulo(n - 1);
        } else {
            System.out.println();
        }
    }
}

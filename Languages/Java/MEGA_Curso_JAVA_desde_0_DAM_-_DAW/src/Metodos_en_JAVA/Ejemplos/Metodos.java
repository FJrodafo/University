package Metodos_en_JAVA.Ejemplos;

public class Metodos {
    public static void main(String[] args) {
        int num1 = 2, num2 = 4;
        int num3 = suma(num1, num2);
        int num4 = sumaCondicionada(num1, num2);
        double lado = 3;

        prueba();
        System.out.println(num3);
        System.out.println(num4);
        System.out.println(areaCuadrado((float) lado));
    }

    static void prueba() {
        System.out.println("Prueba");
        return; // No es necesario ya que el método no tiene parámetros
    }

    static int suma(int a, int b) {
        int resultado = a + b;

        return resultado;
    }

    static int sumaCondicionada(int a, int b) {
        if (a == b) {
            return a + b;
        } else {
            return 0;
        }
    }

    static float areaCuadrado(float lado) {
        return lado * lado;
    }
}

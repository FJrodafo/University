package Metodos_en_JAVA.Ejercicios.Menu;

import java.util.InputMismatchException;
import java.util.Scanner;

/*
 * Menu
 * 
 * Implementa un método que a partir del lado, dibuje un cuadrado formado por asteriscos.
 * Crea un método adicional para dibujar dicho cuadrado sin relleno.
 * 
 * Implementa un método que a partir de la altura, dibuje un triángulo rectángulo formado por asteriscos.
 * Crea un método adicional para dibujar dicho triángulo rectángulo sin relleno.
 * 
 * Implementa un método que a partir de la altura, dibuje un triángulo equilátero formado por asteriscos.
 * Crea un método adicional para dibujar dicho triángulo equilátero sin relleno.
 * 
 * Crea un menú con 7 opciones, una por cada tipo de figura, y una opción para salir.
 * Se deberá elegir una opción y realizar la acción correspondiente.
 * El programa no terminará hasta que seleccionemos la opción para salir.
 * 
 * EJEMPLO:
 *     Entrada:
 *         ╔══════════════════════════════════════╗
 *         ║     MENU                             ║
 *         ║ 1 - Cuadrado con relleno             ║
 *         ║ 2 - Cuadrado sin relleno             ║
 *         ║ 3 - Triángulo rectángulo con relleno ║
 *         ║ 4 - Triángulo rectángulo sin relleno ║
 *         ║ 5 - Triángulo equilátero con relleno ║
 *         ║ 6 - Triángulo equilátero sin relleno ║
 *         ║ 7 - Salir                            ║
 *         ╚══════════════════════════════════════╝
 *         Elige una opción: 4
 *         Indica el tamaño de la figura: 5
 *     Salida:
 *         * 
 *         * * 
 *         *   * 
 *         *     * 
 *         * * * * * 
 */
public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        int opcion = 0, dimension = 0;
        boolean salir = false;

        do {
            String menu = "    MENU\n1 - Cuadrado con relleno\n2 - Cuadrado sin relleno\n3 - Triángulo rectángulo con relleno\n4 - Triángulo rectángulo sin relleno\n5 - Triángulo equilátero con relleno\n6 - Triángulo equilátero sin relleno\n7 - Triángulo equilátero especial\n8 - Salir";
            Menu.mostrarMenu(menu);
            try {
                System.out.print("Elige una opción: ");
                opcion = teclado.nextInt();
                if (opcion > 0 && opcion < 8) {
                    System.out.print("Indica el tamaño de la figura: ");
                    dimension = teclado.nextInt();
                }
            } catch (InputMismatchException e) {
                teclado.next();
            }
            switch (opcion) {
                case 1:
                    cuadradoConRelleno(dimension);
                    break;
                case 2:
                    cuadradoSinRelleno(dimension);
                    break;
                case 3:
                    trianguloRectanguloConRelleno(dimension);
                    break;
                case 4:
                    trianguloRectanguloSinRelleno(dimension);
                    break;
                case 5:
                    trianguloEquilateroConRelleno(dimension);
                    break;
                case 6:
                    trianguloEquilateroSinRelleno(dimension);
                    break;
                case 7:
                    trianguloEquilateroEspecial(dimension);
                    break;
                case 8:
                    salir = true;
                    break;
                default:
                    System.out.println("Debes introducir un número del 1 al 8");
                    break;
            }
        } while (!salir);
        teclado.close();
    }

    static void mostrarMenu() {
        System.out.println("""
                ╔══════════════════════════════════════╗
                ║     MENU                             ║
                ║ 1 - Cuadrado con relleno             ║
                ║ 2 - Cuadrado sin relleno             ║
                ║ 3 - Triángulo rectángulo con relleno ║
                ║ 4 - Triángulo rectángulo sin relleno ║
                ║ 5 - Triángulo equilátero con relleno ║
                ║ 6 - Triángulo equilátero sin relleno ║
                ║ 7 - Triángulo equilátero especial    ║
                ║ 8 - Salir                            ║
                ╚══════════════════════════════════════╝
                """);
    }

    /**
     * Dibuja un cuadrado con relleno formado por asteriscos
     * 
     * @param n es el lado del cuadrado
     */
    static void cuadradoConRelleno(int n) {
        System.out.println();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                System.out.print("* ");
            }
            System.out.println();
        }
        System.out.println();
    }

    /**
     * Dibuja un cuadrado sin relleno formado por asteriscos
     * 
     * @param n es el lado del cuadrado
     */
    static void cuadradoSinRelleno(int n) {
        System.out.println();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i == 0 || i == n - 1 || j == 0 || j == n - 1) {
                    System.out.print("* ");
                } else {
                    System.out.print("  ");
                }
            }
            System.out.println();
        }
        System.out.println();
    }

    /**
     * Dibuja un triángulo rectángulo con relleno formado por asteriscos
     * 
     * @param n es la altura del triángulo rectángulo
     */
    static void trianguloRectanguloConRelleno(int n) {
        System.out.println();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j <= i; j++) {
                System.out.print("* ");
            }
            System.out.println();
        }
        System.out.println();
    }

    /**
     * Dibuja un triángulo rectángulo sin relleno formado por asteriscos
     * 
     * @param n es la altura del triángulo rectángulo
     */
    static void trianguloRectanguloSinRelleno(int n) {
        System.out.println();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j <= i; j++) {
                if (i == 0 || i == n - 1 || j == 0 || j == i) {
                    System.out.print("* ");
                } else {
                    System.out.print("  ");
                }
            }
            System.out.println();
        }
        System.out.println();
    }

    /**
     * Dibuja un triángulo equilátero con relleno formado por asteriscos
     * 
     * @param n es la altura del triángulo equilátero
     */
    static void trianguloEquilateroConRelleno(int n) {
        System.out.println();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < (n * 2 - 1); j++) {
                // Alternativa: if (j >= n - 1 - i && j <= n - 1 + i) {...
                if (j >= (n * 2 - 1) / 2 - i && j <= (n * 2 - 1) / 2 + i) {
                    System.out.print("* ");
                } else {
                    System.out.print("  ");
                }
            }
            System.out.println();
        }
        System.out.println();
    }

    /**
     * Dibuja un triángulo equilátero sin relleno formado por asteriscos
     * 
     * @param n es la altura del triángulo equilátero
     */
    static void trianguloEquilateroSinRelleno(int n) {
        System.out.println();
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < (n * 2 - 1); j++) {
                if (j == (n * 2 - 1) / 2 - i || j == (n * 2 - 1) / 2 + i || i == n - 1) {
                    System.out.print("* ");
                } else {
                    System.out.print("  ");
                }
            }
            System.out.println();
        }
        System.out.println();
    }

    /**
     * Dibuja un triángulo equilátero especial formado por asteriscos
     * 
     * @param n es la altura del triángulo equilátero
     */
    static void trianguloEquilateroEspecial(int n) {
        System.out.println();
        for (int i = 0; i < n; i++) {
            int cont = i % 2;
            for (int j = 0; j < (n * 2 - 1); j++) {
                if (j >= (n * 2 - 1) / 2 - i && j <= (n * 2 - 1) / 2 + i && cont % 2 == 1) {
                    System.out.print("* ");
                } else {
                    System.out.print("  ");
                }
                cont++;
            }
            System.out.println();
        }
        System.out.println();
    }
}

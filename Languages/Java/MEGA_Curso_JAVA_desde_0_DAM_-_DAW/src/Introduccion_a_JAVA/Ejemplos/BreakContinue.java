package Introduccion_a_JAVA.Ejemplos;

public class BreakContinue {
    public static void main(String[] args) {
        int i = 1, n = 0;

        ////////////////////////////////////////

        System.out.println("\nPRIMER EJEMPLO:");
        for (i = 1; i <= 9; i++) {
            System.out.print("Vuelta " + i);
            if (i == 5) {
                System.out.print(" terminada!\n");
                break;
            }
            System.out.print(" terminada.\n");
        }
        System.out.println("Fin del bucle!\n");

        ////////////////////////////////////////

        System.out.println("\nSEGUNDO EJEMPLO:");
        for (i = 1; i <= 9; i++) {
            System.out.print("Vuelta " + i);
            if (i == 5) {
                System.out.print(" terminada!\n");
                continue;
            }
            System.out.print(" terminada.\n");
        }
        System.out.println("Fin del bucle!\n");

        ////////////////////////////////////////

        System.out.println("\nTERCER EJEMPLO:");
        for (i = 1; i <= 9; i++) {
            System.out.print("Vuelta " + i);
            // goto Statement (C++)
            salto: if (i == 5) {
                i++;
                break salto;
            }
            System.out.print(" terminada.\n");
        }
        System.out.println("Fin del bucle!\n");

        ////////////////////////////////////////

        System.out.println("\nCUARTO EJEMPLO:");
        n = 0;
        for (;;) {
            if (n == 5) {
                break;
            }
            System.out.print(n);
            n++;
        }
        System.out.println(" Fin!\n");

        ////////////////////////////////////////

        System.out.println("\nQUINTO EJEMPLO:");
        for (n = 0;;) {
            if (n == 5) {
                break;
            }
            System.out.print(n);
            n++;
        }
        System.out.println(" Fin!\n");

        ////////////////////////////////////////

        System.out.println("\nSEXTO EJEMPLO:");
        for (n = 0; n != 5;) {
            System.out.print(n);
            n++;
        }
        System.out.println(" Fin!\n");

        ////////////////////////////////////////

        System.out.println("\nSÉPTIMO EJEMPLO:");
        for (n = 0; n != 5; n++) {
            System.out.print(n);
        }
        System.out.println(" Fin!\n");
    }
}

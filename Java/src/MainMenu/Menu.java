package MainMenu;

public class Menu {
    public static final char LINEA_VERTICAL = '\u2551';
    public static final char LINEA_HORIZONTAL = '\u2550';
    public static final char ESQUINA_SUP_IZQ = '\u2554';
    public static final char ESQUINA_INF_IZQ = '\u255A';
    public static final char ESQUINA_SUP_DER = '\u2557';
    public static final char ESQUINA_INF_DER = '\u255D';
    public static final int BORDE_SUP = 0;
    public static final int BORDE_INF = 1;

    public static void mostrarMenu(String menu) {
        String[] lineas = menu.split("\n");
        int ancho = obtenerAnchoMax(lineas);
        imprimirLetrasBordes(lineas, ancho);
    }

    public static int obtenerAnchoMax(String[] lineas) {
        int anchoMax = 0;
        for (String lineaActual : lineas) {
            if (lineaActual.length() > anchoMax) {
                anchoMax = lineaActual.length();
            }
        }
        return anchoMax;
    }

    public static void imprimirLetrasBordes(String[] lineas, int ancho) {
        imprimirBordeSuperior(ancho);
        imprimirLineas(lineas, ancho);
        imprimirBordeInferior(ancho);
    }

    public static void imprimirBordeSuperior(int ancho) {
        imprimirBorde(BORDE_SUP, ancho);
    }

    public static void imprimirBordeInferior(int ancho) {
        imprimirBorde(BORDE_INF, ancho);
    }

    public static void imprimirBorde(int tipoBorde, int ancho) {
        System.out.print(tipoBorde == BORDE_SUP ? ESQUINA_SUP_IZQ : ESQUINA_INF_IZQ);
        for (int i = 0; i < ancho + 2; i++) {
            System.out.print(LINEA_HORIZONTAL);
        }
        System.out.println(tipoBorde == BORDE_SUP ? ESQUINA_SUP_DER : ESQUINA_INF_DER);
    }

    public static void imprimirLineas(String[] lineas, int anchoMax) {
        for (int i = 0; i < lineas.length; i++) {
            System.out.print(LINEA_VERTICAL + " ");
            for (int j = 0; j < anchoMax; j++) {
                if (j < lineas[i].length()) {
                    System.out.print(lineas[i].charAt(j));
                } else {
                    System.out.print(" ");
                }
            }
            System.out.println(" " + LINEA_VERTICAL);
        }
    }
}

package Ejemplos;

public class ContarAparicionesArray {
    public static void main(String[] args) {
        int[] array = { 1, 2, 3, 4, 2, 1, 1, 0 };
        ContarApariciones(array, 1);
    }

    static void ContarApariciones(int[] array, int num) {
        int contador = 0;
        for (int i = 0; i < array.length; i++) {
            if (array[i] == num) {
                contador++;
            }
        }
        if (contador == 0) {
            System.out.println("El número " + num + " no aparece en el Array.");
        } else {
            System.out.println("El número " + num + " aparece " + contador + (contador == 1 ? " vez." : " veces."));
        }
    }
}

package Ejemplos;

public class MostrarArray {
    public static void main(String[] args) {

        // Array no inicializado tamaño 10
        int[] array1 = new int[10];

        // Array inicializado tamaño 19
        int[] array2 = { 5, 7, 8, 3, 12, 45, 95, 2, 56, 789, 123, 456, 789, 14, 1, 3, 45, 84, 984 };

        // Mostrar array con fori
        for (int i = 0; i < array1.length; i++) {
            System.out.print(array1[i] + " ");
        }

        System.out.println();

        // Mostrar array con foreach
        for (int pivote : array2) {
            System.out.print(pivote + " ");
        }

        System.out.println();
    }
}

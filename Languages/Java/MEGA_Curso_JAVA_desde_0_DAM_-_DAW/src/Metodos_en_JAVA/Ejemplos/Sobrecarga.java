package Metodos_en_JAVA.Ejemplos;

public class Sobrecarga {
    public static void main(String[] args) {
        saludar();
        saludar("Fran");
        saludar("Fran", "La Orotava");
        suma(2, 4);
    }

    // static String saludar() {
    // return "Hola, ¿Qué tal?";
    // }

    static void saludar() {
        System.out.println("Hola, ¿Qué tal?");
    }

    // static String saludar(String nombre) {
    // return "Hola " + nombre + ", ¿Cómo estás?";
    // }

    static void saludar(String nombre) {
        System.out.println("Hola " + nombre + ", ¿Cómo estás?");
    }

    // static String saludar(String nombre, String ciudad) {
    // return "Hola " + nombre + ", ¿Qué tal por " + ciudad + "?";
    // }

    static void saludar(String nombre, String ciudad) {
        System.out.println("Hola " + nombre + ", ¿Qué tal por " + ciudad + "?");
    }

    // static int suma(int a, int b) {
    // return a + b;
    // }

    static void suma(int a, int b) {
        System.out.println(a + b);
    }
}

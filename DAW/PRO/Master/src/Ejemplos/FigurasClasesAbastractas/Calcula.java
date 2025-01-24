package Ejemplos.FigurasClasesAbastractas;

public class Calcula {
    public static void main(String[] args) {

        Cuadrado CuadradoA = new Cuadrado(0, 0, 20);
        Cuadrado CuadradoB = new Cuadrado(10, 10, 20);
        Circulo CirculoA = new Circulo(0, 0, 20);
        Circulo CirculoB = new Circulo(10, 10, 20);

        System.out.println("Area CuadradoA = " + CuadradoA.area());
        System.out.println("Area CuadradoB = " + CuadradoB.area());

        // ejemplo de casting (redefinir el tipo de dato, en este caso con (float):
        System.out.println("Area CirculoA = " + (float) CirculoA.area());
        System.out.println("Area CirculoB = " + CirculoB.area());
    }
}

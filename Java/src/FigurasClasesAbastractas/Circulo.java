package FigurasClasesAbastractas;

public class Circulo extends Figura {
    // variable
    private double radio;

    // Constructor
    public Circulo(double x, double y, double radio) {
        // super se refiere a objetos de la superclase
        super(x, y);
        this.radio = radio;
    }

    // Método que calcula el área
    public double area() {
        return Math.PI * radio * radio;
    }
}

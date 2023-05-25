package FigurasClasesAbastractas;

public abstract class Figura {
    // variables
    protected double x;
    protected double y;

    // Constructor
    public Figura(double x, double y) {
        this.x = x;
        this.y = y;
    }

    // método abstracto
    public abstract double area();
}

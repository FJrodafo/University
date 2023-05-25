package CalcularSalarioSemanalEmpleados;

public class Empleado {
    // Atributos
    private String nombre;
    private double horasTrabajadas;

    public Empleado() {
    }

    public Empleado(String nombre, double horasTrabajadas) {
        this.nombre = nombre;
        this.horasTrabajadas = horasTrabajadas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getHorasTrabajadas() {
        return horasTrabajadas;
    }

    public void setHorasTrabajadas(double horasTrabajadas) {
        this.horasTrabajadas = horasTrabajadas;
    }

    public double getSalarioSemanal() {
        double salario = 0.0d;
        if (horasTrabajadas <= 40) {
            salario = horasTrabajadas * 10;
        } else {
            salario = 40 * 10 + (horasTrabajadas - 40) * 15;
        }
        return salario;
    }
}

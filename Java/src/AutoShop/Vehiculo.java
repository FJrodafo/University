package AutoShop;

import java.time.LocalDate;
import java.time.Period;

public class Vehiculo {
    // Atributos
    private String marca;
    private String matricula;
    private int numKm;
    private LocalDate fechaMatriculacion;
    private String descripcion;
    private double precio;
    private String nombrePropietario;
    private String dniPropietario;

    public Vehiculo() {
        this.marca = null;
        this.matricula = null;
        this.numKm = 0;
        this.fechaMatriculacion = null;
        this.descripcion = null;
        this.precio = 0d;
        this.nombrePropietario = null;
        this.dniPropietario = null;
    }

    public Vehiculo(String marca, String matricula, int numKm, LocalDate fechaMatriculacion, String descripcion, double precio, String nombrePropietario, String dniPropietario) {
        this.marca = marca;
        this.matricula = matricula;
        this.numKm = numKm;
        this.fechaMatriculacion = fechaMatriculacion;
        this.descripcion = descripcion;
        this.precio = precio;
        this.nombrePropietario = nombrePropietario;
        this.dniPropietario = dniPropietario;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public int getNumKm() {
        return numKm;
    }

    public void setNumKm(int numKm) {
        this.numKm = numKm;
    }

    public LocalDate getFechaMatriculacion() {
        return fechaMatriculacion;
    }

    public void setFechaMatriculacion(LocalDate fechaMatriculacion) {
        this.fechaMatriculacion = fechaMatriculacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getNombrePropietario() {
        return nombrePropietario;
    }

    public void setNombrePropietario(String nombrePropietario) {
        this.nombrePropietario = nombrePropietario;
    }

    public String getDniPropietario() {
        return dniPropietario;
    }

    public void setDniPropietario(String dniPropietario) {
        this.dniPropietario = dniPropietario;
    }

    /**
     * 
     * @return Devuelve los años de antigüedad del vehículo
     */
    public int getAnios() {
        LocalDate f1 = this.fechaMatriculacion;
        LocalDate f2 = LocalDate.now();
        Period p = Period.between(f1, f2);
        return p.getYears();
    }

    @Override
    public String toString() {
        return "[ Marca: " + marca + ", Matrícula: " + matricula + ", Número de kilómetros: " + numKm + ", Fecha de matriculación: " + fechaMatriculacion + ", Descripción: " + descripcion + ", Precio: " + precio + ", Propietari@: " + nombrePropietario + ", DNI: " + dniPropietario + " ]";
    }
}

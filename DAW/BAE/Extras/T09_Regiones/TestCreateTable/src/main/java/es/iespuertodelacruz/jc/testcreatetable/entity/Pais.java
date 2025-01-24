package es.iespuertodelacruz.jc.testcreatetable.entity;

public class Pais {
    private String nombre;

    public Pais() {}
    public Pais(String nombre) {
        this.nombre = nombre;
    }

    // Getters y setters 
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
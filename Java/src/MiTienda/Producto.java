package MiTienda;

import java.text.DecimalFormat;

public class Producto {
    private String nombre, categoria, descripcion;
    private float precio;

    public Producto(String nombre, String categoria, String descripcion, float precio) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.descripcion = descripcion;
        this.precio = precio;
    }

    public String getNombre() {
        return nombre;
    }

    @Override
    public String toString() {
        DecimalFormat df = new DecimalFormat("#.##");
        return nombre + ", " + categoria + ", " + df.format(precio) + "€ [ " + descripcion + " ]";
    }
}

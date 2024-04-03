package es.iespuertodelacruz.jc.testcreatetable.entity;

public class Municipio {
    private int id;
    private String nombre;
    private Provincia provincia;

    public Municipio() {}
    public Municipio(int id, String nombre, Provincia provincia) {
        this.id = id;
        this.nombre = nombre;
        this.provincia = provincia;
    }

    public Provincia getProvincia() {
		return provincia;
	}
	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	// Getters y setters 
    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public Provincia getProvinciaId() {
        return provincia;
    }
}
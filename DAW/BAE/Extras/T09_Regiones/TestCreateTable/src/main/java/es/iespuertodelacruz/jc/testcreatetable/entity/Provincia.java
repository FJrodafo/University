package es.iespuertodelacruz.jc.testcreatetable.entity;

public class Provincia {
    private int id;
    private String nombre;
    private Pais pais;

    public Provincia() {}
    public Provincia(int id, String nombre, Pais pais) {
        this.id = id;
        this.nombre = nombre;
        this.pais = pais;
    }

    public Pais getPais() {
		return pais;
	}
	public void setPais(Pais pais) {
		this.pais = pais;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	// Getters y setters (opcional)
    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public Pais getPaisNombre() {
        return pais;
    }
}
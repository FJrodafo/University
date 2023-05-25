package GetSetPersona;

public class Persona {
    // Estas variables privadas solo serán visibles en esta clase Persona.java
    private String nombre = null;
    private int edad = 0;

    /**
     * 
     * @return Devuelve el valor de la variable privada nombre
     */
    String getNombre() {
        return nombre;
    }

    /**
     * Al llamar a este método, nos permite añadirle un valor a la variable nombre
     * 
     * @param nombre
     */
    void setNombre(String nombre) {
        // this.nombre hace referencia a la variable privada nombre
        this.nombre = nombre;
    }

    /**
     * 
     * @return Devuelve el valor de la variable privada edad
     */
    int getEdad() {
        return edad;
    }

    /**
     * Al llamar a este método, nos permite añadirle un valor a la variable edad
     * 
     * @param edad
     */
    void setEdad(int edad) {
        // this.edad hace referencia a la variable privada edad
        this.edad = edad;
    }
}

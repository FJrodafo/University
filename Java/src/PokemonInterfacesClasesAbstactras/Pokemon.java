package PokemonInterfacesClasesAbstactras;

public abstract class Pokemon {
    // Atributos
    protected String nombre;
    protected String sexo;
    protected int numPokedex;
    protected int temporada;
    protected double peso;

    // Métodos abstractos
    protected abstract void AtacarPlacaje();
    protected abstract void AtacarAraniazo();
    protected abstract void AtacarMordisco();
}

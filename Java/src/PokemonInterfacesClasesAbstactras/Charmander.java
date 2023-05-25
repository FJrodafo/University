package PokemonInterfacesClasesAbstactras;

public class Charmander extends Pokemon implements IFuego {
    // Constructor
    public Charmander() {}

    @Override
    protected void AtacarPlacaje() {
        System.out.println("Soy Charmander y este es mi ataque placaje!");
    }

    @Override
    protected void AtacarAraniazo() {
        System.out.println("Soy Charmander y este es mi ataque arañazo!");
    }

    @Override
    protected void AtacarMordisco() {
        System.out.println("Soy Charmander y este es mi ataque mordisco!");
    }

    @Override
    public void AtacarPunioFuego() {
        System.out.println("Soy Charmander y este es mi ataque puño fuego!");
    }

    @Override
    public void AtacarLanzallamas() {
        System.out.println("Soy Charmander y este es mi ataque lanzallamas!");
    }

    @Override
    public void AtacarAscuas() {
        System.out.println("Soy Charmander y este es mi ataque ascuas!");
    }
}

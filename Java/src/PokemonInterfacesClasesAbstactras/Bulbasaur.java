package PokemonInterfacesClasesAbstactras;

public class Bulbasaur extends Pokemon implements IPlanta {
    // Constructor
    public Bulbasaur() {}

    @Override
    protected void AtacarPlacaje() {
        System.out.println("Soy Bulbasaur y este es mi ataque placaje!");
    }

    @Override
    protected void AtacarAraniazo() {
        System.out.println("Soy Bulbasaur y este es mi ataque arañazo!");
    }

    @Override
    protected void AtacarMordisco() {
        System.out.println("Soy Bulbasaur y este es mi ataque mordisco!");
    }

    @Override
    public void AtacarDrenaje() {
        System.out.println("Soy Bulbasaur y este es mi ataque drenaje!");
    }

    @Override
    public void AtacarParalizar() {
        System.out.println("Soy Bulbasaur y este es mi ataque paralizar!");
    }
}

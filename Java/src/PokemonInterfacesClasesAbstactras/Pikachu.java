package PokemonInterfacesClasesAbstactras;

public class Pikachu extends Pokemon implements IElectrico {
    // Constructor
    public Pikachu() {}

    @Override
    protected void AtacarPlacaje() {
        System.out.println("Soy Pikachu y este es mi ataque placaje!");
    }

    @Override
    protected void AtacarAraniazo() {
        System.out.println("Soy Pikachu y este es mi ataque arañazo!");
    }

    @Override
    protected void AtacarMordisco() {
        System.out.println("Soy Pikachu y este es mi ataque mordisco!");
    }

    @Override
    public void AtacarImpactTrueno() {
        System.out.println("Soy Pikachu y este es mi ataque impact trueno!");
    }

    @Override
    public void AtacarPunioTrueno() {
        System.out.println("Soy Pikachu y este es mi ataque puño trueno!");
    }
}

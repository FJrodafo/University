package PokemonInterfacesClasesAbstactras;

public class Squirtle extends Pokemon implements IAgua {
    // Constructor
    public Squirtle() {}

    @Override
    protected void AtacarPlacaje() {
        System.out.println("Soy Squirtle y este es mi ataque placaje!");
    }

    @Override
    protected void AtacarAraniazo() {
        System.out.println("Soy Squirtle y este es mi ataque arañazo!");
    }

    @Override
    protected void AtacarMordisco() {
        System.out.println("Soy Squirtle y este es mi ataque mordisco!");
    }

    @Override
    public void AtacarHidroBomba() {
        System.out.println("Soy Squirtle y este es mi ataque hidro bomba!");
    }

    @Override
    public void AtacarBurbuja() {
        System.out.println("Soy Squirtle y este es mi ataque burbuja!");
    }

    @Override
    public void AtacarPistolaAgua() {
        System.out.println("Soy Squitle y este es mi ataque pistola agua!");
    }
}

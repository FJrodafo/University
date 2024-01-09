import java.util.*;

/**
 * 
 * @author Francisco José Rodríguez Afonso
 */
public class PrimerPrograma {

    /**
     * 
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        String texto = null;

        Date fecha = new Date();

        System.out.println("\n---- " + fecha + " ----\n");

            Scanner teclado = new Scanner(System.in);

                System.out.print("Hola! Escribe algo: ");

                texto = teclado.nextLine();

            teclado.close();

        System.out.println("Escribiste: " + texto);

        System.out.println("\n---- Programa finalizado ----\n");

    }

}

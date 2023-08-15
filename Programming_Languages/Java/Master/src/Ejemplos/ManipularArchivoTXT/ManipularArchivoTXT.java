package Ejemplos.ManipularArchivoTXT;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class ManipularArchivoTXT {
    private Scanner teclado;
    private String path;
    private char yn;
    private boolean valido;

    public ManipularArchivoTXT() {
        this.teclado = new Scanner(System.in);
        this.path = "src/Ejemplos/ManipularArchivoTXT/";
        this.yn = ' ';
        this.valido = false;
    }

    void EscribirArchivoTXT() {
        System.out.print("Introduce el texto a guardar: ");
        String text = teclado.nextLine();
        try {
            // Añadir el true para no borrar el texto ya escrito previamente
            BufferedWriter fw = new BufferedWriter(new FileWriter(path + "archivo.txt", true));
            fw.write(text);
            fw.newLine();
            fw.close();
        } catch (IOException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }
    }

    void LeerArchivoTXT() {
        String contenido = "";
        try {
            BufferedReader fr = new BufferedReader(new FileReader(path + "archivo.txt"));
            int c;
            while ((c = fr.read()) != -1) {
                contenido += (char) c;
            }
            fr.close();
        } catch (FileNotFoundException e) {
            // Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println("El contenido del archivo es....\n\n" + contenido);
    }

    void ResetearArchivoTXT() {
        do {
            try {
                System.out.print("¿Estás seguro de que quieres retear el archivo de texto? [Y/N]: ");
                yn = teclado.nextLine().charAt(0);
            } catch (StringIndexOutOfBoundsException e) {
                valido = false;
            }
            if (yn == 'Y' || yn == 'y') {
                try {
                    BufferedWriter fw = new BufferedWriter(new FileWriter(path + "archivo.txt"));
                    fw.write("");
                    fw.close();
                } catch (IOException e) {
                    // Auto-generated catch block
                    e.printStackTrace();
                }
                System.out.println("El documento se ha reseteado correctamente.");
                valido = true;
            } else if (yn == 'N' || yn == 'n') {
                System.out.println("El documento no ha sido reseteado.");
                valido = true;
            } else {
                System.out.println("Introduce 'Y' si desea resetear el documento, 'N' si desea cancelar la operación.");
                valido = false;
            }
        } while (!valido);
    }
}

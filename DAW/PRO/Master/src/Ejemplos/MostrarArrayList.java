package Ejemplos;

import java.util.ArrayList; // Importar la clase ArrayList
import java.util.Collections; // Importar la clase Collections

public class MostrarArrayList {
    public static void main(String[] args) {

        // Crear un objeto de tipo ArrayList
        ArrayList<String> cars = new ArrayList<String>();

        // Para agregar elementos al ArrayList se usa el método add()
        cars.add("Volvo");
        cars.add("Ford");
        cars.add("Mazda");
        cars.add("BMW");

        // Imprimir todos los elementos del ArrayList cars
        System.out.println(cars + "\n");

        // Imprimir el elemento que se encuentra en dicha posición del ArrayList
        System.out.println(cars.get(2) + "\n");

        // Para cambiar el elemento de la posición 0 del ArrayList se usa el método set()
        cars.set(0, "Opel");
        System.out.println(cars + "\n");

        // Para eliminar el elemento de la posición 0 del ArrayList se usa el método remove()
        cars.remove(0);
        System.out.println(cars + "\n");

        // Para saber el tamaño actual del ArrayList se usa el método size()
        System.out.println(cars.size() + "\n");

        // Para recorrer el ArrayList se utiliza el siguiente bucle
        for (int i = 0; i < cars.size(); i++) {
            System.out.println(cars.get(i));
        }

        System.out.println(); // ignorar este salto de línea

        // También podemos usar un foreach para recorrer el ArrayList
        for (String i : cars) {
            System.out.println(i);
        }

        System.out.println(); // ignorar este salto de línea

        // Podemos ordenar el ArrayList alfabéticamente o numéricamente usando el método sort() del paquete Collections
        Collections.sort(cars);
        for (String i : cars) {
            System.out.println(i);
        }

        // Para eliminar todos los elementos del ArrayList se usa el método clear()
        cars.clear();
        System.out.println("\n" + cars + "\n");

        // También podemos crear un ArrayList de Integer en vez de String
        ArrayList<Integer> myNumbers = new ArrayList<Integer>();
        myNumbers.add(15);
        myNumbers.add(20);
        myNumbers.add(10);
        myNumbers.add(25);
        for (int i : myNumbers) {
            System.out.println(i);
        }
        System.out.println(); // ignorar este salto de línea
        Collections.sort(myNumbers); // Sort myNumbers
        for (int i : myNumbers) {
            System.out.println(i);
        }
    }
}

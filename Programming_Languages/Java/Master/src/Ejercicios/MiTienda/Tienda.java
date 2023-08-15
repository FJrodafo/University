package Ejercicios.MiTienda;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Tienda {
    private ArrayList<Producto> listaProductos;
    private Producto producto;
    private Scanner teclado;
    private String nombre, categoria, descripcion;
    private float precio;
    private boolean valido;

    public Tienda() {
        this.listaProductos = new ArrayList<>();
        this.teclado = new Scanner(System.in);
    }

    public void agregarProducto() {
        do {
            valido = false;
            System.out.print("Introduzca el nombre del nuevo producto: ");
            nombre = teclado.nextLine();
            try {
                if (nombre.isBlank()) {
                    System.out.println("El nombre del producto no puede estar vacío.");
                } else if (producto.getNombre().equals(nombre)) {
                    System.out.println("Este producto ya existe, introduzca un nombre distinto.");
                } else {
                    valido = true;
                }
            } catch (NullPointerException e) {
                valido = true;
            }
        } while (!valido);
        do {
            valido = false;
            System.out.print("Introduzca la categoría del nuevo producto: ");
            categoria = teclado.nextLine();
            if (categoria.isBlank()) {
                System.out.println("La categoría del producto no puede estar vacía.");
            } else {
                valido = true;
            }
        } while (!valido);
        do {
            valido = false;
            try {
                System.out.print("Introduzca el precio del nuevo producto: ");
                precio = teclado.nextFloat();
                teclado.nextLine();
                if (!Validaciones.validarPrecio(precio)) {
                    System.out.println("El precio del producto debe ser mayor que cero.");
                } else {
                    valido = true;
                }
            } catch (InputMismatchException e) {
                System.out.println("Error al introducir el precio del producto.");
                teclado.next();
            }
        } while (!valido);
        do {
            valido = false;
            System.out.print("Introduzca la descripción del nuevo producto: ");
            descripcion = teclado.nextLine();
            if (descripcion.isBlank()) {
                System.out.println("La descripción del producto no puede estar vacía.");
            } else {
                valido = true;
            }
        } while (!valido);
        producto = new Producto(nombre, categoria, descripcion, precio);
        listaProductos.add(producto);
    }

    public void eliminarProducto() {
        if (listaProductos.isEmpty()) {
            System.out.println("Actualmente no hay productos en la tienda.");
        } else {
            System.out.print("Introduzca el nombre del producto que desea eliminar: ");
            String nombreProducto = teclado.nextLine();
            boolean productoEncontrado = false;
            for (Producto producto : listaProductos) {
                if (producto.getNombre().equals(nombreProducto)) {
                    listaProductos.remove(producto);
                    System.out.println(nombreProducto + " eliminado correctamente.");
                    productoEncontrado = true;
                    break;
                }
            }
            if (!productoEncontrado) {
                System.out.println("El producto introducido no exite en la tienda.");
            }
        }
    }

    public void buscarProducto() {
        if (listaProductos.isEmpty()) {
            System.out.println("Actualmente no hay productos en la tienda.");
        } else {
            System.out.print("Introduzca el nombre del producto que desea buscar: ");
            String nombreProducto = teclado.nextLine();
            boolean productoEncontrado = false;
            for (Producto producto : listaProductos) {
                if (producto.getNombre().equals(nombreProducto)) {
                    System.out.println("Nombre, Categoría, Precio [ Descripción ]");
                    System.out.println(producto);
                    productoEncontrado = true;
                    break;
                }
            }
            if (!productoEncontrado) {
                System.out.println("El producto introducido no exite en la tienda.");
            }
        }
    }

    public void listarProductos() {
        if (listaProductos.isEmpty()) {
            System.out.println("Actualmente no hay productos en la tienda.");
        } else {
            System.out.println("Nombre, Categoría, Precio [ Descripción ]");
            for (Producto producto : listaProductos) {
                System.out.println(producto);
            }
        }
    }
}

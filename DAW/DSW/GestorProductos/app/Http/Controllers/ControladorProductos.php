<?php

namespace App\Http\Controllers;

use App\Models\ModeloProductos;

class ControladorProductos extends Controller
{
    public function index()
    {
        // Obtener todos los productos
        $productos = ModeloProductos::all();

        // Enviar los datos a la vista
        return view('VistaProductos', compact('productos'));
    }

    public function show($id)
    {
        // Buscar el producto por ID
        $producto = ModeloProductos::find($id);

        // Si no existe, devolver error 404
        if (!$producto) abort(404, 'Producto no encontrado');

        // Pasar el producto a la vista
        return view('VistaProducto', compact('producto'));
    }
}

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
}

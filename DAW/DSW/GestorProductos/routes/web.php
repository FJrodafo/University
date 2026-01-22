<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ControladorProductos;

Route::get('/', function () {
    return view('welcome');
});

// Ruta para mostrar todos los productos
Route::get('/productos', [ControladorProductos::class, 'index']);

// Nueva ruta para mostrar un único producto
Route::get('/productos/{id}', [ControladorProductos::class, 'show']);

<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ControladorProductos;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/productos', [ControladorProductos::class, 'index']);

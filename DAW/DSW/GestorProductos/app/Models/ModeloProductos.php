<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ModeloProductos extends Model
{
    protected $table = 'productos';  // nombre real de la tabla
    protected $primaryKey = 'id';  // por defecto
}

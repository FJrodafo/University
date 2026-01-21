## Índice

1. [Instalación](#instalación)
2. [Creación del proyecto](#creación-del-proyecto)
3. [Configuración de la base de datos](#configuración-de-la-base-de-datos)
4. [Crear modelo, vista y controlador](#crear-modelo-vista-y-controlador)
    1. [Modelo](#modelo)
    2. [Vista](#vista)
    3. [Controlador](#controlador)
5. [Definir el modelo](#definir-el-modelo)
6. [Conectar controlador y vista](#conectar-controlador-y-vista)
7. [Implementar el controlador](#implementar-el-controlador)
8. [Modificar la vista para mostrar los productos](#modificar-la-vista-para-mostrar-los-productos)
9. [Resultado final](#resultado-final)

## Instalación

https://laravel.com/

```shell
/bin/bash -c "$(curl -fsSL https://php.new/install/linux/8.4)"
```

```
php -v
composer --version
laravel --version
```

## Creación del proyecto

```shell
laravel new GestorProductos
```

## Configuración de la base de datos

Modificamos el archivo `.env` con los datos de nuestra base de datos:

```env
SESSION_DRIVER=file  # Soluciona el error: Falta la tabla sessions

DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=tienda
DB_USERNAME=fjrodafo
DB_PASSWORD=0000
```

Limpia el caché de configuración:

```shell
php artisan config:clear
```

## Crear modelo, vista y controlador

### Modelo

Para crear el modelo `app/Models/ModeloProductos.php` (Si luego usas migraciones, puedes añadir -m):

```shell
php artisan make:model ModeloProductos
```

### Vista

Para crear la vista `resources/views/VistaProductos.blade.php`:

```shell
php artisan make:view VistaProductos
```

Con el siguiente contenido:

```php
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestor de Productos</title>
</head>
<body>
    <h1>Gestor de Productos</h1>
</body>
</html>
```

### Controlador

Para crear el controlador `app/Http/Controllers/ControladorProductos.php`:

```shell
php artisan make:controller ControladorProductos
```

## Definir el modelo

Editamos el archivo `app/Models/ModeloProductos.php` con el siguiente contenido:

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ModeloProductos extends Model
{
    protected $table = 'productos';  // nombre real de la tabla
    protected $primaryKey = 'id';  // por defecto
}
```

## Conectar controlador y vista

Editamos el archivo `routes/web.php` con el siguiente contenido:

```php
use App\Http\Controllers\ControladorProductos;

Route::get('/productos', [ControladorProductos::class, 'index']);
```

## Implementar el controlador

Editamos el archivo `app/Http/Controllers/ControladorProductos.php` con el siguiente contenido:

```php
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
```

## Modificar la vista para mostrar los productos

Editamos el archivo `resources/views/VistaProductos.blade.php` con el siguiente contenido:

```php
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestor de Productos</title>
</head>
<body>

    <h1>Listado de productos</h1>

    @if ($productos->isEmpty())
        <p>No hay productos en la base de datos.</p>
    @else
        <table border="1" cellpadding="5">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Precio</th>
            </tr>

            @foreach ($productos as $producto)
                <tr>
                    <td>{{ $producto->id }}</td>
                    <td>{{ $producto->nombre }}</td>
                    <td>{{ $producto->precio }}</td>
                </tr>
            @endforeach
        </table>
    @endif

</body>
</html>
```

## Resultado final

Finalmente ejecutamos nuestro proyecto Laravel con el siguiente comando:

```shell
php artisan serve
```

http://127.0.0.1:8000/

http://127.0.0.1:8000/productos
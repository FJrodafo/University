<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Gestor de Productos</title>
    </head>
    <body>
        <h2>Producto {{ $producto->id }}</h2>
        <table border="1" cellpadding="5">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Precio</th>
            </tr>
            <tr>
                <td>{{ $producto->id }}</td>
                <td>{{ $producto->nombre }}</td>
                <td>{{ $producto->precio }}</td>
            </tr>
        </table>
        <br>
        <button onclick="window.location='{{ url('/productos') }}'">Volver</button>
    </body>
</html>

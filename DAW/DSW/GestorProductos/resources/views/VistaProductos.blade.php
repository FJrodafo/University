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

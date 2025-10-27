<?php
    // Recibe parámetros mediante GET y los muestra en pantalla.
    // Ejemplo de uso: http://daw.fjrodafo.com/dsw/get.php?nombre=Fran&apellido=Afonso

    $nombre = $_GET['nombre'];
    $apellido = $_GET['apellido'];
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Datos recibidos mediante GET</title>
    </head>
    <body>
        <h2>Datos recibidos mediante GET</h2>
        <p>Nombre: <?= $nombre ?></p>
        <p>Apellido: <?= $apellido ?></p>
    </body>
</html>

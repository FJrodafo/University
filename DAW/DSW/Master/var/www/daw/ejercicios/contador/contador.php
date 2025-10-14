<?php
    // Muestra el número de veces que se ha ejecutado el script.

    $archivoContador = __DIR__ . '/contador.txt';

    $contador = (int) file_get_contents($archivoContador);

    $contador++;

    file_put_contents($archivoContador, (string) $contador);
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Contador</title>
    </head>
    <body>
        <h2>Contador</h2>
        <p>Este script ha sido cargado <?= $contador ?> veces.</p>
    </body>
</html>

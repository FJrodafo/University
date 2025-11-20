<?php
    // Realiza operaciones aritméticas entre dos números.

    $num1 = 7;
    $num2 = 4;

    $suma = $num1 + $num2;
    $resta = $num1 - $num2;
    $producto = $num1 * $num2;
    $division = ($num2 != 0) ? ($num1 / $num2) : "Err";
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Operaciones Aritméticas</title>
    </head>
    <body>
        <h2>Operaciones Aritméticas</h2>
        <p>Primer número: <?= $num1 ?></p>
        <p>Segundo número: <?= $num2 ?></p>
        <p>Suma: <?= $suma ?></p>
        <p>Resta: <?= $resta ?></p>
        <p>Producto: <?= $producto ?></p>
        <p>División: <?= $division ?></p>
    </body>
</html>

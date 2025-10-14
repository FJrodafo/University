<?php
    // Recibe dos números del formulario y calcula la suma, la resta, el producto y la división.

    $num1 = $_POST['num1'];
    $num2 = $_POST['num2'];

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
        <title>Calculadora</title>
    </head>
    <body>
        <h2>Resultado</h2>
        <p><?= $num1 ?> + <?= $num2 ?> = <?= $suma ?></p>
        <p><?= $num1 ?> - <?= $num2 ?> = <?= $resta ?></p>
        <p><?= $num1 ?> * <?= $num2 ?> = <?= $producto ?></p>
        <p><?= $num1 ?> / <?= $num2 ?> = <?= $division ?></p>
        <button type="button" onclick="window.location.href='formulario.html'">Volver al formulario</button>
    </body>
</html>

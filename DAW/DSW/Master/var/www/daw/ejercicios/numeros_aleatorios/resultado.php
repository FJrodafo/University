<?php
    // Recibe un número N del formulario y genera N números aleatorios entre 1 y 100.
    // Luego muestra el mayor, el menor, la suma y la media de los números generados.

    $num = $_POST['num'];

    $nums = [];

    for ($i = 0; $i < $num; $i++) {
        $nums[] = rand(1, 100);
    }

    $mayor = max($nums);
    $menor = min($nums);
    $suma = array_sum($nums);
    $media = $suma / count($nums);
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Números aleatorios</title>
    </head>
    <body>
        <h2>Resultado</h2>
        <p>Números generados: <?= implode(", ", $nums) ?>.</p>
        <p>Mayor: <?= $mayor ?></p>
        <p>Menor: <?= $menor ?></p>
        <p>Suma: <?= $suma ?></p>
        <p>Media: <?= $media ?></p>
        <button type="button" onclick="window.location.href='formulario.html'">Volver al formulario</button>
    </body>
</html>

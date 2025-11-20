<?php
    // Recibe un número del formulario y devuelve los números pares e impares hasta ese número.

    $num = $_POST['num'];

    $pares = [];
    $impares = [];

    if ($num !== null) {
        $num = (int) $num;

        for ($i = 1; $i <= $num; $i++) {
            if ($i % 2 === 0) {
                $pares[] = $i;
            } else {
                $impares[] = $i;
            }
        }
    }
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Números pares e impares</title>
    </head>
    <body>
        <h2>Resultado</h2>
        <p>Números pares: <?= implode(", ", $pares) ?>.</p>
        <p>Números impares: <?= implode(", ", $impares) ?>.</p>
        <button type="button" onclick="window.location.href='formulario.html'">Volver al formulario</button>
    </body>
</html>

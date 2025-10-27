<?php
    // Muestra la fecha y hora actuales del sistema.

    date_default_timezone_set('Atlantic/Canary');

    $fechaActual = date('d/m/Y');
    $horaActual = date('H:i:s');
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Fecha y hora actuales</title>
    </head>
    <body>
        <h2>Fecha y hora actuales</h2>
        <p>Fecha: <?= $fechaActual ?></p>
        <p>Hora: <?= $horaActual ?></p>
    </body>
</html>

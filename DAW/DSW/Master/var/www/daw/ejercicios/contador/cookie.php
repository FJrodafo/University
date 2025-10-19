<?php
    // Muestra la fecha, hora y el número de veces que se ha ejecutado el script a través de una cookie que caduca al año.

    $cookieName = "contador_visitas";

    if (isset($_COOKIE[$cookieName])) {
        $contador = (int)$_COOKIE[$cookieName] + 1;
    } else {
        $contador = 1;
    }

    setcookie($cookieName, $contador, time() + (365 * 24 * 60 * 60), "/");

    $fecha_actual = date("d/m/Y H:i:s");
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Contador de visitas con Cookie</title>
    </head>
    <body>
        <h2>Contador de visitas con Cookie</h2>
        <p><?= $fecha_actual ?></p>
        <p>Este script ha sido cargado <?= $contador ?> veces.</p>
    </body>
</html>

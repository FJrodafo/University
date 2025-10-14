<?php
    // Muestra el contenido de un archivo de texto y permite al usuario añadir nuevas frases que se guardan al final del archivo.

    $archivo = __DIR__ . '/frases.txt';

    if (isset($_POST['frase'])) {
        $nuevaFrase = $_POST['frase'];
        file_put_contents($archivo, $nuevaFrase . PHP_EOL, FILE_APPEND);
    }

    $contenido = file($archivo, FILE_IGNORE_NEW_LINES);
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Gestor de frases</title>
    </head>
    <body>
        <h2>Frases guardadas</h2>
        <?php if (!empty($contenido)): ?>
            <ul>
                <?php foreach ($contenido as $linea): ?>
                    <li><?= $linea ?></li>
                <?php endforeach; ?>
            </ul>
        <?php else: ?>
            <p>No hay frases guardadas todavía.</p>
        <?php endif; ?>
        <h3>Agregar una nueva frase</h3>
        <form method="post" action="">
            <label for="frase">Escribe tu frase:</label>
            <input type="text" name="frase" id="frase" required autofocus />
            <input type="submit" value="Guardar" />
        </form>
    </body>
</html>

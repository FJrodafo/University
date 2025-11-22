<?php
    // Recibe la respuesta del formulario y comprueba si el resultado es correcto o no.

    $num1 = (int) $_POST['num1'];
    $num2 = (int) $_POST['num2'];
    $respuesta = (int) $_POST['respuesta'];

    $resultadoSuma = $num1 + $num2;
    $esCorrecto = ($respuesta === $resultadoSuma);
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Calcula la suma</title>
    </head>
    <body>
        <h2>Resultado</h2>
        <?php if ($esCorrecto): ?>
            <p><?= $num1 ?> + <?= $num2 ?> = <?= $resultadoSuma ?> ✅ ¡Correcto!</p>
        <?php else: ?>
            <p><?= $num1 ?> + <?= $num2 ?> = <?= $respuesta ?> ❌ Incorrecto...</p>
        <?php endif; ?>
        <button type="button" onclick="window.location.href='formulario.php'">Volver al formulario</button>
    </body>
</html>

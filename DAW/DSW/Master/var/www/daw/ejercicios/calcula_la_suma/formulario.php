<?php
    $num1 = rand(1, 10);
    $num2 = rand(1, 10);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Calcula la suma</title>
</head>
<body>
    <h2>Formulario</h2>
    <form action="resultado.php" method="post">
        <input type="hidden" name="num1" value="<?= $num1 ?>" />
        <input type="hidden" name="num2" value="<?= $num2 ?>" />
        <label for="respuesta"><?= $num1 ?> + <?= $num2 ?> =</label>
        <input type="number" name="respuesta" id="respuesta" required autofocus />
        <input type="submit" value="Enviar" />
    </form>
</body>
</html>

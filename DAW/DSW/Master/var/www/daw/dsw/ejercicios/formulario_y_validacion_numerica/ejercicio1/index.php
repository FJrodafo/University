<?php
    // Muestra un formulario que pida dos números mediante POST, valida que ambos sean numéricos y muestra la suma o un mensaje de error según corresponda.

    if (isset($_POST["num1"]) || isset($_POST["num2"])) {
        $num1 = $_POST["num1"];
        $num2 = $_POST["num2"];

        // Comprobamos si los valores son numéricos
        if (!is_numeric($num1) || !is_numeric($num2)) {
            $msg = "<p style='color:red;'>Error: Ambos valores deben ser numéricos.</p>";
        } else {
            // Son numéricos → se muestra la suma
            $suma = $num1 + $num2;
            $msg = "<p>El resultado de la suma es: <strong>" . $num1 . " + " . $num2 . " = " . $suma . "</strong></p>";
        }
    }
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Formulario suma</title>
</head>

<body>
    <h2>Formulario suma</h2>
    <form method="post" action="">
        <label for="num1">Número 1:</label>
        <input type="text" name="num1" />
        <br />
        <br />
        <label for="num2">Número 2:</label>
        <input type="text" name="num2" />
        <br />
        <br />
        <input type="submit" value="Calcular suma" />
    </form>
    <?= $msg ?>
</body>

</html>

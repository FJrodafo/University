<?php
    // Escribe un script php que podría llamarse "porcentaje.php" que muestre al usuario un formulario en el que pida al usuario un "Importe" y un "Porcentaje" y que cuando el usuario envíe los datos el programa muestre el resultado de calcular el porcentaje del importe introducido.
    // Debemos controlar que cuando el usuario envíe los datos estos sean correctos, es decir, que no nos pase un campo en blanco o con algo que no sea un número.
    // En caso de algún error debemos mostrar un mensaje de error apropiado a cada tipo de error y volver a pedir los datos.
    // Para realizar el chequeo de los datos y el cálculo del porcentaje debemos hacer uso de funciones.

    // Comprueba si un valor es numérico y no está vacío.
    function validar_numero($valor) {
        return ($valor !== "" && is_numeric($valor));
    }

    // Calcula el porcentaje.
    function calcular_porcentaje($importe, $porcentaje) {
        return $importe * ($porcentaje / 100);
    }

    $errores = [];
    $importe = "";
    $porcentaje = "";
    $resultado = null;

    // Si el formulario ha sido enviado.
    if ($_SERVER["REQUEST_METHOD"] === "POST") {

        $importe = $_POST["importe"] ?? "";
        $porcentaje = $_POST["porcentaje"] ?? "";

        // Validación del importe.
        if (!validar_numero($importe)) {
            $errores[] = "El campo 'Importe' debe contener un número válido.";
        }

        // Validación del porcentaje.
        if (!validar_numero($porcentaje)) {
            $errores[] = "El campo 'Porcentaje' debe contener un número válido.";
        }

        // Si no hay errores, calcular.
        if (empty($errores)) {
            $resultado = calcular_porcentaje($importe, $porcentaje);
        }
    }
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Calcular porcentaje</title>
    </head>
    <body>
        <h2>Calcular porcentaje</h2>

        <?php
            // Mostrar errores si los hay.
            if (!empty($errores)) {
                echo "<ul style='color:red;'>";
                foreach ($errores as $e) {
                    echo "<li>$e</li>";
                }
                echo "</ul>";
            }
        ?>

        <form method="post" action="">
            <label>Importe: </label>
            <input type="text" name="importe" value="<?= htmlspecialchars($importe) ?>" />
            <br />
            <br />
            <label>Porcentaje: </label>
            <input type="text" name="porcentaje" value="<?= htmlspecialchars($porcentaje) ?>" />
            <br />
            <br />
            <input type="submit" value="Calcular" />
        </form>

        <?php
            // Mostrar resultado si todo fue correcto.
            if ($resultado !== null) {
                echo "<h3>Resultado: $resultado</h3>";
            }
        ?>

    </body>
</html>

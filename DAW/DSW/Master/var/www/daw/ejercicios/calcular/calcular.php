<?php
    // Recibe los datos del formulario y calcula la suma y la resta

    // Comprobamos que se han recibido los dos números
    if (isset($_POST['num1']) && isset($_POST['num2'])) {
        $num1 = (float) $_POST['num1'];
        $num2 = (float) $_POST['num2'];

        // Operaciones
        $suma = $num1 + $num2;
        $resta = $num1 - $num2;
        $producto = $num1 * $num2;

        // Validar que el divisor no sea 0
        if ($num2 != 0) {
            $division = $num1 / $num2;
        } else {
            $division = "INF";
        }

        // Mostrar los resultados en formato HTML
        echo "<h2>Resultados</h2>";
        echo "<p>" . $num1 . " + " . $num2 . " = " . $suma . "</p>";
        echo "<p>" . $num1 . " - " . $num2 . " = " . $resta . "</p>";
        echo "<p>" . $num1 . " * " . $num2 . " = " . $producto . "</p>";
        echo "<p>" . $num1 . " / " . $num2 . " = " . $division . "</p>";
        echo "<p><a href='formulario.php'>Volver al formulario</a></p>";
    } else {
        echo "<h2>Resultados</h2>";
        echo "<p>No se han recibido los datos correctamente.</p>";
        echo "<p><a href='formulario.php'>Volver al formulario</a></p>";
    }
?>

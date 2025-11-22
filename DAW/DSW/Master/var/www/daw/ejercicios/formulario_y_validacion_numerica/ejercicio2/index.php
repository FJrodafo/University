<?php
    // Reestructura el ejercicio anterior creando una función que compruebe si los datos son enteros y otra que realice la suma, repitiendo la solicitud si los valores no son válidos.

    // Si aún no se enviaron datos, mostramos el formulario.
    if (!isset($_POST["num1"]) || !isset($_POST["num2"])) {
        mostrarFormulario();
    } else {
        $num1 = $_POST["num1"];
        $num2 = $_POST["num2"];

        // Llamamos a la función que revisa si ambos datos son enteros.
        if (!sonEnteros($num1, $num2)) {
            mostrarFormulario();
            echo "<p style='color:red;'>Error: Ambos valores deben ser números enteros.</p>";
        } else {
            // Llamamos a la función que realiza la suma.
            sumarEnteros($num1, $num2);
        }
    }

    // Comprueba si los datos enviados son enteros.
    function sonEnteros($a, $b) {
        return (
            filter_var($a, FILTER_VALIDATE_INT) !== false
            &&
            filter_var($b, FILTER_VALIDATE_INT) !== false
        );
    }

    // Realiza y muestra la suma.
    function sumarEnteros($a, $b) {
        mostrarFormulario();
        $resultado = $a + $b;
        echo "<p>El resultado de la suma es: <strong>" . $a . " + " . $b . " = " . $resultado . "</strong></p>";
    }

    // Muestra el formulario.
    function mostrarFormulario() {
        echo '
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
        ';
    }
?>

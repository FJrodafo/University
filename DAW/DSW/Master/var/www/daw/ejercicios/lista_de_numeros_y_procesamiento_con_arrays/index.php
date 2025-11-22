<?php
    // Solicita al usuario una lista de números separados por comas, conviértela en un array, valida que todos los elementos sean numéricos y muestra el primer valor, la suma total y la cantidad de elementos.

    // Si no se ha enviado la lista aún, mostramos el formulario.
    if (!isset($_POST["lista"])) {
        mostrarFormulario();
    } else {
        $cadena = $_POST["lista"];

        // Convertimos la cadena en array.
        $arrayNumeros = explode(",", $cadena);

        // Limpiamos espacios en blanco para evitar problemas.
        $arrayNumeros = array_map('trim', $arrayNumeros);

        // Validamos los elementos del array.
        if (!todosSonNumeros($arrayNumeros)) {
            mostrarFormulario();
            echo "<p style='color:red;'>Error: Todos los elementos deben ser números válidos.</p>";
        } else {
            // Cálculos solicitados.
            $primerElemento = $arrayNumeros[0];
            $suma = array_sum($arrayNumeros);
            $cantidad = count($arrayNumeros);

            // Mostrar resultados.
            mostrarFormulario();
            echo "<p>Primer elemento del array: <strong>" . $primerElemento . "</strong></p>";
            echo "<p>Suma de todos los números: <strong>" . $suma . "</strong></p>";
            echo "<p>Número de elementos del array: <strong>" . $cantidad . "</strong></p>";
        }
    }

    // Comprueba si todos los elementos son numéricos.
    function todosSonNumeros($array) {
        foreach ($array as $valor) {
            if (!is_numeric($valor)) {
                return false;
            }
        }

        return true;
    }

    // Muestra el formulario.
    function mostrarFormulario() {
        echo '
            <h2>Lista de números y procesamiento con arrays</h2>
            <form method="post" action="">
                <label>Introduce una lista de números separados por comas: </label>
                <input type="text" name="lista" size="40" autofocus>
                <input type="submit" value="Procesar">
            </form>
        ';
    }
?>

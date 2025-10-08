<?php
    // Script que genera dos números aleatorios, pide al usuario la suma y verifica si la respuesta es correcta o no

    // Generar dos números aleatorios entre 1 y 10
    $numero1 = rand(1, 10);
    $numero2 = rand(1, 10);

    // Comprobar si el usuario ha enviado el formulario
    if (isset($_POST['respuesta'])) {
        // Recuperar los datos del formulario
        $respuestaUsuario = (int) $_POST['respuesta'];
        $numero1 = (int) $_POST['numero1'];
        $numero2 = (int) $_POST['numero2'];

        // Calcular la suma correcta
        $sumaCorrecta = $numero1 + $numero2;

        // Comprobar la respuesta
        if ($respuestaUsuario === $sumaCorrecta) {
            echo "<h3>✅ ¡Correcto!</h3>";
            echo "<p>La suma de $numero1 + $numero2 es efectivamente $sumaCorrecta.</p>";
        } else {
            echo "<h3>❌ Incorrecto</h3>";
            echo "<p>Tu respuesta fue $respuestaUsuario, pero la correcta era $sumaCorrecta.</p>";
        }

        echo "<p><a href='suma.php'>Intentar de nuevo</a></p>";

    } else {
        // Mostrar el formulario al usuario
        echo "<h2>Ejercicio de suma</h2>";
        echo "<p>¿Cuánto es <strong>$numero1 + $numero2</strong>?</p>";
        echo "
            <form method='post' action=''>
                <input type='hidden' name='numero1' value='$numero1'>
                <input type='hidden' name='numero2' value='$numero2'>
                <label for='respuesta'>Tu respuesta:</label>
                <input type='number' name='respuesta' id='respuesta' required>
                <input type='submit' value='Comprobar'>
            </form>
        ";
    }
?>

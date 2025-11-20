<?php
    // Escribe un script PHP que declare una variable global, la duplique dentro de una función y muestre su valor antes y después de ser modificada.

    // Variable global.
    $num = 5;

    function duplicarValor() {
        // Indicamos que queremos utilizar la variable global.
        global $num;

        // Duplicamos su valor.
        $num = $num * 2;
    }

    echo "Valor inicial: " . $num . "<br />";

    // Llamamos a la función que duplica el valor.
    duplicarValor();

    echo "Valor después de llamar a la función: " . $num;
?>

<?php
    // Crea una función que defina y muestre una variable local, y comprueba si es posible acceder a esa variable desde fuera de la función.

    function mostrarVariableLocal() {
        // Variable local (solo existe dentro de esta función).
        $num = 5;

        echo "Valor dentro de la función: " . $num . "<br />";
    }

    // Llamamos a la función.
    mostrarVariableLocal();

    // Intentamos mostrar el valor de la variable local desde fuera de la función.
    // No se puede acceder desde el exterior al valor de una variable que se ha creado
    // dentro de una función, es decir, una variable creada en un nivel/capa inferior.
    echo "Valor fuera de la función: " . $num;
?>

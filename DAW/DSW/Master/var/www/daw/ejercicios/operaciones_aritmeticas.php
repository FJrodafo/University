<?php
    // Script que realiza operaciones aritméticas básicas entre dos números

    // Declaración e inicialización de variables numéricas
    $numero1 = 10;
    $numero2 = 5; // No debe ser cero para evitar división entre cero

    // Operaciones
    $suma = $numero1 + $numero2;
    $resta = $numero1 - $numero2;
    $producto = $numero1 * $numero2;
    $division = $numero1 / $numero2;

    // Mostrar los resultados en formato HTML
    echo "<h2>Operaciones Aritméticas</h2>";
    echo "<p>Primer número: " . $numero1 . "</p>";
    echo "<p>Segundo número: " . $numero2 . "</p>";
    echo "<p>Suma: " . $suma . "</p>";
    echo "<p>Resta: " . $resta . "</p>";
    echo "<p>Producto: " . $producto . "</p>";
    echo "<p>División: " . $division . "</p>";
?>

<?php
    // Un array simple.
    #$array1 = array(
    #    "foo" => "bar",
    #    "bar" => "foo",
    #);
    // A partir de PHP 5.4
    $array1 = [
        "foo" => "bar",
        "bar" => "foo",
    ];

    // Claves mixtas integer y string.
    $array2 = [
        "foo" => "bar",
        "bar" => "foo",
        100 => -100,
        -100 => 100,
    ];

    // Arrays indexados sin clave.
    $array3 = ["foo", "bar", "hello", "world"];

    // Claves no en todos los elementos.
    $array4 = [
        "a",
        "b",
        6 => "c",
        "d",
    ];

    // Acceso a elementos de un array multidimensional.
    $array5 = [
        "foo" => "bar",
        42 => 24,
        "array" => $array6 = [
            "multi" => $array7 = [
                "dimensional" => "foo",
            ],
        ],
    ];

    // Acceso a elementos de un array multidimensional.
    $array9 = [];
    $array9[0] = [
        "titulo" => "El mundo y sus demonios",
        "autor" => "Carl Sagan",
    ];
    $array9[1] = [
        "titulo" => "Comer sin miedo",
        "autor" => "J. M. Mulet",
    ];

    // Recorrer un array secuencialmente.
    $colores = ["rojo", "amarillo", "azul"];
    $persona = [
        "nombre" => "Hipatia",
        "apellido" => "Pi",
        "direccion" => "calle ciencia",
        "nacionalidad" => "egipcia",
    ];
    $numeros = [
        "Cero", "Uno", "Dos", "Tres", "Cuatro",
        "Cinco", "Seis", "Siete", "Ocho", "Nueve",
    ];
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Arrays</title>
    </head>
    <body>
        <h2>var_dump</h2>
        <p>Array1 => <?= var_dump($array1); ?></p>
        <p>Array2 => <?= var_dump($array2); ?></p>
        <p>Array3 => <?= var_dump($array3); ?></p>
        <p>Array4 => <?= var_dump($array4); ?></p>
        <p>Array5 => <?= var_dump($array5); ?></p>
        <p>Array5["foo"] => <?= var_dump($array5["foo"]); ?></p>
        <p>Array5[42] => <?= var_dump($array5[42]); ?></p>
        <p>Array5["array"]["multi"]["dimensional"] => <?= var_dump($array5["array"]["multi"]["dimensional"]); ?></p>
        <?php
            // Crear un array simple.
            $array8 = [1, 2, 3, 4, 5];
        ?>
        <p>Array8 => <?= var_dump($array8); ?></p>
        <?php
            // Eliminar cada elemento dejando el array intacto.
            foreach ($array8 as $i => $value) {
                unset($array8[$i]);
            }
        ?>
        <p>Array8 => <?= var_dump($array8); ?></p>
        <?php
            // Agregar un elemento (debido a que el array quedó intacto en el momento en le que se eliminó su contenido, la clave es 5).
            $array8[] = 6;
        ?>
        <p>Array8 => <?= var_dump($array8); ?></p>
        <?php
            // Re-indexar.
            $array8 = array_values($array8);
            $array8[] = 7;
        ?>
        <p>Array8 => <?= var_dump($array8); ?></p>
        <p>Array9 => <?= var_dump($array9[1]["autor"]); ?></p>
        <?php
            // Crear un array simple.
            $array10 = ["Cuadrado", "Triángulo", "Círculo"];
        ?>
        <p>Array10 => <?= var_dump($array10); ?></p>
        <?php
            // Añadir un elemento al final del array.
            array_push($array10, "Pentágono");
        ?>
        <p>Array10 => <?= var_dump($array10); ?></p>
        <?php
            // Añadir un elemento al comienzo del array.
            array_unshift($array10, "Hexágono");
        ?>
        <p>Array10 => <?= var_dump($array10); ?></p>
        <?php
            // Eliminar un elemento al final del array.
            array_pop($array10);
        ?>
        <p>Array10 => <?= var_dump($array10); ?></p>
        <?php
            // Eliminar un elemento al comienzo del array.
            array_shift($array10);
        ?>
        <p>Array10 => <?= var_dump($array10); ?></p>
        <h2>print_r</h2>
        <p>Array1 => <?php print_r($array1); ?></p>
        <p>Array2 => <?php print_r($array2); ?></p>
        <p>Array3 => <?php print_r($array3); ?></p>
        <p>Array4 => <?php print_r($array4); ?></p>
        <p>Array5 => <?php print_r($array5); ?></p>
        <p>Array5["foo"] => <?php print_r($array5["foo"]); ?></p>
        <p>Array5[42] => <?php print_r($array5[42]); ?></p>
        <p>Array5["array"]["multi"]["dimensional"] => <?php print_r($array5["array"]["multi"]["dimensional"]); ?></p>
        <?php
            // Crear un array simple.
            $array8 = [1, 2, 3, 4, 5];
        ?>
        <p>Array8 => <?php print_r($array8); ?></p>
        <?php
            // Eliminar cada elemento dejando el array intacto.
            foreach ($array8 as $i => $value) {
                unset($array8[$i]);
            }
        ?>
        <p>Array8 => <?php print_r($array8); ?></p>
        <?php
            // Agregar un elemento (debido a que el array quedó intacto en el momento en le que se eliminó su contenido, la clave es 5).
            $array8[] = 6;
        ?>
        <p>Array8 => <?php print_r($array8); ?></p>
        <?php
            // Re-indexar.
            $array8 = array_values($array8);
            $array8[] = 7;
        ?>
        <p>Array8 => <?php print_r($array8); ?></p>
        <p>Array9 => <?php print_r($array9[1]["autor"]); ?></p>
        <?php
            // Crear un array simple.
            $array10 = ["Cuadrado", "Triángulo", "Círculo"];
        ?>
        <p>Array10 => <?php print_r($array10); ?></p>
        <?php
            // Añadir un elemento al final del array.
            array_push($array10, "Pentágono");
        ?>
        <p>Array10 => <?php print_r($array10); ?></p>
        <?php
            // Añadir un elemento al comienzo del array.
            array_unshift($array10, "Hexágono");
        ?>
        <p>Array10 => <?php print_r($array10); ?></p>
        <?php
            // Eliminar un elemento al final del array.
            array_pop($array10);
        ?>
        <p>Array10 => <?php print_r($array10); ?></p>
        <?php
            // Eliminar un elemento al comienzo del array.
            array_shift($array10);
        ?>
        <p>Array10 => <?php print_r($array10); ?></p>
        <h2>Recorrer un array secuencialmente</h2>
        <?php foreach ($colores as $color): ?>
            <p>Color actual <?= $color ?>.</p>
        <?php endforeach; ?>
        <?php foreach ($persona as $clave => $elemento): ?>
            <p>Clave - <?= $clave ?></p>
            <p>Elemento - <?= $elemento ?></p>
        <?php endforeach; ?>
        <?php for ($i = 0; $i < count($numeros); $i++): ?>
            <p><?= $numeros[$i] ?></p>
        <?php endfor; ?>
        <h2>Otras funciones para arrays</h2>
        <p>sort(): Sirve para ordenar un array no asociativo, recibe dos parámteros. El primero es el array que se va a modificar y el segundo es el tipo de algoritmo que se le va aplicar (SORT_NUMERIC, SORT_STRING, SORT_REGULAR, estos son los más utilizados).</p>
        <p>ksort(): Es lo mismo que sort pero funciona para ordenar arrays asociativos por la clave.</p>
        <p>asort(): Es lo mismo que sort pero funciona para ordenar arrays asociativos por el valor.</p>
        <p>print_r(): Imprime todos los elementos del array que recibe como parámetro.</p>
        <p>in_array(): Busca un valor (primer parámetro) en un array (segundo paŕametro) y devuelve True si lo consigue o False si no.</p>
        <p>array_keys(): Recibe como parámetro un array asociativo y retorna un array solo con las claves.</p>
        <p>array_search(): Busca un valor (primer parámetro) en un array (segundo parámetro) y devuelve la posición si lo consigue.</p>
        <p>array_count_values(): Calcula la frecuencia de cada uno de los elementos de un array.</p>
        <p>count(): Cuenta los elementos de un array.</p>
    </body>
</html>

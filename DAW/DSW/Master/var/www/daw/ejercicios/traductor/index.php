<?php
    // Escribe un script php que inicialice un array de pares palabra_en_español → palabra_en_ingles, por ejemplo casa → house, y a continuación muestre al usuario un formulario en el que pide al usuario una palabra en español.
    // Cuando el usuario envía la palabra en español debemos chequear si la palabra existe en nuestro array.
    // Si existe mostramos la traducción de dicha la palabra y damos la posibilidad al usuario de introducir nuevamente una palabra.
    // Si la palabra no existe mostramos un mensaje indicando al usuario que la palabra no existe y damos la posibilidad al usuario de introducir nuevamente una palabra.
    // Para la inicialización del array y para chequear la existencia de la palabra en el diccionario debemos hacer uso de funciones.

    // Función que inicializa el diccionario.
    function inicializarDiccionario() {
        return [
            "casa" => "house",
            "perro" => "dog",
            "gato" => "cat",
            "árbol" => "tree",
            "libro" => "book"
        ];
    }

    // Función que busca una palabra en el diccionario.
    function traducirPalabra($diccionario, $palabra) {
        if (array_key_exists($palabra, $diccionario)) {
            return $diccionario[$palabra];
        } else {
            return false;
        }
    }

    // Inicializamos el diccionario.
    $diccionario = inicializarDiccionario();
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Traductor simple</title>
    </head>
    <body>
        <h2>Traductor Español → Inglés</h2>
        <form method="post">
            <label for="palabra">Introduce una palabra en español:</label><br>
            <input type="text" name="palabra" id="palabra" required>
            <button type="submit">Traducir</button>
        </form>

        <?php
            // Si el usuario envió una palabra.
            if ($_SERVER["REQUEST_METHOD"] === "POST") {
                $palabra = strtolower(trim($_POST["palabra"]));
                $traduccion = traducirPalabra($diccionario, $palabra);

                if ($traduccion !== false) {
                    echo "<p>Traducción: <strong>$palabra</strong> en inglés es <strong>$traduccion</strong>.</p>";
                } else {
                    echo "<p style='color:red;'>La palabra '$palabra' no existe en el diccionario.</p>";
                }
            }
        ?>
    </body>
</html>

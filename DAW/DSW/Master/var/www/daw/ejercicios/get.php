<?php
    // Script que recibe parámetros mediante el método GET y los muestra en pantalla

    // http://daw.fjrodafo.com/ejercicios/get.php?nombre=Fran&apellido=Afonso

    // Comprobar si existen los parámetros 'nombre' y 'apellido' en la URL
    if (isset($_GET['nombre']) && isset($_GET['apellido'])) {

        // Recuperar los valores enviados por la URL
        $nombre = $_GET['nombre'];
        $apellido = $_GET['apellido'];

        // Mostrar los valores en formato HTML
        echo "<h2>Datos recibidos mediante GET</h2>";
        echo "<p>Nombre: $nombre</p>";
        echo "<p>Apellido: $apellido</p>";

    } else {
        // Si no se pasan los parámetros, mostramos un mensaje de aviso:
        echo "<h2>Datos recibidos mediante GET</h2>";
        echo "<p>No se han recibido los parámetros 'nombre' y 'apellido'.</p>";
    }
?>

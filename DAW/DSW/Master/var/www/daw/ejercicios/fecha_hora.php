<?php
    // Script que muestra la fecha y hora actuales del sistema

    // Establecer zona horaria (opcional)
    #date_default_timezone_set('Europe/Madrid');
    date_default_timezone_set('Atlantic/Canary');

    // Obtener la fecha y hora actuales
    $fechaActual = date('d/m/Y');
    $horaActual = date('H:i:s');

    // Mostrar los resultados en formato HTML
    echo "<h2>Fecha y hora actuales</h2>";
    echo "<p>Fecha: " . $fechaActual . "</p>";
    echo "<p>Hora: " . $horaActual . "</p>";
?>

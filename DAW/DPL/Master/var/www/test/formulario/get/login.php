<?php
    $usuario = isset($_GET['var1']) ? htmlspecialchars($_GET['var1']) : 'Invitado';
    $contrasenia = isset($_GET['var2']) ? htmlspecialchars($_GET['var2']) : 'No definida';

    echo "Hola $usuario, tu contraseña es $contrasenia.";
?>

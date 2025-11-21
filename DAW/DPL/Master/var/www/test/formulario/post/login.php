<?php
    $usuario = isset($_POST['var1']) ? htmlspecialchars($_POST['var1']) : 'Invitado';
    $contrasenia = isset($_POST['var2']) ? htmlspecialchars($_POST['var2']) : 'No definida';

    echo "Hola $usuario, tu contraseña es $contrasenia.";
?>

<?php
    session_start();

    include 'funciones.php';

    $usuario = $_POST['usuario'] ?? '';
    $pass = $_POST['pass'] ?? '';

    if ($usuario === '' || $pass === '') {
        header("Location: index.php?error=1");
        exit;
    }

    if (!file_exists('datos_de_acceso.txt')) {
        file_put_contents('datos_de_acceso.txt', "");
    }

    $datos = cargar_datos();

    if (valida_usuario($usuario, $pass, $datos)) {
        $_SESSION['usuario'] = $usuario;
        header("Location: modificar_contrasenia.php");
        exit;
    } else {
        header("Location: index.php?error=1");
        exit;
    }
?>

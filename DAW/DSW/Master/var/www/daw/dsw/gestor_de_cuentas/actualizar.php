<?php
    include 'funciones.php';

    if (!isset($_SESSION['usuario'])) {
        header('Location: index.php');
        exit;
    }

    $usuario = $_SESSION['usuario'];
    $nueva = $_POST['nueva'] ?? '';
    $confirmar = $_POST['confirmar'] ?? '';

    if (!validar_contrasenias($nueva, $confirmar)) {
        header("Location: modificar_contrasenia.php?msg=error_confirmacion");
        exit;
    }

    $datos = cargar_datos();
    actualizar_contrasenia($usuario, $nueva, $datos);

    header("Location: modificar_contrasenia.php?msg=exito");
    exit;
?>

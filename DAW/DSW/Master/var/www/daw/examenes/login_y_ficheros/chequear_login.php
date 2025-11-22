<?php
    session_start();

    $usuario = $_POST['usuario'] ?? '';
    $contrasenia = $_POST['contrasenia'] ?? '';

    if ($usuario === '' || $contrasenia === '') {
        header("Location: login.php?error=1");
        exit;
    }

    if (!file_exists("accesos.txt")) {
        $accesos_iniciales = "usuario1:123456\nusuario2:123456\n";
        file_put_contents("accesos.txt", $accesos_iniciales);
    }

    $lineas = file("accesos.txt", FILE_IGNORE_NEW_LINES);

    $login_correcto = false;

    foreach ($lineas as $linea) {
        list($user, $passwd) = explode(":", trim($linea));
        if ($usuario === $user && $contrasenia === $passwd) {
            $login_correcto = true;
            $_SESSION['usuario'] = $usuario;
            break;
        }
    }

    if ($login_correcto) {
        header("Location: frases.php");
        exit;
    } else {
        header("Location: login.php?error=1");
        exit;
    }
?>

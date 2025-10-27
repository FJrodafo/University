<?php
    session_start();

    // Recibir datos del formulario
    $usuario = $_POST['usuario'] ?? '';
    $contrasena = $_POST['contrasena'] ?? '';

    // Validar credenciales
    if ($usuario === 'admin' && $contrasena === '123456') {
        $_SESSION['usuario'] = 'admin';
        header("Location: juegos.php");
        exit;
    } elseif ($usuario === 'user' && $contrasena === '123456') {
        $_SESSION['usuario'] = 'user';
        header("Location: peliculas.php");
        exit;
    } else {
        // Credenciales incorrectas
        echo "<p style='color:red; text-align:center;'>❌ Usuario o contraseña incorrectos.</p>";
        echo "<p style='text-align:center;'><a href='login.php'>Volver al login</a></p>";
    }
?>

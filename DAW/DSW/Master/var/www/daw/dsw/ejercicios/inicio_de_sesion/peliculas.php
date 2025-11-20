<?php
    session_start();

    // Verificar sesión
    if (!isset($_SESSION['usuario']) || $_SESSION['usuario'] !== 'user') {
        header("Location: login.php");
        exit;
    }
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sección de Películas</title>
        <style>
            body { font-family: Arial, sans-serif; background: #fce4ec; margin: 50px; }
            .container { background: white; padding: 20px; border-radius: 8px; max-width: 500px; margin: auto; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
            a { display: inline-block; margin-top: 20px; color: #d81b60; text-decoration: none; }
            a:hover { text-decoration: underline; }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Bienvenido, <?= $_SESSION['usuario'] ?> 🎥</h2>
            <h3>Lista de películas</h3>
            <ul>
                <li>The Fast and the Furious (2001)</li>
                <li>2 Fast 2 Furious (2003)</li>
                <li>The Fast and the Furious: Tokyo Drift (2006)</li>
            </ul>
            <a href="logout.php">Cerrar sesión</a>
        </div>
    </body>
</html>

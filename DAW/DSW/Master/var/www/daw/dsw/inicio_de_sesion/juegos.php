<?php
    session_start();

    // Verificar sesión
    if (!isset($_SESSION['usuario']) || $_SESSION['usuario'] !== 'admin') {
        header("Location: login.php");
        exit;
    }
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sección de Juegos</title>
        <style>
            body { font-family: Arial, sans-serif; background: #e3f2fd; margin: 50px; }
            .container { background: white; padding: 20px; border-radius: 8px; max-width: 500px; margin: auto; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
            a { display: inline-block; margin-top: 20px; color: #0078D7; text-decoration: none; }
            a:hover { text-decoration: underline; }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Bienvenido, <?= $_SESSION['usuario'] ?> 👋</h2>
            <h3>Lista de juegos</h3>
            <ul>
                <li>Patapon 1</li>
                <li>Patapon 2</li>
                <li>Patapon 3</li>
            </ul>
            <a href="logout.php">Cerrar sesión</a>
        </div>
    </body>
</html>

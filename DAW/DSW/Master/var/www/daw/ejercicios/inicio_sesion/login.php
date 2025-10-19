<?php
    session_start();

    if (isset($_SESSION['usuario'])) {
        if ($_SESSION['usuario'] === 'admin') {
            header("Location: juegos.php");
            exit;
        } elseif ($_SESSION['usuario'] === 'user') {
            header("Location: peliculas.php");
            exit;
        }
    }
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Iniciar sesión</title>
        <style>
            body { font-family: Arial, sans-serif; background: #f4f4f4; margin: 50px; }
            form { background: white; padding: 20px; max-width: 400px; margin: auto; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
            input { display: block; width: 100%; padding: 8px; margin: 10px 0; box-sizing: border-box; }
            input[type="submit"] { background: #0078D7; color: white; border: none; cursor: pointer; }
            input[type="submit"]:hover { background: #005ea2; }
            h2 { text-align: center; }
        </style>
    </head>
    <body>
        <form action="chequea_login.php" method="post">
            <h2>Iniciar sesión</h2>
            <label>Usuario:</label>
            <input type="text" name="usuario" required>
    
            <label>Contraseña:</label>
            <input type="password" name="contrasena" required>
    
            <input type="submit" value="Acceder">
        </form>
    </body>
</html>

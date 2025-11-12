<?php
    include 'funciones.php';

    if (isset($_GET['error'])) {
        $error = "<p style='color:red;'>Usuario o contraseña incorrectos...</p>";
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Gestor de cuentas - Iniciar sesión</title>
    </head>
    <body>
        <h2>Iniciar sesión</h2>

        <p><?= $error ?></p>

        <form method="post" action="validar_login.php">
            Usuario: <input type="text" name="usuario" required />
            <br />
            <br />
            Contraseña: <input type="password" name="pass" required />
            <br />
            <br />
            <input type="submit" value="Entrar" />
        </form>

        <p>¿No tienes cuenta? <a href="registro.php">Regístrate aquí</a></p>
    </body>
</html>

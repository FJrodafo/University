<?php
    session_start();

    if (isset($_GET['error'])) {
        $error = "<p style='color:red;'>Usuario o contraseña incorrectos...</p>";
    }
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
    </head>
    <body>
        <h2>Login</h2>
        <p><?= $error ?></p>
        <form action="chequear_login.php" method="POST">
            <input type="text" name="usuario" placeholder="Usuario" required autofocus />
            <br />
            <br />
            <input type="password" name="contrasenia" placeholder="Contraseña" required />
            <br />
            <br />
            <input type="submit" value="Login" />
        </form>
    </body>
</html>

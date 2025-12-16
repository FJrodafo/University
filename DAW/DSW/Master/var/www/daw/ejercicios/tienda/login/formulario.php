<?php
    if (isset($_GET['error'])) {
        $error = "<p style='color:red;'>Datos incorrectos o error en la conexión: " . htmlspecialchars($_GET['error']) . "</p>";
    }

    // Mantener los valores introducidos previamente
    $host = $_GET['host'] ?? '';
    $port = $_GET['port'] ?? '';
    $dbname = $_GET['dbname'] ?? '';
    $user = $_GET['user'] ?? '';
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Conectar a PostgreSQL</title>
    </head>
    <body>
        <h2>Conectar a la base de datos PostgreSQL</h2>

        <?= $error ?>

        <form action="tienda.php" method="post">
            <label>Servidor:</label>
            <input type="text" name="host" value="<?= htmlspecialchars($host) ?>" required>
            <br>
            <br>
            <label>Puerto:</label>
            <input type="text" name="port" value="<?= htmlspecialchars($port) ?>" required>
            <br>
            <br>
            <label>Base de datos:</label>
            <input type="text" name="dbname" value="<?= htmlspecialchars($dbname) ?>" required>
            <br>
            <br>
            <label>Usuario:</label>
            <input type="text" name="user" value="<?= htmlspecialchars($user) ?>" required>
            <br>
            <br>
            <label>Contraseña:</label>
            <input type="password" name="password">
            <br>
            <br>
            <input type="submit" value="Conectar">
        </form>
    </body>
</html>

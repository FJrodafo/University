<?php
    session_start();

    if (!isset($_SESSION['usuario'])) {
        header("Location: login.php");
        exit;
    }

    $usuario = $_SESSION['usuario'];

    $fichero_frases = "frases_" . $usuario . ".txt";

    if (!file_exists($fichero_frases)) {
        file_put_contents($fichero_frases, "");
        $mensaje = "El fichero de frases no existía, pero ha sido creado exitosamente!";
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['nueva_frase'])) {
        $nueva_frase = trim($_POST['nueva_frase']);
        if ($nueva_frase !== '') {
            file_put_contents($fichero_frases, $nueva_frase . PHP_EOL, FILE_APPEND);
        }
    }

    $frases = file($fichero_frases, FILE_IGNORE_NEW_LINES);
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Frases de <?php echo htmlspecialchars($usuario); ?></title>
    </head>
    <body>
        <h2>Bienvenido <?php echo htmlspecialchars($usuario); ?></h2>
        <?php if (isset($mensaje)) echo "<p style='color:green;'>$mensaje</p>"; ?>
        <h3>Tus frases:</h3>
        <ul>
            <?php
            if (count($frases) > 0) {
                foreach ($frases as $f) {
                    echo "<li>" . htmlspecialchars($f) . "</li>";
                }
            } else {
                echo "<li>...</li>";
            }
            ?>
        </ul>
        <form method="POST" action="frases.php">
            <label for="nueva_frase">Añadir nueva frase:</label>
            <input type="text" name="nueva_frase" required autofocus />
            <input type="submit" value="Añadir" />
        </form>
        <br />
        <form action="login.php" method="GET">
            <input type="submit" value="Logout" />
        </form>
    </body>
</html>

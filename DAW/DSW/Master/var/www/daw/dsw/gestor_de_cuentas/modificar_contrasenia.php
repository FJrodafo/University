<?php
    include 'funciones.php';

    if (!isset($_SESSION['usuario'])) {
        header('Location: index.php');
        exit;
    }

    $usuario = $_SESSION['usuario'];
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Gestor de cuentas</title>
    </head>
    <body>
        <h2>Bienvenido, <?php echo $usuario; ?></h2>

        <?php
        if (isset($_GET['msg'])) {
            switch ($_GET['msg']) {
                case 'exito':
                    echo "<p style='color:green;'>Contraseña actualizada correctamente.</p>";
                    break;
                case 'error_confirmacion':
                    echo "<p style='color:red;'>Las contraseñas no coinciden. Intenta de nuevo.</p>";
                    break;
            }
        }
        ?>

        <form method="post" action="actualizar.php">
            Nueva contraseña: <input type="password" name="nueva" required />
            <br />
            <br />
            Confirmar contraseña: <input type="password" name="confirmar" required />
            <br />
            <br />
            <input type="submit" value="Actualizar contraseña" />
        </form>

        <p><a href="cerrar_sesion.php">Cerrar sesión</a></p>
    </body>
</html>

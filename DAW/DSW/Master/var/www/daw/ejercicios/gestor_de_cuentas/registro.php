<?php
    include 'funciones.php';

    if (isset($_GET['msg'])) {
        switch ($_GET['msg']) {
            case 'error_longitud':
                $msg = "<p style='color:red;'>El nombre de usuario debe tener al menos 4 caracteres.</p>";
                break;
            case 'error_caracteres':
                $msg = "<p style='color:red;'>El nombre de usuario debe contener solo letras y números y al menos una letra.</p>";
                break;
            case 'error_confirmacion':
                $msg = "<p style='color:red;'>Las contraseñas no coinciden.</p>";
                break;
            case 'existe':
                $msg = "<p style='color:red;'>El usuario ya existe.</p>";
                break;
            case 'exito':
                $msg = "<p style='color:green;'>Usuario registrado correctamente.</p>";
                break;
        }
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Registro de usuario</title>
    </head>
    <body>
        <h2>Registro de nuevo usuario</h2>

        <p><?= $msg ?></p>

        <form method="post" action="">
            Usuario: <input type="text" name="usuario" required />
            <br />
            <br />
            Contraseña: <input type="password" name="pass" required />
            <br />
            <br />
            Confirmar contraseña: <input type="password" name="confirmar" required />
            <br />
            <br />
            <input type="submit" name="registrar" value="Registrar" />
        </form>

        <p><a href="index.php">Volver al inicio</a></p>

        <?php
            if (isset($_POST['registrar'])) {
                $usuario = $_POST['usuario'];
                $pass = $_POST['pass'];
                $confirmar = $_POST['confirmar'];
                $datos = cargar_datos();

                if (strlen($usuario) < 4) {
                    header("Location: registro.php?msg=error_longitud");
                    exit;
                }

                if (!preg_match('/^(?=.*[a-zA-Z])[a-zA-Z0-9]+$/', $usuario)) {
                    header("Location: registro.php?msg=error_caracteres");
                    exit;
                }

                if (isset($datos[$usuario])) {
                    header("Location: registro.php?msg=existe");
                    exit;
                }

                if (!validar_contrasenias($pass, $confirmar)) {
                    header("Location: registro.php?msg=error_confirmacion");
                    exit;
                }

                guardar_usuario($usuario, $pass);
                header("Location: registro.php?msg=exito");
                exit;
            }
        ?>
    </body>
</html>

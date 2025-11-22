<?php
    session_start();

    /**
     * Carga los datos de acceso desde "datos_de_acceso.txt".
     */
    function cargar_datos() {
        $datos = [];
        $archivo = 'datos_de_acceso.txt';

        if (file_exists($archivo)) {
            $lineas = file($archivo, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
            foreach ($lineas as $linea) {
                $partes = explode(':', $linea);
                if (count($partes) === 2) {
                    $usuario = $partes[0];
                    $pass = $partes[1];
                    $datos[(string)$usuario] = $pass;
                }
            }
        } else {
            file_put_contents($archivo, "");
        }

        return $datos;
    }

    /**
     * Guarda un nuevo usuario en el archivo.
     */
    function guardar_usuario($usuario, $pass) {
        $linea = "$usuario:$pass\n";
        file_put_contents('datos_de_acceso.txt', $linea, FILE_APPEND);
    }

    /**
     * Valida usuario y contraseña.
     */
    function valida_usuario($usuario, $pass, $datos) {
        return isset($datos[(string)$usuario]) && $datos[(string)$usuario] === $pass;
    }

    /**
     * Comprueba si dos contraseñas coinciden.
     */
    function validar_contrasenias($pass1, $pass2) {
        return $pass1 === $pass2;
    }

    /**
     * Actualiza la contraseña de un usuario.
     */
    function actualizar_contrasenia($usuario, $nueva_pass, &$datos) {
        $datos[(string)$usuario] = $nueva_pass;

        $contenido = "";
        foreach ($datos as $user => $pass) {
            $contenido .= "$user:$pass\n";
        }
        file_put_contents('datos_de_acceso.txt', $contenido);
    }
?>

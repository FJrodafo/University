<?php
    // Cargar configuración
    $env = parse_ini_file(__DIR__ . '/../../../private/.env');

    // Datos de conexión tomados desde .env
    $host = $env['DB_HOST'];
    $port = $env['DB_PORT'];
    $dbname = $env['DB_NAME'];
    $user = $env['DB_USER'];
    $password = $env['DB_PASSWORD'];

    // Cadena de conexión PDO
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname";

    try {
        // Crear conexión
        $pdo = new PDO($dsn, $user, $password, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION // Mostrar errores
        ]);

        echo "<h2>Conexión establecida correctamente</h2>";

        // Consulta SQL
        $sql = "SELECT id, nombre, precio, id_fabricante FROM Productos";
        $stmt = $pdo->query($sql);

        echo "<h3>Lista de productos:</h3>";
        echo "<table border='1' cellpadding='8' cellspacing='0'>";
        echo "<tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>ID Fabricante</th>
              </tr>";

        // Recorrer filas
        foreach ($stmt as $fila) {
            echo "<tr>";
            echo "<td>{$fila['id']}</td>";
            echo "<td>{$fila['nombre']}</td>";
            echo "<td>{$fila['precio']}</td>";
            echo "<td>{$fila['id_fabricante']}</td>";
            echo "</tr>";
        }

        echo "</table>";
    } catch (PDOException $e) {
        echo "<strong>Error de conexión: </strong>" . $e->getMessage();
    }
?>

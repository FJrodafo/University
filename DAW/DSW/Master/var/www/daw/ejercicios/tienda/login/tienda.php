<?php
    // Capturar datos enviados por POST
    $host = $_POST['host'] ?? '';
    $port = $_POST['port'] ?? '';
    $dbname = $_POST['dbname'] ?? '';
    $user = $_POST['user'] ?? '';
    $password = $_POST['password'] ?? '';

    if (empty($host) || empty($port) || empty($dbname) || empty($user)) {
        header("Location: formulario.php?error=1&host=$host&port=$port&dbname=$dbname&user=$user");
        exit;
    }

    // Construir DSN
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname";

    try {
        $pdo = new PDO($dsn, $user, $password, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        ]);

        echo "<h2>Conexión establecida correctamente</h2>";

        // Consulta SQL
        $sql = "SELECT * FROM Productos";
        $stmt = $pdo->query($sql);
        $productos = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo "<h3>Lista de productos:</h3>";

        $numFilas = count($productos);
        echo "<p>La tabla productos contiene $numFilas filas.</p>";

        if ($numFilas > 0) {
            echo "<table border='1' cellpadding='8' cellspacing='0'>";
            echo "<tr>";
            foreach (array_keys($productos[0]) as $columna) {
                echo "<th>" . htmlspecialchars($columna) . "</th>";
            }
            echo "</tr>";

            foreach ($productos as $fila) {
                echo "<tr>";
                foreach ($fila as $valor) {
                    echo "<td>" . htmlspecialchars($valor) . "</td>";
                }
                echo "</tr>";
            }

            echo "</table>";
        } else {
            echo "<p>No hay productos en la tabla.</p>";
        }

        echo '<br><form action="formulario.php" method="get" style="display:inline;">';
        echo '<input type="hidden" name="host" value="' . htmlspecialchars($host) . '">';
        echo '<input type="hidden" name="port" value="' . htmlspecialchars($port) . '">';
        echo '<input type="hidden" name="dbname" value="' . htmlspecialchars($dbname) . '">';
        echo '<input type="hidden" name="user" value="' . htmlspecialchars($user) . '">';
        echo '<button type="submit">Desconectar</button>';
        echo '</form>';
    } catch (PDOException $e) {
        // Redirigir al formulario con mensaje de error y conservar los valores
        $errorMsg = urlencode($e->getMessage());
        header("Location: formulario.php?error=$errorMsg&host=$host&port=$port&dbname=$dbname&user=$user");
        exit;
    }
?>

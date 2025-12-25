<?php
    header("Content-Type: application/json; charset=UTF-8");
    // Permitir pruebas con Postman desde otros orígenes
    header("Access-Control-Allow-Origin: *");

    // Comprobar método GET
    if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
        http_response_code(405);
        echo json_encode(["error" => "Método no permitido."]);
        exit;
    }

    // Cargar configuración
    $config = require __DIR__ . "/../../../../../private/config.php";

    // Datos de conexión tomados desde config.php
    $host = $config['host'];
    $port = $config['port'];
    $dbname = $config['dbname'];
    $user = $config['user'];
    $password = $config['password'];

    // Cadena de conexión PDO
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname";

    try {
        // Crear conexión
        $pdo = new PDO($dsn, $user, $password, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION // Mostrar errores
        ]);
    } catch (PDOException $e) {
        echo json_encode([
            "error" => "Error de conexión",
            "detalle" => $e->getMessage()
        ]);
        exit;
    }

    // Lógica de API REST - GET
    if (isset($_GET['id'])) {
        // Consulta por ID
        $sql = "SELECT * FROM Productos WHERE id = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['id' => $_GET['id']]);
        $producto = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($producto) {
            echo json_encode($producto, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
        } else {
            echo json_encode(["error" => "Producto no encontrado"]);
        }
    } else {
        // Devolver todos los productos
        $sql = "SELECT * FROM Productos";
        $stmt = $pdo->query($sql);
        $productos = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode($productos, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
    }
?>

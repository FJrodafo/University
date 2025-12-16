<?php
    header("Content-Type: application/json; charset=UTF-8");
    // Permitir pruebas con Postman desde otros orígenes
    header("Access-Control-Allow-Origin: *");

    // Token para autorizar POST
    define('API_TOKEN', '123456TOKENSEGURO');

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

    // Lógica de API REST
    // Verificar token
    $headers = getallheaders();
    $auth = $headers['Authorization'] ?? '';

    if ($auth !== 'Bearer ' . API_TOKEN) {
        http_response_code(401);
        echo json_encode(["error" => "No autorizado."]);
        exit;
    }

    // Tomar ID desde query string
    if (!isset($_GET['id'])) {
        echo json_encode(["error" => "Falta el ID del producto a eliminar."]);
        exit;
    }

    $id = $_GET['id'];
    $sql = "DELETE FROM Productos WHERE id = :id";

    try {
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['id' => $id]);

        if ($stmt->rowCount() > 0) {
            echo json_encode(["mensaje" => "Producto eliminado correctamente."]);
        } else {
            echo json_encode(["error" => "Producto no encontrado."]);
        }
    } catch (PDOException $e) {
        echo json_encode([
            "error" => "Error al eliminar el producto.",
            "detalle" => $e->getMessage()
        ]);
    }
?>

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

    // Obtener datos JSON
    $data = json_decode(file_get_contents("php://input"), true);

    if (
        empty($data['id']) ||
        empty($data['nombre']) ||
        empty($data['precio']) ||
        empty($data['id_fabricante'])
    ) {
        echo json_encode(["error" => "Datos incompletos."]);
        exit;
    }

    // Insertar producto
    $sql = "INSERT INTO Productos (id, nombre, precio, id_fabricante) VALUES (:id, :nombre, :precio, :id_fabricante)";

    try {
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'id' => $data['id'],
            'nombre' => $data['nombre'],
            'precio' => $data['precio'],
            'id_fabricante' => $data['id_fabricante']
        ]);

        echo json_encode(["mensaje" => "Producto insertado correctamente."]);
    } catch (PDOException $e) {
        echo json_encode([
            "error" => "Error al insertar el producto.",
            "detalle" => $e->getMessage()
        ]);
    }
?>

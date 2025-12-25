<?php
    header("Content-Type: application/json; charset=UTF-8");
    // Permitir pruebas con Postman desde otros orígenes
    header("Access-Control-Allow-Origin: *");

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

    $sql = "
        UPDATE Productos
        SET nombre = :nombre,
            precio = :precio,
            id_fabricante = :id_fabricante
        WHERE id = :id
    ";

    try {
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'id' => $data['id'],
            'nombre' => $data['nombre'],
            'precio' => $data['precio'],
            'id_fabricante' => $data['id_fabricante']
        ]);

        if ($stmt->rowCount() > 0) {
            echo json_encode(["mensaje" => "Producto actualizado correctamente."]);
        } else {
            echo json_encode(["error" => "Producto no encontrado o sin cambios."]);
        }
    } catch (PDOException $e) {
        echo json_encode([
            "error" => "Error al actualizar el producto.",
            "detalle" => $e->getMessage()
        ]);
    }
?>

<?php
    header("Content-Type: application/json; charset=UTF-8");
    // Permitir pruebas con Postman desde otros orígenes
    header("Access-Control-Allow-Origin: *");

    // Token para autorizar PATCH
    define('API_TOKEN', '123456TOKENSEGURO');

    // Comprobar método PATCH
    if ($_SERVER['REQUEST_METHOD'] !== 'PATCH') {
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

    // Lógica de API REST - PATCH
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

    if ($data === null) {
        echo json_encode(["error" => "JSON inválido."]);
        exit;
    }

    // El ID es obligatorio
    if (empty($data['id'])) {
        echo json_encode(["error" => "Falta el ID del producto."]);
        exit;
    }

    $id = $data['id'];
    // Campos permitidos para actualizar
    $camposPermitidos = ['nombre', 'precio', 'id_fabricante'];
    $campos = [];
    $parametros = ['id' => $id];

    foreach ($camposPermitidos as $campo) {
        if (isset($data[$campo])) {
            $campos[] = "$campo = :$campo";
            $parametros[$campo] = $data[$campo];
        }
    }

    // Debe haber al menos un campo a actualizar
    if (empty($campos)) {
        echo json_encode(["error" => "No se han enviado campos para actualizar."]);
        exit;
    }

    $sql = "UPDATE Productos SET " . implode(', ', $campos) . " WHERE id = :id";

    try {
        $stmt = $pdo->prepare($sql);
        $stmt->execute($parametros);

        if ($stmt->rowCount() > 0) {
            echo json_encode(["mensaje" => "Producto actualizado parcialmente."]);
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

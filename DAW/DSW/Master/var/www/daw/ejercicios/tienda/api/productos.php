<?php
    header("Content-Type: application/json; charset=UTF-8");
    // Permitir pruebas con Postman desde otros orígenes
    header("Access-Control-Allow-Origin: *");

    // Token para autorizar POST
    define('API_TOKEN', '123456TOKENSEGURO');

    // Cargar configuración
    $env = parse_ini_file(__DIR__ . '/../../../../private/.env');

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
    } catch (PDOException $e) {
        echo json_encode([
            "error" => "Error de conexión.",
            "detalle" => $e->getMessage()
        ]);
        exit;
    }

    function checkToken() {
        $headers = getallheaders();
        $auth = $headers['Authorization'] ?? '';
    
        if ($auth !== 'Bearer ' . API_TOKEN) {
            http_response_code(401);
            echo json_encode(["error" => "No autorizado."]);
            exit;
        }
    }

    // Método HTTP
    $method = $_SERVER['REQUEST_METHOD'];

    // Peticiones GET
    if ($method === 'GET') {
        // Lógica de API REST
        if (isset($_GET['id'])) {
            // Consulta por ID
            $sql = "SELECT * FROM Productos WHERE id = :id";
            $stmt = $pdo->prepare($sql);
            $stmt->execute(['id' => $_GET['id']]);
            $producto = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($producto) {
                echo json_encode($producto, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
            } else {
                echo json_encode(["error" => "Producto no encontrado."]);
            }
        } else {
            // Devolver todos los productos
            $sql = "SELECT * FROM Productos";
            $stmt = $pdo->query($sql);
            $productos = $stmt->fetchAll(PDO::FETCH_ASSOC);

            echo json_encode($productos, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
        }

        exit;
    }

    // Peticiones POST
    if ($method === 'POST') {
        // Verificar token
        checkToken();

        // Obtener datos JSON
        $data = json_decode(file_get_contents("php://input"), true);

        if ($data === null) {
            echo json_encode(["error" => "JSON inválido."]);
            exit;
        }

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

        exit;
    }

    // Peticiones PUT
    if ($method === 'PUT') {
        // Verificar token
        checkToken();

        // Obtener datos JSON
        $data = json_decode(file_get_contents("php://input"), true);

        if ($data === null) {
            echo json_encode(["error" => "JSON inválido."]);
            exit;
        }

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

        exit;
    }

    // Peticiones PATCH
    if ($method === 'PATCH') {
        // Verificar token
        checkToken();

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

        exit;
    }

    // Peticiones DELETE
    if ($method === 'DELETE') {
        // Verificar token
        checkToken();

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

        exit;
    }

    // Método no permitido
    http_response_code(405);
    echo json_encode(["error" => "Método no permitido."]);
?>

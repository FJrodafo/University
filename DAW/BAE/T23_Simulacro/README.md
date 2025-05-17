## Simulacro: Índices, Vistas, Funciones y Procedimientos en MySQL

La empresa "TecnoMarket" quiere analizar las ventas realizadas por sus clientes. Para ello, necesita organizar la información en su base de datos y optimizar el rendimiento de las consultas.

1. Crear las tablas necesarias.
2. Insertar índices que mejoren las búsquedas más frecuentes.
3. Crear una vista que resuma las ventas.
4. Definir una función para calcular totales.
5. Crear un procedimiento que devuelva el resumen de ventas de un cliente específico.
6. Ejecutar el procedimiento para validar el resultado.

```sql
--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    ciudad VARCHAR(50)
);

CREATE TABLE Productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2)
);

CREATE TABLE Ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    fecha DATE,
    cantidad INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Clientes (id, nombre, apellido, ciudad) VALUES
    (1, 'Ana', 'Pérez', 'La Orotava'),
    (2, 'Luis', 'Gómez', 'Puerto de la Cruz'),
    (3, 'Carla', 'Ruiz', 'Los Realejos');

INSERT INTO Productos (id, nombre, precio) VALUES
    (1, 'Laptop', 1200.00),
    (2, 'Teclado', 50.00),
    (3, 'Monitor', 300.00);

INSERT INTO Ventas (id, id_cliente, id_producto, fecha, cantidad) VALUES
    (1, 1, 1, '2024-05-01', 1),
    (2, 1, 2, '2024-05-12', 2),
    (3, 2, 3, '2024-05-13', 1),
    (4, 3, 2, '2024-05-14', 1);
```

1. Crea los siguientes índices, muestra su rendimiento y explica si son óptimos y por qué:

    1. **idx_ciudad** sobre la tabla "Clientes" y el campo "ciudad":

        ```sql
        CREATE INDEX idx_ciudad ON Clientes(ciudad);
        ```

        Este índice mejora el rendimiento en consultas que filtran por ciudad:

        ```sql
        SELECT * FROM Clientes WHERE ciudad = 'La Orotava';
        ```
    2. **idx_fecha** sobre la tabla "Ventas" y el campo "fecha":

        ```sql
        CREATE INDEX idx_fecha ON Ventas(fecha);
        ```

        Útil en reportes por fecha o rangos de tiempo:

        ```sql
        SELECT * FROM Ventas WHERE fecha BETWEEN '2024-05-01' AND '2024-05-31';
        ```
    Ambos índices son óptimos si las columnas son frecuentemente usadas en cláusulas `WHERE`, `ORDER BY` o `JOIN`.
2. Obtén, a través de una vista, la siguiente información detallada de cada venta:

    1. ID de la venta.
    2. Nombre completo del cliente.
    3. Nombre del producto comprado.
    4. Fecha de la venta.
    5. Cantidad del producto comprado.
    6. Total (precio * cantidad).

    Resultado esperado de la vista que consolida los datos de las tablas "Ventas", "Clientes" y "Productos", permitiendo consultar fácilmente el historial de ventas detallado:

    | id_venta | nombre_completo_cliente | nombre_producto | fecha_venta | cantidad_venta | total_venta |
    | :------: | :---------------------- | :-------------- | :---------: | :------------: | :---------: |
    | 1        | Ana Pérez               | Laptop          | 2024-05-01  | 1              | 1200.00     |
    | 2        | Ana Pérez               | Teclado         | 2024-05-12  | 2              | 100.00      |
    | 3        | Luis Gómez              | Monitor         | 2024-05-13  | 1              | 300.00      |
    | 4        | Carla Ruiz              | Teclado         | 2024-05-14  | 1              | 50.00       |

    > [!NOTE]
    > 
    > Una vista es una **consulta sql** encapsulada en una tabla ficticia.

    ```sql
    CREATE VIEW vista_resumen_ventas AS
    SELECT 
        V.id AS id_venta,
        CONCAT(C.nombre, ' ', C.apellido) AS nombre_completo_cliente,
        P.nombre AS nombre_producto,
        V.fecha AS fecha_venta,
        V.cantidad AS cantidad_venta,
        P.precio * V.cantidad AS total_venta
    FROM Ventas V
    JOIN Clientes C ON V.id_cliente = C.id
    JOIN Productos P ON V.id_producto = P.id;
    ```
3. Crea una *función almacenada* en MySQL llamada "calcular_total" que reciba los siguientes parámetros:

    1. **precio**: un valor decimal con dos decimales que representa el precio del producto.
    2. **cantidad**: un número entero que representa las unidades compradas.

    La función debe devolver el resultado de multiplicar ambos valores, es decir, el **total a pagar** por esa línea de venta.

    ```sql
    DELIMITER //
    
    CREATE FUNCTION calcular_total(precio DECIMAL(10,2), cantidad INT)
    RETURNS DECIMAL(10,2)
    DETERMINISTIC
    BEGIN
        RETURN precio * cantidad;
    END //
    
    DELIMITER ;
    ```

    ```sql
    SELECT calcular_total(1200.00, 2);
    ```

    | calcular_total(1200.00, 2) |
    | :------------------------: |
    | 2400.00                    |
4. Crea un *procedimiento* llamado "resumen_cliente" que reciba como parámetro el ID de un cliente ("id_cliente"), y que devuelva el historial de ventas de dicho cliente.

    El procedimiento debe mostrar los siguientes datos por cada venta realizada por ese cliente:

    1. Nombre completo del cliente.
    2. Nombre del producto comprado.
    3. Fecha de la venta.
    4. Cantidad del producto comprado.
    5. Total (precio * cantidad).

    > [!TIP]
    > 
    > Puedes reutilizar una función existente como "calcular_total" o calcular el total directamente en la consulta.

    ```sql
    DELIMITER //
    
    CREATE PROCEDURE resumen_cliente(IN id_cliente INT)
    BEGIN
        SELECT 
            CONCAT(C.nombre, ' ', C.apellido) AS nombre_completo_cliente,
            P.nombre AS nombre_producto,
            V.fecha AS fecha_venta,
            V.cantidad AS cantidad_venta,
            calcular_total(P.precio, V.cantidad) AS total_venta
        FROM Ventas V
        JOIN Clientes C ON V.id_cliente = C.id
        JOIN Productos P ON V.id_producto = P.id
        WHERE C.id = id_cliente;
    END //
    
    DELIMITER ;
    ```

    ```sql
    CALL resumen_cliente(1);
    ```

    | nombre_completo_cliente | nombre_producto | fecha_venta | cantidad_venta | total_venta |
    | :---------------------- | :-------------- | :---------: | :------------: | :---------: |
    | Ana Pérez               | Laptop          | 2024-05-01  | 1              | 1200.00     |
    | Ana Pérez               | Teclado         | 2024-05-12  | 2              | 100.00      |
5. Preguntas teóricas:

    1. ¿Qué ventajas ofrece el uso de una vista en lugar de una consulta con múltiples `JOIN`?

        ```txt
        Reutilización de lógica SQL compleja, simplificación de consultas frecuentes y mejora de seguridad al ocultar tablas reales.
        ```
    2. ¿Por qué es importante declarar una función como `DETERMINISTIC`?

        ```txt
        Indica que la función devuelve siempre el mismo resultado para los mismos parámetros. Esto ayuda al optimizador de MySQL a mejorar el rendimiento y permite el uso en índices o vistas.
        ```
    3. ¿Cuál es la diferencia entre una función y un procedimiento?

        ```txt
        Una función devuelve un valor y se usa en consultas, mientras que un procedimiento ejecuta acciones, puede retornar múltiples resultados y no siempre retorna un valor.
        ```
    4. ¿Qué impacto tienen los índices sobre el rendimiento de una base de datos?

        ```txt
        Aceleran búsquedas y filtrados pero pueden ralentizar inserciones y actualizaciones.
        ```
    5. ¿Cuándo se recomienda usar un trigger en lugar de un procedimiento?

        ```txt
        Cuando se requiere lógica automática tras una operación (INSERT, UPDATE, DELETE). Es útil para auditorías, validaciones y actualizaciones encadenadas.
        ```
6. Preguntas prácticas:

    1. Modifica el procedimiento para filtrar también por un rango de fechas:

        ```sql
        DELIMITER //
        
        CREATE PROCEDURE resumen_cliente_fecha(
            IN id_cliente INT,
            IN fecha_inicio DATE,
            IN fecha_fin DATE
        )
        BEGIN
            SELECT 
                CONCAT(C.nombre, ' ', C.apellido) AS nombre_completo_cliente,
                P.nombre AS nombre_producto,
                V.fecha AS fecha_venta,
                V.cantidad AS cantidad_venta,
                calcular_total(P.precio, V.cantidad) AS total_venta
            FROM Ventas V
            JOIN Clientes C ON V.id_cliente = C.id
            JOIN Productos P ON V.id_producto = P.id
            WHERE C.id = id_cliente
              AND V.fecha BETWEEN fecha_inicio AND fecha_fin;
        END //
        
        DELIMITER ;
        ```
    2. Crea un índice sobre la columna "id_producto" en la tabla "Ventas":

        ```sql
        CREATE INDEX idx_id_producto ON Ventas(id_producto);
        ```
    3. ¿Qué ocurre si insertas una venta con un "id_cliente" inexistente?

        ```txt
        Ocurrirá un error por violar la restricción FOREIGN KEY
        
        ERROR 1452: Cannot add or update a child row: a foreign key constraint fails
        ```
    4. Modifica la vista para incluir también el nombre de la ciudad del cliente:

        ```sql
        CREATE OR REPLACE VIEW vista_resumen_ventas AS
        SELECT 
            V.id AS id_venta,
            CONCAT(C.nombre, ' ', C.apellido) AS nombre_completo_cliente,
            C.ciudad AS ciudad_cliente,
            P.nombre AS nombre_producto,
            V.fecha AS fecha_venta,
            V.cantidad AS cantidad_venta,
            P.precio * V.cantidad AS total_venta
        FROM Ventas V
        JOIN Clientes C ON V.id_cliente = C.id
        JOIN Productos P ON V.id_producto = P.id;
        ```
    5. Agrega una validación en el procedimiento para evitar resultados si el cliente no existe:

        ```sql
        DELIMITER //
        
        CREATE PROCEDURE resumen_cliente_seguro(IN id_cliente INT)
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM Clientes WHERE id = id_cliente) THEN
                SELECT 'Cliente no existe' AS mensaje;
            ELSE
                SELECT 
                    CONCAT(C.nombre, ' ', C.apellido) AS nombre_completo_cliente,
                    P.nombre AS nombre_producto,
                    V.fecha AS fecha_venta,
                    V.cantidad AS cantidad_venta,
                    calcular_total(P.precio, V.cantidad) AS total_venta
                FROM Ventas V
                JOIN Clientes C ON V.id_cliente = C.id
                JOIN Productos P ON V.id_producto = P.id
                WHERE C.id = id_cliente;
            END IF;
        END //
        
        DELIMITER ;
        ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
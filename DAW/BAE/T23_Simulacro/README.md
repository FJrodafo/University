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

    1. **idx_ciudad** sobre la tabla "Clientes" y el campo "ciudad".

        ```
        
        ```
    2. **idx_fecha** sobre la tabla "Ventas" y el campo "fecha".

        ```
        
        ```
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
3. Crea una *función almacenada* en MySQL llamada "calcular_total" que reciba los siguientes parámetros:

    1. **precio**: un valor decimal con dos decimales que representa el precio del producto.
    2. **cantidad**: un número entero que representa las unidades compradas.

    La función debe devolver el resultado de multiplicar ambos valores, es decir, el **total a pagar** por esa línea de venta.

    ```sql
    SELECT calcular_total(1200.00, 2);
    ```

    | calcular_total(1200.00, 2) |
    | :------------------------: |
    | 2400.00                    |
4. Crea un *procedimiento* llamado "resumen_cliente" que reciba como parámetro el ID de un cliente ("cliente_id"), y que devuelva el historial de ventas de dicho cliente.

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
    CALL resumen_cliente(1);
    ```

    | nombre_completo_cliente | nombre_producto | fecha_venta | cantidad_venta | total_venta |
    | :---------------------- | :-------------- | :---------: | :------------: | :---------: |
    | Ana Pérez               | Laptop          | 2024-05-01  | 1              | 1200.00     |
    | Ana Pérez               | Teclado         | 2024-05-12  | 2              | 100.00      |
5. Preguntas teóricas:

    1. ¿Qué ventajas ofrece el uso de una vista en lugar de una consulta con múltiples `JOIN`?

        ```
        
        ```
    2. ¿Por qué es importante declarar una función como `DETERMINISTIC`?

        ```
        
        ```
    3. ¿Cuál es la diferencia entre una función y un procedimiento?

        ```
        
        ```
    4. ¿Qué impacto tienen los índices sobre el rendimiento de una base de datos?

        ```
        
        ```
    5. ¿Cuándo se recomienda usar un trigger en lugar de un procedimiento?

        ```
        
        ```
6. Preguntas prácticas:

    1. Modifica el procedimiento para filtrar también por un rango de fechas.

        ```
        
        ```
    2. Crea un índice sobre la columna `producto_id` en la tabla `ventas`.

        ```
        
        ```
    3. ¿Qué ocurre si insertas una venta con un `cliente_id` inexistente?

        ```
        
        ```
    4. Modifica la vista para incluir también el nombre de la ciudad del cliente.

        ```
        
        ```
    5. Agrega una validación en el procedimiento para evitar resultados si el cliente no existe.

        ```
        
        ```

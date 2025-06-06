## Supermercado

1. Creación de la Base de Datos.
    Crea con el siguente contenido el fichero `supermercado.sql`.

    ```sql
    --  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
    --  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
    --  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

    CREATE TABLE Categorias (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT UNIQUE
    );

    CREATE TABLE Productos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        id_categoria INTEGER,
        nombre TEXT,
        precio REAL,
        FOREIGN KEY (id_categoria) REFERENCES Categorias(id)
    );

    CREATE TABLE Pedidos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fecha DATE
    );

    CREATE TABLE Producto_Pedido (
        id_pedido INTEGER,
        id_producto INTEGER,
        cantidad INTEGER,
        PRIMARY KEY (id_pedido, id_producto),
        FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
        FOREIGN KEY (id_producto) REFERENCES Productos(id)
    );

    --  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
    --  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
    --  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

    INSERT INTO Categorias (nombre) VALUES 
        ('Alimentos'),
        ('Lácteos'),
        ('Panadería'),
        ('Frutas'),
        ('Carnes'),
        ('Verduras'),
        ('Desayuno'),
        ('Hogar'),
        ('Higiene'),
        ('Limpieza'),
        ('Snacks'),
        ('Cocina'),
        ('Bebidas'),
        ('Conservas');

    INSERT INTO Productos (nombre, id_categoria, precio) VALUES 
        ('Arroz', 1, 2.5),
        ('Leche', 2, 1.8),
        ('Pan', 3, 1.2),
        ('Manzanas', 4, 3.0),
        ('Pollo', 5, 5.5),
        ('Huevos', 2, 1.0),
        ('Yogurt', 2, 2.0),
        ('Tomates', 6, 2.2),
        ('Queso', 2, 4.0),
        ('Cereal', 7, 3.5),
        ('Papel Higiénico', 8, 1.5),
        ('Cepillo de Dientes', 9, 2.0),
        ('Detergente', 10, 2.8),
        ('Galletas', 11, 1.7),
        ('Aceite de Oliva', 12, 4.5),
        ('Café', 13, 5.0),
        ('Sopa enlatada', 14, 2.3),
        ('Jabón de Baño', 9, 1.2),
        ('Botellas de Agua', 13, 1.0),
        ('Cerveza', 13, 3.8);

    INSERT INTO Pedidos (fecha) VALUES 
        ('2024-01-17'),
        ('2024-01-18'),
        ('2024-01-19'),
        ('2024-01-20');

    INSERT INTO Producto_Pedido (id_pedido, id_producto, cantidad) VALUES 
        (1, 1, 5),
        (1, 2, 3),
        (1, 4, 2),
        (1, 5, 1),
        (2, 6, 10),
        (2, 8, 4),
        (2, 10, 2),
        (3, 14, 7),
        (3, 16, 3),
        (4, 18, 6);
    ```
2. Lectura del fichero SQL.
    * Realiza un `.read` del fichero sql, de nombre `supermercado.sql`, realiza la creación e inserción de información de la BBDD.

        ```shell
        sqlite3 supermercado.db
        ```

        ```sqlite3
        .read supermercado.sql
        ```
3. Realiza el diagrama MR/ER de la BBDD supermercado.
    <details>
    <summary>Diagrama</summary>
    <img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T12_Supermercado/Assets/Supermercado.drawio.svg">
    </details>
4. Indica si la BBDD esta normalizada hasta la 3ª forma normal, justificando la respuesta.

    ```
    Para que la base de datos esté completamente normalizada hasta la 3ª Forma Normal (3FN), es necesario eliminar la redundancia en la columna categoria de la tabla "Productos".
    Esto se logra creando una nueva tabla para las categorías y estableciendo una relación entre ambas tablas.
    ```
5. Realizar las siguientes consultas de datos:
    1. Mostrar todos los productos de la categoría "Bebidas".

        ```sql
        SELECT P.nombre FROM Productos P JOIN Categorias C ON P.id_categoria = C.id WHERE C.nombre = 'Bebidas';
        ```
    2. Listar los productos ordenados por precio de forma descendente.

        ```sql
        SELECT nombre, precio FROM Productos ORDER BY precio DESC;
        ```
    3. Calcular el precio total de todos los productos en la tabla "Productos".

        ```sql
        SELECT SUM(precio) AS precio_total FROM Productos;
        ```
    4. Encontrar los productos con un nombre que contenga la letra 'A' o 'a'.

        ```sql
        -- LIKE
        SELECT nombre FROM Productos WHERE nombre LIKE '%A%' OR nombre LIKE '%a%';
        ```

        ```sql
        -- REGEXP
        SELECT nombre FROM Productos WHERE nombre REGEXP '[Aa]';
        ```
    5. Obtener la cantidad total de productos vendidos en todas las fechas.

        ```sql
        SELECT SUM(cantidad) AS total_vendidos FROM Producto_Pedido;
        ```
    6. Encontrar el producto más caro en cada categoría.

        ```sql
        SELECT C.nombre AS categoria, P.nombre AS producto, MAX(P.precio) AS precio FROM Productos P JOIN Categorias C ON P.id_categoria = C.id GROUP BY C.id;
        ```
    7. Listar los productos que no han sido vendidos.

        ```sql
        SELECT P.nombre FROM Productos P LEFT JOIN Producto_Pedido PP ON P.id = PP.id_producto WHERE PP.id_producto IS NULL;
        ```
    8. Calcular el precio promedio de los productos en la categoría "Snacks".

        ```sql
        SELECT AVG(P.precio) AS precio_promedio FROM Productos P JOIN Categorias C ON P.id_categoria = C.id WHERE C.nombre = 'Snacks';
        ```
    9. Encontrar los productos que han sido vendidos más de 5 veces.

        ```sql
        SELECT P.nombre, SUM(PP.cantidad) AS total_vendidos FROM Productos P JOIN Producto_Pedido PP ON P.id = PP.id_producto GROUP BY P.id HAVING total_vendidos > 5;
        ```
    10. Mostrar la fecha y la cantidad de pedidos para cada producto.

        ```sql
        SELECT Pr.nombre, Pd.fecha, PP.cantidad FROM Productos Pr JOIN Producto_Pedido PP ON Pr.id = PP.id_producto JOIN Pedidos Pd ON PP.id_pedido = Pd.id ORDER BY Pd.fecha ASC;
        ```
    11. Encontrar los productos que tienen un precio menor o igual a 2.

        ```sql
        SELECT P.nombre, P.precio FROM Productos P WHERE P.precio <= 2;
        ```
    12. Calcular la cantidad total de pedidos para cada fecha.

        ```sql
        SELECT P.fecha, SUM(PP.cantidad) AS total_pedidos FROM Pedidos P JOIN Producto_Pedido PP ON PP.id_pedido = P.id GROUP BY P.fecha;
        ```
    13. Listar los productos cuyo nombre comienza con la letra 'P'.

        ```sql
        -- LIKE
        SELECT nombre FROM Productos WHERE nombre LIKE 'P%';
        ```

        ```sql
        -- REGEXP
        SELECT nombre FROM Productos WHERE nombre REGEXP '^P';
        ```
    14. Obtener el producto más vendido en términos de cantidad.

        ```sql
        SELECT P.nombre, SUM(PP.cantidad) AS total_vendidos FROM Productos P JOIN Producto_Pedido PP ON P.id = PP.id_producto GROUP BY P.id ORDER BY total_vendidos DESC LIMIT 1;
        ```
    15. Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.

        ```sql
        SELECT Pr.nombre, Pr.precio, Pd.fecha FROM Productos Pr JOIN Producto_Pedido PP ON Pr.id = PP.id_producto JOIN Pedidos Pd ON PP.id_pedido = Pd.id WHERE Pd.fecha = '2024-01-18';
        ```
    16. Calcular el total de pedidos para cada producto.

        ```sql
        SELECT P.nombre, SUM(PP.cantidad) AS total_pedidos FROM Productos P JOIN Producto_Pedido PP ON P.id = PP.id_producto GROUP BY P.id;
        ```
    17. Encontrar los productos con un precio entre 3 y 4.

        ```sql
        SELECT nombre, precio FROM Productos WHERE precio BETWEEN 3 AND 4;
        ```
    18. Listar los productos y sus categorías ordenados alfabéticamente por categoría.

        ```sql
        SELECT C.nombre AS categoria, P.nombre AS producto FROM Productos P JOIN Categorias C ON P.id_categoria = C.id ORDER BY C.nombre, P.nombre; 
        ```
    19. Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.

        ```sql
        SELECT Pr.nombre, SUM(Pr.precio * PP.cantidad) AS total_precio FROM Productos Pr JOIN Producto_Pedido PP ON Pr.id = PP.id_producto JOIN Pedidos Pd ON PP.id_pedido = Pd.id WHERE Pd.fecha = '2024-01-19' GROUP BY Pr.nombre;
        ```
    20. Mostrar los productos que no pertenecen a la categoría "Higiene".

        ```sql
        SELECT C.nombre AS categoria, P.nombre AS producto, P.precio FROM Productos P JOIN Categorias C ON P.id_categoria = C.id WHERE C.nombre != 'Higiene';
        ```
    21. Encontrar la cantidad total de productos en cada categoría.

        ```sql
        SELECT C.nombre AS categoria, COUNT(P.id) AS total_productos FROM Productos P JOIN Categorias C ON P.id_categoria = C.id GROUP BY C.id;
        ```
    22. Listar los productos que tienen un precio igual a la media de precios.

        ```sql
        SELECT nombre, precio FROM Productos WHERE precio = (SELECT AVG(precio) FROM Productos);
        ```
    23. Calcular el precio total de los productos vendidos en cada fecha.

        ```sql
        SELECT SUM(Pr.precio * PP.cantidad) AS total_precio, Pd.fecha FROM Productos Pr JOIN Producto_Pedido PP ON Pr.id = PP.id_producto JOIN Pedidos Pd ON PP.id_pedido = Pd.id GROUP BY Pd.fecha;
        ```
    24. Mostrar los productos con un nombre que termina con la letra 'o'.

        ```sql
        -- LIKE
        SELECT nombre FROM Productos WHERE nombre LIKE '%o';
        ```

        ```sql
        -- REGEXP
        SELECT nombre FROM Productos WHERE nombre REGEXP 'o$';
        ```
    25. Encontrar los productos que han sido vendidos en más de una fecha.

        ```sql
        SELECT Pr.nombre, Pd.fecha FROM Productos Pr JOIN Producto_Pedido PP ON Pr.id = PP.id_producto JOIN Pedidos Pd ON PP.id_pedido = Pd.id GROUP BY Pr.id HAVING COUNT(DISTINCT Pd.fecha) > 1;
        ```
    26. Listar los productos cuya categoría comienza con la letra 'L'.

        ```sql
        -- LIKE
        SELECT C.nombre AS categoria, P.nombre AS producto FROM Categorias C JOIN Productos P ON C.id = P.id_categoria WHERE C.nombre LIKE 'L%';
        ```

        ```sql
        -- REGEXP
        SELECT C.nombre AS categoria, P.nombre AS producto FROM Categorias C JOIN Productos P ON C.id = P.id_categoria WHERE C.nombre REGEXP '^L';
        ```
    27. Calcular el total de pedidos para cada producto en la fecha '2024-01-17'.

        ```sql
        SELECT Pr.nombre, SUM(PP.cantidad) AS total_pedidos, Pd.fecha FROM Productos Pr JOIN Producto_Pedido PP ON Pr.id = PP.id_producto JOIN Pedidos Pd ON PP.id_pedido = Pd.id WHERE Pd.fecha = '2024-01-17' GROUP BY Pr.id ORDER BY Pr.nombre ASC;
        ```
    28. Mostrar los productos cuyo nombre tiene al menos 7 caracteres.

        ```sql
        -- LENGTH
        SELECT nombre FROM Productos WHERE LENGTH(nombre) >= 7;
        ```

        ```sql
        -- REGEXP
        SELECT nombre FROM Productos WHERE nombre REGEXP '^.{7,}$';
        ```
    29. Encontrar los productos que tienen un precio superior al precio máximo en la tabla "Productos".

        ```sql
        -- Esto no es posible, ya que ningún producto puede tener un precio superior al máximo.
        SELECT nombre FROM Productos WHERE precio > (SELECT MAX(precio) FROM Productos);
        ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
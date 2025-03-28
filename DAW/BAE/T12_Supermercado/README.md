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

    ```txt
    Para que la base de datos esté completamente normalizada hasta la 3ª Forma Normal (3FN), es necesario eliminar la redundancia en la columna categoria de la tabla Productos. Esto se logra creando una nueva tabla para las categorías y estableciendo una relación entre ambas tablas.
    ```
5. Realizar las siguientes consultas de datos:
    1. Mostrar todos los productos de la categoría "Bebidas".

        ```sql
        
        ```
    2. Listar los productos ordenados por precio de forma descendente.

        ```sql
        
        ```
    3. Calcular el precio total de todos los productos en la tabla "Productos".

        ```sql
        
        ```
    4. Encontrar los productos con un nombre que contenga la letra 'a'.

        ```sql
        
        ```
    5. Obtener la cantidad total de productos vendidos en todas las fechas.

        ```sql
        
        ```
    6. Encontrar el producto más caro en cada categoría.

        ```sql
        
        ```
    7. Listar los productos que no han sido vendidos.

        ```sql
        
        ```
    8. Calcular el precio promedio de los productos en la categoría "Snacks".

        ```sql
        
        ```
    9. Encontrar los productos que han sido vendidos más de 5 veces.

        ```sql
        
        ```
    10. Mostrar la fecha y la cantidad de pedidos para cada producto.

        ```sql
        
        ```
    11. Encontrar los productos que tienen un precio menor o igual a 2.

        ```sql
        
        ```
    12. Calcular la cantidad total de pedidos para cada fecha.

        ```sql
        
        ```
    13. Listar los productos cuyo nombre comienza con la letra 'P'.

        ```sql
        
        ```
    14. Obtener el producto más vendido en términos de cantidad.

        ```sql
        
        ```
    15. Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.

        ```sql
        
        ```
    16. Calcular el total de pedidos para cada producto.

        ```sql
        
        ```
    17. Encontrar los productos con un precio entre 3 y 4.

        ```sql
        
        ```
    18. Listar los productos y sus categorías ordenados alfabéticamente por categoría.

        ```sql
        
        ```
    19. Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.

        ```sql
        
        ```
    20. Mostrar los productos que no pertenecen a la categoría "Higiene".

        ```sql
        
        ```
    21. Encontrar la cantidad total de productos en cada categoría.

        ```sql
        
        ```
    22. Listar los productos que tienen un precio igual a la media de precios.

        ```sql
        
        ```
    23. Calcular el precio total de los productos vendidos en cada fecha.

        ```sql
        
        ```
    24. Mostrar los productos con un nombre que termina con la letra 'o'.

        ```sql
        
        ```
    25. Encontrar los productos que han sido vendidos en más de una fecha.

        ```sql
        
        ```
    26. Listar los productos cuya categoría comienza con la letra 'L'.

        ```sql
        
        ```
    27. Calcular el total de pedidos para cada producto en la fecha '2024-01-17'.

        ```sql
        
        ```
    28. Mostrar los productos cuyo nombre tiene al menos 5 caracteres.

        ```sql
        
        ```
    29. Encontrar los productos que tienen un precio superior al precio máximo en la tabla "Productos".

        ```sql
        
        ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
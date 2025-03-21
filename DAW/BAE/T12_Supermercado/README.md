## Supermercado

1. Creación de la Base de Datos.
    Crea con el siguente contenido el fichero `supermercado.sql`.

    ```sql
    CREATE TABLE productos (
        id INTEGER PRIMARY KEY,
        nombre TEXT,
        categoria TEXT,
        precio REAL
    );

    CREATE TABLE ventas (
        id INTEGER PRIMARY KEY,
        id_producto INTEGER,
        cantidad INTEGER,
        fecha DATE,
        FOREIGN KEY (id_producto) REFERENCES productos(id)
    );

    INSERT INTO productos (id, nombre, categoria, precio) VALUES 
        (1, 'Arroz', 'Alimentos', 2.5),
        (2, 'Leche', 'Lácteos', 1.8),
        (3, 'Pan', 'Panadería', 1.2),
        (4, 'Manzanas', 'Frutas', 3.0),
        (5, 'Pollo', 'Carnes', 5.5),
        (6, 'Huevos', 'Lácteos', 1.0),
        (7, 'Yogurt', 'Lácteos', 2.0),
        (8, 'Tomates', 'Verduras', 2.2),
        (9, 'Queso', 'Lácteos', 4.0),
        (10, 'Cereal', 'Desayuno', 3.5),
        (11, 'Papel Higiénico', 'Hogar', 1.5),
        (12, 'Cepillo de Dientes', 'Higiene', 2.0),
        (13, 'Detergente', 'Limpieza', 2.8),
        (14, 'Galletas', 'Snacks', 1.7),
        (15, 'Aceite de Oliva', 'Cocina', 4.5),
        (16, 'Café', 'Bebidas', 5.0),
        (17, 'Sopa enlatada', 'Conservas', 2.3),
        (18, 'Jabón de Baño', 'Higiene', 1.2),
        (19, 'Botellas de Agua', 'Bebidas', 1.0),
        (20, 'Cerveza', 'Bebidas', 3.8);

    INSERT INTO ventas (id_producto, cantidad, fecha) VALUES 
        (1, 5, '2024-01-17'),
        (2, 3, '2024-01-17'),
        (4, 2, '2024-01-17'),
        (5, 1, '2024-01-17'),
        (6, 10, '2024-01-18'),
        (8, 4, '2024-01-18'),
        (10, 2, '2024-01-18'),
        (14, 7, '2024-01-19'),
        (16, 3, '2024-01-19'),
        (18, 6, '2024-01-20');
    ```
2. Lectura del fichero SQL.
    * Realiza un `.read` del fichero sql, de nombre `supermercado.sql`, realiza la creación e inserción de información de la BBDD.

        ```sql
        
        ```
3. Realiza el diagrama MR y ER de la BBDD supermercado.
    <details>
    <summary>Diagramas</summary>
    <img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T12_Supermercado/Diagram.drawio.svg">
    </details>
4. Indica si la BBDD esta normalizada hasta la 3ª forma normal, justificando la respuesta.
5. Realizar las siguientes consultas de datos:
    1. Mostrar todos los productos de la categoría "Bebidas".

        ```sql
        
        ```
    2. Listar los productos ordenados por precio de forma descendente.

        ```sql
        
        ```
    3. Calcular el precio total de todos los productos en la tabla "productos".

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
    10. Mostrar la fecha y la cantidad de ventas para cada producto.

        ```sql
        
        ```
    11. Encontrar los productos que tienen un precio menor o igual a 2.

        ```sql
        
        ```
    12. Calcular la cantidad total de ventas para cada fecha.

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
    16. Calcular el total de ventas para cada producto.

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
    27. Calcular el total de ventas para cada producto en la fecha '2024-01-17'.

        ```sql
        
        ```
    28. Mostrar los productos cuyo nombre tiene al menos 5 caracteres.

        ```sql
        
        ```
    29. Encontrar los productos que tienen un precio superior al precio máximo en la tabla "productos".

        ```sql
        
        ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
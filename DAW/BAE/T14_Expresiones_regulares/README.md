## Expresiones regulares

```sql
--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    email TEXT UNIQUE
);

CREATE TABLE Productos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    precio REAL
);

CREATE TABLE Pedidos (
    id_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Clientes (nombre, email) VALUES
    ('Juan Pérez', 'juan@example.com'),
    ('María Gómez', 'maria@example.com'),
    ('Carlos López', 'carlos@example.com'),
    ('Ana Rodríguez', 'ana@example.com'),
    ('Luisa Martínez', 'luisa@example.com'),
    ('Pedro Sánchez', 'pedro@example.com'),
    ('Laura García', 'laura@example.com'),
    ('Miguel Martín', 'miguel@example.com'),
    ('Elena González', 'elena@example.com'),
    ('David Torres', 'david@example.com'),
    ('Sofía Ruiz', 'sofia@example.com'),
    ('Javier López', 'javier@example.com'),
    ('Carmen Vargas', 'carmen@example.com'),
    ('Daniel Muñoz', 'daniel@example.com'),
    ('Isabel Serrano', 'isabel@example.com'),
    ('Alejandro Muñoz', 'alejandro@example.com'),
    ('Raquel Herrera', 'raquel@example.com'),
    ('Francisco Mora', 'francisco@example.com'),
    ('Marina Díaz', 'marina@example.com'),
    ('Antonio Jiménez', 'antonio@example.com'),
    ('Beatriz Romero', 'beatriz@example.com'),
    ('Carlos Gómez', 'carlos.gomez@example.com'),
    ('Clara Sánchez', 'clara.sanchez@example.com'),
    ('Andrés Martínez', 'andres@example.com'),
    ('Lucía Díaz', 'lucia@example.com'),
    ('Mario Serrano', 'mario@example.com'),
    ('Eva Torres', 'eva.torres@example.com'),
    ('Roberto Ruiz', 'roberto@example.com'),
    ('Celia García', 'celia@example.com');

INSERT INTO Productos (nombre, precio) VALUES
    ('Laptop', 1200.00),
    ('Smartphone', 699.99),
    ('TV LED', 799.50),
    ('Tablet', 299.99),
    ('Auriculares Bluetooth', 79.99),
    ('Impresora', 199.99),
    ('Cámara Digital', 499.99),
    ('Reproductor de Audio', 149.99),
    ('Altavoces Inalámbricos', 129.99),
    ('Reloj Inteligente', 249.99),
    ('Teclado Inalámbrico', 59.99),
    ('Ratón Óptico', 29.99),
    ('Monitor LED', 349.99),
    ('Mochila para Portátil', 49.99),
    ('Disco Duro Externo', 89.99),
    ('Router Wi-Fi', 69.99),
    ('Lámpara LED', 39.99),
    ('Batería Externa', 19.99),
    ('Estuche para Auriculares', 14.99),
    ('Tarjeta de Memoria', 24.99),
    ('Cargador Inalámbrico', 34.99),
    ('Kit de Limpieza para Computadoras', 9.99),
    ('Funda para Tablet', 19.99),
    ('Soporte para Teléfono', 14.99),
    ('Hub USB', 29.99),
    ('Webcam HD', 59.99),
    ('Funda para Laptop', 29.99),
    ('Adaptador HDMI', 12.99);

INSERT INTO Pedidos (id_cliente, id_producto, cantidad, fecha_pedido) VALUES
    (1, 1, 2, '2024-02-01'),
    (2, 2, 1, '2024-02-02'),
    (3, 3, 3, '2024-02-03'),
    (4, 4, 1, '2024-02-04'),
    (5, 5, 2, '2024-02-05'),
    (6, 6, 1, '2024-02-06'),
    (7, 7, 3, '2024-02-07'),
    (8, 8, 2, '2024-02-08'),
    (9, 9, 1, '2024-02-09'),
    (10, 10, 2, '2024-02-10'),
    (11, 11, 1, '2024-02-11'),
    (12, 12, 3, '2024-02-12'),
    (13, 13, 1, '2024-02-13'),
    (14, 14, 2, '2024-02-14'),
    (15, 15, 1, '2024-02-15'),
    (16, 16, 3, '2024-02-16'),
    (17, 17, 2, '2024-02-17'),
    (18, 18, 1, '2024-02-18'),
    (19, 19, 2, '2024-02-19'),
    (20, 20, 1, '2024-02-20'),
    (21, 21, 3, '2024-02-21'),
    (22, 22, 1, '2024-02-22'),
    (23, 23, 2, '2024-02-23'),
    (24, 24, 1, '2024-02-24'),
    (25, 25, 3, '2024-02-25'),
    (26, 26, 2, '2024-02-26'),
    (27, 27, 1, '2024-02-27'),
    (28, 28, 2, '2024-02-28'),
    (29, 29, 1, '2024-02-29'),
    (30, 30, 3, '2024-03-01');
```

1. Obtener todos los clientes.

    ```sql
    SELECT * FROM Clientes;
    ```
2. Obtener la cantidad total de productos en todos los pedidos.

    ```sql
    SELECT SUM(cantidad) AS total FROM Pedidos;
    ```
3. Obtener el precio promedio de los productos.

    ```sql
    SELECT AVG(precio) AS promedio FROM Productos;
    ```
4. Obtener los clientes que tienen un email válido (contiene "@").

    ```sql
    SELECT * FROM Clientes WHERE email REGEXP '^.*@.*\.com$';
    ```
5. Obtener el producto más caro.

    ```sql
    SELECT * FROM Productos ORDER BY precio DESC LIMIT 1;
    ```
6. Obtener los pedidos realizados en febrero de 2024.

    ```sql
    SELECT * FROM Pedidos WHERE fecha_pedido BETWEEN '2024-02-01' AND '2024-02-29';
    ```
7. Obtener la cantidad total de productos en todos los pedidos por producto.

    ```sql
    SELECT id_producto, SUM(cantidad) AS total FROM Pedidos GROUP BY id_producto;
    ```
8. Obtener los clientes que han realizado más de un pedido.

    ```sql
    SELECT id_cliente, COUNT(*) AS total FROM Pedidos GROUP BY id_producto HAVING total > 1;
    ```
9. Obtener los productos que tienen un precio registrado.

    ```sql
    SELECT * FROM Productos WHERE precio IS NOT NULL;
    ```
10. Obtener la fecha del primer pedido realizado.

    ```sql
    SELECT MIN(fecha_pedido) AS primer_pedido FROM Pedidos;
    ```
11. Obtener los productos cuyos nombres comienzan con "A" o "B".

    ```sql
    SELECT * FROM Productos WHERE nombre LIKE 'A%' OR nombre LIKE 'B%';
    ```

    ```sql
    SELECT * FROM Productos WHERE nombre REGEXP '^[AB]';
    ```
12. Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.

    ```sql
    SELECT id_cliente, SUM(cantidad) AS total_productos 
    FROM Pedidos 
    GROUP BY id_cliente 
    ORDER BY id_cliente;
    ```
13. Obtener los clientes que han realizado más de un pedido en febrero de 2024.

    ```sql
    SELECT id_cliente, COUNT(*) AS total_pedidos 
    FROM Pedidos 
    WHERE fecha_pedido BETWEEN '2024-02-01' AND '2024-02-29' 
    GROUP BY id_cliente 
    HAVING total_pedidos > 1;
    ```
14. Obtener los productos con precio entre 100 y 500.

    ```sql
    SELECT * FROM Productos WHERE precio BETWEEN 100 AND 500;
    ```
15. Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cantidad descendente.

    ```sql
    SELECT id_cliente, SUM(cantidad) AS total_productos 
    FROM Pedidos 
    GROUP BY id_cliente 
    ORDER BY total_productos DESC;
    ```
16. Obtener los clientes que tienen una "a" en cualquier posición de su nombre.

    ```sql
    SELECT * FROM Clientes WHERE nombre LIKE '%a%';
    ```

    ```sql
    SELECT * FROM Clientes WHERE nombre REGEXP 'a';
    ```
17. Obtener el precio máximo de los productos.

    ```sql
    SELECT MAX(precio) AS precio_maximo FROM Productos;
    ```
18. Obtener los pedidos realizados por el cliente con ID 1 en febrero de 2024.

    ```sql
    SELECT * FROM Pedidos WHERE id_cliente = 1 AND fecha_pedido BETWEEN '2024-02-01' AND '2024-02-29';
    ```
19. Obtener la cantidad total de productos en todos los pedidos por producto ordenado por total de productos descendente.

    ```sql
    SELECT id_producto, SUM(cantidad) AS total_productos 
    FROM Pedidos 
    GROUP BY id_producto 
    ORDER BY total_productos DESC;
    ```
20. Obtener los productos que no tienen un precio registrado.

    ```sql
    SELECT * FROM Productos WHERE precio IS NULL;
    ```
21. Obtener la fecha del último pedido realizado.

    ```sql
    SELECT MAX(fecha_pedido) AS ultimo_pedido FROM Pedidos;
    ```
22. Obtener los clientes cuyo nombre tiene al menos 5 caracteres.

    ```sql
    SELECT * FROM Clientes WHERE LENGTH(nombre) >= 5;
    ```

    ```sql
    SELECT * FROM Clientes WHERE nombre REGEXP '^.{5,}$';
    ```
23. Obtener los productos que tienen la letra "o" en cualquier posición del nombre.

    ```sql
    SELECT * FROM Productos WHERE nombre LIKE '%o%';
    ```

    ```sql
    SELECT * FROM Productos WHERE nombre REGEXP 'o';
    ```
24. Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.

    ```sql
    SELECT id_cliente, SUM(cantidad) AS total_productos 
    FROM Pedidos 
    GROUP BY id_cliente 
    ORDER BY id_cliente;
    ```
25. Obtener los clientes cuyos nombres no contienen la letra "i".

    ```sql
    SELECT * FROM Clientes WHERE nombre NOT LIKE '%i%';
    ```

    ```sql
    SELECT * FROM Clientes WHERE nombre NOT REGEXP 'i';
    ```
26. Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.

    ```sql
    SELECT * FROM Pedidos 
    WHERE id_cliente = 2 AND fecha_pedido BETWEEN '2024-02-01' AND '2024-02-29';
    ```
27. Obtener el precio mínimo de los productos.

    ```sql
    SELECT MIN(precio) AS precio_minimo FROM Productos;
    ```
28. Obtener los clientes que han realizado al menos un pedido en febrero de 2024.

    ```sql
    SELECT DISTINCT id_cliente 
    FROM Pedidos 
    WHERE fecha_pedido BETWEEN '2024-02-01' AND '2024-02-29';
    ```
29. Obtener la fecha del último pedido realizado por el cliente con ID 3.

    ```sql
    SELECT MAX(fecha_pedido) AS ultimo_pedido 
    FROM Pedidos 
    WHERE id_cliente = 3;
    ```
30. Obtener los productos que tienen una "a" al final del nombre.

    ```sql
    SELECT * FROM Productos WHERE nombre LIKE '%a';
    ```

    ```sql
    SELECT * FROM Productos WHERE nombre REGEXP 'a$';
    ```
31. Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas o minúsculas).

    ```sql
    SELECT * FROM Clientes
    WHERE (
        LENGTH(LOWER(nombre)) - LENGTH(REPLACE(LOWER(nombre), 'a', '')) +
        LENGTH(LOWER(nombre)) - LENGTH(REPLACE(LOWER(nombre), 'e', '')) +
        LENGTH(LOWER(nombre)) - LENGTH(REPLACE(LOWER(nombre), 'i', '')) +
        LENGTH(LOWER(nombre)) - LENGTH(REPLACE(LOWER(nombre), 'o', '')) +
        LENGTH(LOWER(nombre)) - LENGTH(REPLACE(LOWER(nombre), 'u', ''))
    ) >= 4;
    ```

    ```sql
    SELECT * FROM Clientes
    WHERE nombre REGEXP '([aeiouAEIOU][^aeiouAEIOU]*){4,}';
    ```
32. Obtener los productos cuyo precio tenga al menos 4 números sin contrar los decimales.

    ```sql
    SELECT * FROM Productos 
    WHERE precio >= 1000;
    ```
33. Obtener los clientes cuyos nombres tienen al menos una "a" seguida de una "e".

    ```sql
    SELECT * FROM Clientes WHERE nombre LIKE '%a%e%';
    ```

    ```sql
    SELECT * FROM Clientes WHERE nombre REGEXP 'a.*e';
    ```
34. Obtener los productos cuyos nombres terminan con una consonante.

    ```sql
    SELECT * FROM Productos 
    WHERE nombre REGEXP '[^aeiouAEIOU]$';
    ```
35. Obtener los productos cuyos nombres empiezan con una vocal.

    ```sql
    SELECT * FROM Productos 
    WHERE nombre REGEXP '^[aeiouAEIOU]';
    ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
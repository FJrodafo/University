## Examen

```sql
--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Clientes (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    ciudad TEXT,
    puntos_fidelidad INTEGER
);

CREATE TABLE Empleados (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    comision REAL
);

CREATE TABLE Ventas (
    id INTEGER PRIMARY KEY,
    total REAL,
    fecha TEXT,
    id_cliente INTEGER,
    id_empleado INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Clientes (id, nombre, apellido1, apellido2, ciudad, puntos_fidelidad) VALUES
    (1, 'Carlos', 'Martínez', 'García', 'Madrid', 1500),
    (2, 'Ana', 'López', 'Fernández', 'Barcelona', 800),
    (3, 'Miguel', 'Sánchez', 'Díaz', 'Valencia', NULL),
    (4, 'Elena', 'Gómez', NULL, 'Sevilla', 1200),
    (5, 'David', 'Pérez', 'Ruiz', 'Madrid', 750),
    (6, 'Laura', 'Jiménez', 'Moreno', 'Bilbao', 950),
    (7, 'Sofía', 'Hernández', NULL, 'Zaragoza', 1800),
    (8, 'Javier', 'Domingo', 'Santos', 'Málaga', 600),
    (9, 'Patricia', 'Romero', 'González', 'Barcelona', 1100),
    (10, 'Antonio', 'Navarro', 'Torres', 'Valencia', 400);

INSERT INTO Empleados (id, nombre, apellido1, apellido2, comision) VALUES
    (1, 'Daniel', 'Vázquez', 'Gil', 0.11999999999999999555),
    (2, 'María', 'Castro', 'Ortega', 0.10000000000000000555),
    (3, 'Pablo', 'Molina', 'Serrano', 0.080000000000000001665),
    (4, 'Lucía', 'Reyes', 'Martín', 0.11000000000000000055),
    (5, 'Alejandro', 'Suárez', 'Blanco', 0.089999999999999996669),
    (6, 'Isabel', 'Morales', 'Iglesias', 0.10000000000000000555),
    (7, 'Francisco', 'Santana', 'Méndez', 0.080000000000000001665),
    (8, 'Cristina', 'Cabrera', 'Flores', 0.040000000000000000832);

INSERT INTO Ventas (id, total, fecha, id_cliente, id_empleado) VALUES
    (1, 899.99000000000000908, '2023-05-15', 5, 2),
    (2, 1499.4999999999999999, '2022-09-20', 1, 5),
    (3, 450.75000000000000001, '2023-05-15', 2, 1),
    (4, 299.89999999999997727, '2022-08-10', 8, 3),
    (5, 1799.0, '2023-04-22', 5, 2),
    (6, 3299.9899999999997817, '2022-07-05', 7, 1),
    (7, 5998.9999999999999999, '2021-09-12', 2, 1),
    (8, 1299.9500000000000454, '2023-03-18', 4, 6),
    (9, 2499.4999999999999999, '2022-10-15', 8, 3),
    (10, 350.25, '2021-06-30', 8, 2),
    (11, 199.99000000000000908, '2022-08-10', 3, 7),
    (12, 4198.9999999999999998, '2023-02-14', 2, 1),
    (13, 799.49999999999999998, '2023-01-25', 6, 1),
    (14, 249.90000000000000567, '2023-02-02', 6, 1),
    (15, 898.99999999999999997, '2023-03-10', 1, 5),
    (16, 2799.9899999999997817, '2023-03-10', 1, 5);
```

1. Consultas sobre una tabla (6 consultas - 1.2 puntos / 0.2 cada una)

    1. Listar todas las ventas ordenadas por fecha (más recientes primero):

        ```sql
        SELECT *
        FROM Ventas
        ORDER BY fecha DESC;
        ```
    2. Top 3 ventas de mayor valor:

        ```sql
        SELECT *
        FROM Ventas
        ORDER BY total DESC
        LIMIT 3;
        ```
    3. Clientes con puntos de fidelidad no nulos:

        ```sql
        SELECT *
        FROM Clientes
        WHERE puntos_fidelidad IS NOT NULL;
        ```
    4. Ventas del año 2023 con total superior a 1000€:

        ```sql
        SELECT *
        FROM Ventas
        WHERE fecha LIKE '2023-%'
          AND total > 1000;
        ```
    5. Empleados con comisión mayor a 0.10:

        ```sql
        SELECT *
        FROM Empleados
        WHERE comision > 0.10;
        ```
    6. Clientes de Madrid o Barcelona:

        ```sql
        SELECT * 
        FROM Clientes
        WHERE ciudad IN ('Madrid', 'Barcelona');
        ```
2. Consultas multitabla (WHERE) (6 consultas - 1.8 puntos / 0.3 cada una)

    7. Ventas con nombres de clientes, empleados y total de ventas:

        ```sql
        SELECT
            V.id AS id_venta,
            C.nombre || ' ' || C.apellido1 || ' ' || IFNULL(C.apellido2, '') AS nombre_cliente,
            E.nombre || ' ' || E.apellido1 || ' ' || IFNULL(E.apellido2, '') AS nombre_empleado,
            V.total AS total_venta,
            V.fecha AS fecha_venta
        FROM Ventas V, Clientes C, Empleados E
        WHERE V.id_cliente = C.id
          AND V.id_empleado = E.id;
        ```
    8. Clientes que compraron en 2023:

        ```sql
        SELECT DISTINCT
            C.id AS id_cliente,
            C.nombre || ' ' || C.apellido1 || ' ' || IFNULL(C.apellido2, '') AS nombre_cliente
        FROM Ventas V, Clientes C
        WHERE V.id_cliente = C.id
          AND V.fecha LIKE '2023-%'
        ORDER BY C.id;
        ```
    9. Empleados que atendieron a clientes de Madrid:

        ```sql
        SELECT DISTINCT
            E.id AS id_empleado,
            E.nombre || ' ' || E.apellido1 || ' ' || IFNULL(E.apellido2, '') AS nombre_empleado
        FROM Ventas V, Empleados E, Clientes C
        WHERE V.id_empleado = E.id
          AND V.id_cliente = C.id
          AND C.ciudad = 'Madrid'
        ORDER BY E.id;
        ```
    10. Ventas superiores a 2000€ con datos de clientes:

        ```sql
        SELECT 
            V.id AS id_venta,
            V.total AS total_venta,
            V.fecha AS fecha_venta,
            C.id AS id_cliente,
            C.nombre || ' ' || C.apellido1 || ' ' || IFNULL(C.apellido2, '') AS nombre_cliente,
            C.ciudad AS ciudad_cliente
        FROM Ventas V, Clientes C
        WHERE V.id_cliente = C.id
          AND V.total > 2000
        ORDER BY V.id;
        ```
    11. Promedio de ventas por empleado:

        ```sql
        SELECT 
            E.id AS id_empleado,
            E.nombre || ' ' || E.apellido1 || ' ' || IFNULL(E.apellido2, '') AS nombre_empleado,
            AVG(V.total) AS promedio_ventas
        FROM Ventas V, Empleados E
        WHERE V.id_empleado = E.id
        GROUP BY E.id;
        ```
    12. Clientes que no han comprado:

        ```sql
        SELECT 
            C.id AS id_cliente,
            C.nombre || ' ' || C.apellido1 || ' ' || IFNULL(C.apellido2, '') AS nombre_cliente
        FROM Clientes C
        WHERE C.id NOT IN (
            SELECT V.id_cliente
            FROM Ventas V
            WHERE V.id_cliente IS NOT NULL
        )
        GROUP BY C.id;
        ```
3. Consultas multitabla (JOIN) (6 consultas - 1.8 puntos / 0.3 cada una)

    13. Ventas con nombres de clientes ,empleados y total de ventas:

        ```sql
        SELECT
            V.id AS id_venta,
            C.nombre AS cliente,
            E.nombre AS empleado,
            V.total AS total
        FROM Ventas V
        JOIN Clientes C ON V.id_cliente = C.id
        JOIN Empleados E ON V.id_empleado = E.id;
        ```
    14. Clientes que compraron en 2023:

        ```sql
        SELECT C.nombre, C.apellido1
        FROM Ventas V
        JOIN Clientes C ON V.id_cliente = C.id
        WHERE V.fecha REGEXP '2023'
        GROUP BY C.nombre
        ORDER BY C.nombre ASC;
        ```
    15. Empleados que atendieron a clientes de Madrid:

        ```sql
        SELECT E.nombre, E.apellido1
        FROM Ventas V
        JOIN Clientes C ON V.id_cliente = C.id
        JOIN Empleados E ON V.id_empleado = E.id
        WHERE C.ciudad REGEXP 'Madrid'
        GROUP BY E.nombre
        ORDER BY E.nombre ASC;
        ```
    16. Ventas superiores a 2000€ con datos de clientes:

        ```sql
        SELECT V.*, C.nombre, C.apellido1
        FROM Ventas V
        JOIN Clientes C ON V.id_cliente = C.id
        WHERE total > 2000;
        ```
    17. Promedio de ventas por empleado:

        ```sql
        SELECT E.nombre, AVG(V.total) AS promedio_ventas
        FROM Ventas V
        JOIN Empleados E ON V.id_empleado = E.id
        GROUP BY E.nombre
        ORDER BY E.nombre ASC;
        ```
    18. Clientes que no han comprado:

        ```sql
        SELECT C.*
        FROM Clientes C
        WHERE C.id NOT IN (
            SELECT V.id_cliente
            FROM Ventas V
        );
        ```
4. Consultas resumen (6 consultas - 2.4 puntos / 0.4 cada una)

    19. Total de ventas por ciudad de cliente:

        ```sql
        SELECT C.ciudad, SUM(V.total) AS total_ventas
        FROM Ventas V
        JOIN Clientes C ON V.id_cliente = C.id
        GROUP BY C.ciudad
        ORDER BY C.ciudad ASC;
        ```
    20. Número de ventas por empleado en 2023:

        ```sql
        SELECT E.nombre, COUNT(V.id_empleado) AS num_ventas
        FROM Ventas V
        JOIN Empleados E ON V.id_empleado = E.id
        GROUP BY E.nombre
        ORDER BY E.nombre ASC;
        ```
    21. Promedio de puntos de fidelidad por ciudad:

        ```sql
        SELECT ciudad, AVG(puntos_fidelidad) AS puntos_fidelidad
        FROM Clientes
        GROUP BY ciudad
        ORDER BY puntos_fidelidad DESC;
        ```
    22. Máxima venta por año:

        ```sql
        
        ```
    23. Clientes con más de 1 compra:

        ```sql
        SELECT C.nombre, COUNT(V.id_cliente) AS num_compras
        FROM Ventas V
        JOIN Clientes C ON V.id_cliente = C.id
        GROUP BY C.nombre
        ORDER BY C.nombre ASC;
        ```
    24. Empleados con ventas promedio superiores a 1000€:

        ```sql
        SELECT E.nombre, AVG(V.total) AS venta_promedio
        FROM Ventas V
        JOIN Empleados E ON V.id_empleado = E.id
        GROUP BY E.nombre
        ORDER BY E.nombre ASC;
        ```
5. Subconsultas (6 consultas - 3.0 puntos / 0.5 cada una)

    25. Clientes con ventas superiores al promedio:

        ```sql
        SELECT C.*
        FROM Clientes C
        JOIN Ventas V ON C.id = V.id_cliente
        WHERE V.total > (
            SELECT AVG(V.total) AS promedio
            FROM Ventas V
        )
        GROUP BY C.nombre
        ORDER BY C.id ASC;
        ```
    26. Empleados que no han realizado ventas:

        ```sql
        SELECT E.*
        FROM Empleados E
        WHERE E.id NOT IN (
            SELECT V.id_empleado
            FROM Ventas V
        );
        ```
    27. Ventas de clientes con puntos de fidelidad > 1000:

        ```sql
        SELECT V.*
        FROM Ventas V
        JOIN Clientes C ON V.id_cliente = C.id
        WHERE C.puntos_fidelidad > 1000;
        ```
    28. Clientes con al menos una venta > 2000€:

        ```sql
        SELECT C.*
        FROM Clientes C
        JOIN Ventas V ON C.id = V.id_cliente
        WHERE V.total > 2000
        GROUP BY C.nombre
        ORDER BY C.id;
        ```
    29. Empleados con ventas en todas las ciudades:

        ```sql
        
        ```
    30. Ventas del cliente con más puntos de fidelidad:

        ```sql
        SELECT V.*
        FROM Ventas V
        JOIN Clientes C ON V.id_cliente = C.id
        WHERE C.puntos_fidelidad = (
            SELECT C.puntos_fidelidad
            FROM Clientes C
            ORDER BY C.puntos_fidelidad DESC LIMIT 1
        );
        ```
## Resumen de Puntos

| Categoría          | N° Consultas | Puntos / Cada una |
| :----------------- | :----------: | :---------------: |
| Sobre una tabla    | 6            | 1.2 / 0.2         |
| Multitabla (WHERE) | 6            | 1.8 / 0.3         |
| Multitabla (JOIN)  | 6            | 1.8 / 0.3         |
| Resumen            | 6            | 2.4 / 0.4         |
| Subconsultas       | 6            | 3.0 / 0.5         |
| Total              | 30           | 10.2              |

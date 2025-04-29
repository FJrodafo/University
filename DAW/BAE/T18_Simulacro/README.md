## Simulacro

```sql
--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Socios (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    ciudad TEXT,
    fecha_alta TEXT,
    categoria TEXT
);

CREATE TABLE Libros (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    autor TEXT,
    genero TEXT,
    anio_publicacion INTEGER,
    disponible INTEGER 
);

CREATE TABLE Bibliotecarios (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    antiguedad INTEGER 
);

CREATE TABLE Prestamos (
    id INTEGER PRIMARY KEY,
    fecha_prestamo TEXT,
    fecha_devolucion TEXT,
    id_socio INTEGER,
    id_libro INTEGER,
    id_bibliotecario INTEGER,
    FOREIGN KEY (id_socio) REFERENCES Socios(id),
    FOREIGN KEY (id_libro) REFERENCES Libros(id),
    FOREIGN KEY (id_bibliotecario) REFERENCES Bibliotecarios(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Socios (id, nombre, apellido1, apellido2, ciudad, fecha_alta, categoria) VALUES
    (1, 'Laura', 'García', 'Martínez', 'Madrid', '2020-03-15', 'A'),
    (2, 'Carlos', 'López', 'Fernández', 'Barcelona', '2021-05-20', 'B'),
    (3, 'Ana', 'Sánchez', NULL, 'Valencia', '2022-01-10', 'C'),
    (4, 'David', 'Pérez', 'Gómez', 'Sevilla', '2021-11-30', 'A'),
    (5, 'Elena', 'Martín', 'Díaz', 'Madrid', '2023-02-18', 'B'),
    (6, 'Javier', 'Ruiz', 'Moreno', 'Bilbao', '2020-07-22', 'A'),
    (7, 'Sofía', 'Hernández', 'Jiménez', 'Zaragoza', '2022-09-05', 'C'),
    (8, 'Miguel', 'Navarro', 'Torres', 'Málaga', '2021-04-12', 'B'),
    (9, 'Patricia', 'Romero', NULL, 'Barcelona', '2023-01-15', 'A'),
    (10, 'Antonio', 'Domingo', 'Santos', 'Valencia', '2020-12-08', 'C');

INSERT INTO Libros (id, titulo, autor, genero, anio_publicacion, disponible) VALUES
    (1, 'El Quijote', 'Miguel de Cervantes', 'Clásico', 1605, 1),
    (2, 'Cien años de soledad', 'Gabriel García Márquez', 'Realismo mágico', 1967, 0),
    (3, '1984', 'George Orwell', 'Ciencia ficción', 1949, 1),
    (4, 'Orgullo y prejuicio', 'Jane Austen', 'Romance', 1813, 0),
    (5, 'La sombra del viento', 'Carlos Ruiz Zafón', 'Misterio', 2001, 1),
    (6, 'Rayuela', 'Julio Cortázar', 'Experimental', 1963, 0),
    (7, 'Ficciones', 'Jorge Luis Borges', 'Cuentos', 1944, 1),
    (8, 'Los pilares de la Tierra', 'Ken Follett', 'Histórica', 1989, 0),
    (9, 'El amor en los tiempos del cólera', 'Gabriel García Márquez', 'Romance', 1985, 1),
    (10, 'La casa de los espíritus', 'Isabel Allende', 'Realismo mágico', 1982, 0);

INSERT INTO Bibliotecarios (id, nombre, apellido1, apellido2, antiguedad) VALUES
    (1, 'Daniel', 'Vázquez', 'Gil', 5),
    (2, 'María', 'Castro', 'Ortega', 3),
    (3, 'Pablo', 'Molina', 'Serrano', 2),
    (4, 'Lucía', 'Reyes', 'Martín', 7),
    (5, 'Alejandro', 'Suárez', 'Blanco', 1),
    (6, 'Isabel', 'Morales', 'Iglesias', 4),
    (7, 'Francisco', 'Santana', 'Méndez', 6),
    (8, 'Cristina', 'Cabrera', 'Flores', 2);

INSERT INTO Prestamos (id, fecha_prestamo, fecha_devolucion, id_socio, id_libro, id_bibliotecario) VALUES
    (1, '2023-01-10', '2023-01-24', 1, 2, 1),
    (2, '2023-02-15', '2023-03-01', 3, 4, 6),
    (3, '2023-03-20', NULL, 5, 6, 4),
    (4, '2023-04-05', '2023-04-19', 2, 8, 8),
    (5, '2023-05-12', NULL, 4, 10, 1),
    (6, '2023-01-22', '2023-02-05', 6, 2, 1),
    (7, '2023-02-18', '2023-03-04', 7, 4, 2),
    (8, '2023-03-25', NULL, 8, 6, 2),
    (9, '2023-04-10', '2023-04-24', 9, 8, 1),
    (10, '2023-05-15', NULL, 10, 10, 6),
    (11, '2023-01-05', '2023-01-19', 1, 1, 5),
    (12, '2023-02-10', '2023-02-24', 2, 3, 5),
    (13, '2023-03-15', NULL, 3, 5, 8),
    (14, '2023-04-20', '2023-05-04', 4, 7, 1),
    (15, '2023-05-25', NULL, 5, 9, 2);
```

1. Consultas Básicas

    1. Listar todos los libros disponibles

        ```sql
        SELECT * FROM Libros
        WHERE disponible = 1;
        ```
    2. Mostrar socios de Madrid ordenados por apellido

        ```sql
        SELECT * FROM Socios
        WHERE ciudad = 'Madrid'
        ORDER BY apellido1 ASC;
        ```
    3. Libros publicados después de 1950

        ```sql
        SELECT * FROM Libros
        WHERE anio_publicacion > 1950
        ORDER BY anio_publicacion ASC;
        ```
    4. Bibliotecarios con más de 3 años de antigüedad

        ```sql
        SELECT * FROM Bibliotecarios
        WHERE antiguedad > 3
        ORDER BY antiguedad ASC;
        ```
    5. Préstamos realizados en 2023

        ```sql
        SELECT * FROM Prestamos
        WHERE fecha_prestamo REGEXP '^2023'
        ORDER BY fecha_prestamo ASC;
        ```
    6. Socios sin segundo apellido

        ```sql
        SELECT * FROM Socios
        WHERE apellido2 IS NULL;
        ```
    7. Libros del género "Realismo mágico"

        ```sql
        SELECT * FROM Libros
        WHERE genero = 'Realismo mágico';
        ```
    8. Préstamos no devueltos

        ```sql
        SELECT * FROM Prestamos
        WHERE fecha_devolucion IS NULL
        ORDER BY fecha_prestamo;
        ```
2. Consultas Multitabla (WHERE) (sin JOIN)

    1. Préstamos con nombres de socio y libro

        ```sql
        SELECT
            P.*,
            S.nombre AS nombre_socio,
            L.titulo AS titulo_libro
        FROM
            Prestamos P,
            Socios S,
            Libros L
        WHERE P.id_socio = S.id
        AND P.id_libro = L.id;
        ```
    2. Libros prestados a socios de Barcelona

        ```sql
        SELECT
            L.titulo AS titulo_libro,
            P.fecha_prestamo AS fecha_prestamo,
            S.id AS id_socio,
            S.nombre AS nombre_socio
        FROM
            Prestamos P,
            Socios S,
            Libros L
        WHERE P.id_socio = S.id
        AND P.id_libro = L.id
        AND S.ciudad = 'Barcelona';
        ```
    3. Socios que han tomado prestado "Cien años de soledad"

        ```sql
        SELECT
            P.id AS id_prestamo,
            P.fecha_prestamo AS fecha_prestamo,
            S.id AS id_socio,
            S.nombre AS nombre_socio,
            L.id AS id_libro,
            L.titulo AS titulo_libro
        FROM
            Prestamos P,
            Socios S,
            Libros L
        WHERE P.id_socio = S.id
        AND P.id_libro = L.id
        AND L.titulo = 'Cien años de soledad';
        ```
    4. Bibliotecarios que han gestionado préstamos

        ```sql
        SELECT DISTINCT
            B.id,
            B.nombre,
            B.apellido1,
            B.apellido2
        FROM
            Prestamos P,
            Bibliotecarios B
        WHERE P.id_bibliotecario = B.id
        ORDER BY B.id;
        ```
    5. Préstamos con retraso (fecha_devolucion > fecha_prestamo + 14 días)

        ```sql
        SELECT *
        FROM Prestamos
        WHERE fecha_devolucion IS NOT NULL
        AND julianday(fecha_devolucion) > julianday(fecha_prestamo) + 14;
        ```
    6. Socios que nunca han tomado prestado un libro

        ```sql
        SELECT
            S.id AS id_socio,
            S.nombre AS nombre_socio
        FROM Socios S
        WHERE S.id NOT IN (
            SELECT P.id_socio AS id_socio
            FROM Prestamos P
        );
        ```
    7. Libros más prestados

        ```sql
        SELECT
            L.titulo,
            COUNT(P.id_libro) AS veces_prestado
        FROM
            Prestamos P,
            Libros L
        WHERE P.id_libro = L.id
        GROUP BY L.titulo
        ORDER BY veces_prestado DESC;
        ```
    8. Autores cuyos libros han sido prestados

        ```sql
        SELECT L.autor
        FROM Libros L
        WHERE L.id IN (
            SELECT id_libro
            FROM Prestamos
        );
        ```

        ```sql
        SELECT L.autor
        FROM Libros L
        WHERE EXISTS (
            SELECT id_libro
            FROM Prestamos P
            WHERE L.id = P.id_libro
        );
        ```
3. Consultas Multitabla (JOIN)

    1. Préstamos con nombres de socio y libro

        ```sql
        SELECT
            P.*,
            S.nombre AS nombre_socio,
            L.titulo AS titulo_libro
        FROM Prestamos P
        JOIN Socios S ON P.id_socio = S.id
        JOIN Libros L ON P.id_libro = L.id;
        ```
    2. Libros prestados a socios de Barcelona

        ```sql
        SELECT
            L.titulo AS titulo_libro,
            P.fecha_prestamo AS fecha_prestamo,
            S.id AS id_socio,
            S.nombre AS nombre_socio
        FROM Prestamos P
        JOIN Socios S ON P.id_socio = S.id
        JOIN Libros L ON P.id_libro = L.id
        WHERE S.ciudad = 'Barcelona';
        ```
    3. Socios que han tomado prestado "Cien años de soledad"

        ```sql
        SELECT
            P.id AS id_prestamo,
            P.fecha_prestamo AS fecha_prestamo,
            S.id AS id_socio,
            S.nombre AS nombre_socio,
            L.id AS id_libro,
            L.titulo AS titulo_libro
        FROM Prestamos P
        JOIN Socios S ON P.id_socio = S.id
        JOIN Libros L ON P.id_libro = L.id
        WHERE L.titulo = 'Cien años de soledad';
        ```
    4. Bibliotecarios que han gestionado préstamos

        ```sql
        SELECT DISTINCT
            B.id,
            B.nombre,
            B.apellido1,
            B.apellido2,
            COUNT(P.id_bibliotecario) AS prestamos_gestionados
        FROM
            Prestamos P,
            Bibliotecarios B
        WHERE P.id_bibliotecario = B.id
        GROUP BY B.id
        ORDER BY B.id ASC;
        ```
    5. Préstamos con datos completos (socio, libro, bibliotecario)

        ```sql
        SELECT S.*, L.*, P.*
        FROM Prestamos P
        JOIN Socios S ON P.id_socio = S.id
        JOIN Libros L ON P.id_libro = L.id;
        ```
    6. Socios con sus préstamos activos

        ```sql
        SELECT
            S.id AS id_socio,
            S.nombre AS nombre_socio,
            S.apellido1 AS apellido1_socio,
            S.apellido2 AS apellido2_socio,
            P.id AS id_prestamo,
            P.fecha_prestamo,
            P.fecha_devolucion,
            L.titulo AS titulo_libro
        FROM
            Prestamos P
        JOIN Socios S ON P.id_socio = S.id
        JOIN Libros L ON P.id_libro = L.id
        WHERE P.fecha_devolucion IS NULL;
        ```
    7. Libros nunca prestados

        ```sql
        SELECT
            L.id,
            L.titulo
        FROM Libros L
        LEFT JOIN Prestamos P ON L.id = P.id_libro
        WHERE P.id_libro IS NULL;
        ```
    8. Autores con número de libros prestados

        ```sql
        SELECT
            L.autor,
            COUNT(P.id_libro) AS libros_prestados
        FROM
            Prestamos P
        JOIN Libros L ON P.id_libro = L.id
        GROUP BY L.autor
        ORDER BY libros_prestados DESC;
        ```
4. Consultas resumen

    1. Número de socios por ciudad

        ```sql
        SELECT
            ciudad,
            COUNT(*) AS num_socios
        FROM Socios
        GROUP BY ciudad;
        ```
    2. Promedio de antigüedad de bibliotecarios

        ```sql
        SELECT AVG(antiguedad) AS promedio_antiguedad
        FROM Bibliotecarios;
        ```
    3. Cantidad de préstamos por mes en 2023

        ```sql
        SELECT
            strftime('%Y-%m', fecha_prestamo) AS mes,
            COUNT(*) AS cantidad_prestamos
        FROM Prestamos
        WHERE fecha_prestamo REGEXP '^2023'
        GROUP BY mes
        ORDER BY mes;
        ```
    4. Libros más populares (por veces prestados)

        ```sql
        SELECT
            L.titulo,
            COUNT(P.id_libro) AS veces_prestado
        FROM Prestamos P
        JOIN Libros L ON P.id_libro = L.id
        GROUP BY L.id
        ORDER BY veces_prestado DESC;
        ```
    5. Socios más activos (por préstamos realizados)

        ```sql
        SELECT
            S.nombre AS nombre_socio,
            COUNT(P.id_socio) AS prestamos_realizados
        FROM Prestamos P
        JOIN Socios S ON P.id_socio = S.id
        GROUP BY S.id
        ORDER BY prestamos_realizados DESC;
        ```
    6. Porcentaje de libros disponibles

        ```sql
        SELECT
            (COUNT(CASE WHEN disponible = 1 THEN 1 END) * 100.0) / COUNT(*) AS porcentaje_disponibles
        FROM Libros;
        ```
    7. Días promedio de préstamo

        ```sql
        SELECT AVG(julianday(fecha_devolucion) - julianday(fecha_prestamo)) AS promedio_dias_prestamo
        FROM Prestamos
        WHERE fecha_devolucion IS NOT NULL;
        ```
    8. Número de préstamos por categoría de socio

        ```sql
        SELECT
            S.categoria,
            COUNT(P.id) AS prestamos_por_categoria
        FROM Prestamos P
        JOIN Socios S ON P.id_socio = S.id
        GROUP BY S.categoria;
        ```
5. Subconsultas

    1. Socios que han prestado libros de Gabriel García Márquez

        ```sql
        SELECT
            S.id,
            S.nombre
        FROM Socios S
        WHERE S.id IN (
            SELECT P.id_socio
            FROM Prestamos P
            JOIN Libros L ON P.id_libro = L.id
            WHERE L.autor = 'Gabriel García Márquez'
        );
        ```
    2. Libros con préstamos superiores al promedio

        ```sql
        SELECT L.titulo
        FROM Libros L
        WHERE L.id IN (
            SELECT id_libro
            FROM Prestamos
            GROUP BY id_libro
            HAVING COUNT(id_libro) > (
                SELECT AVG(libros_prestados) FROM (
                    SELECT COUNT(id_libro) AS libros_prestados
                    FROM Prestamos
                    GROUP BY id_libro
                )
            )
        );
        ```
    3. Socios con todos los préstamos devueltos a tiempo

        ```sql
        SELECT
            S.id,
            S.nombre
        FROM Socios S
        WHERE S.id NOT IN (
            SELECT P.id_socio
            FROM Prestamos P
            WHERE P.fecha_devolucion IS NOT NULL
            AND julianday(P.fecha_devolucion) > julianday(P.fecha_prestamo) + 14
        );
        ```
    4. Bibliotecarios que no han gestionado préstamos

        ```sql
        SELECT B.id, B.nombre
        FROM Bibliotecarios B
        WHERE B.id NOT IN (
            SELECT P.id_bibliotecario
            FROM Prestamos P
        );
        ```
    5. Socios que han prestado más libros que el promedio

        ```sql
        SELECT S.id, S.nombre
        FROM Socios S
        WHERE S.id IN (
            SELECT P.id_socio
            FROM Prestamos P
            GROUP BY P.id_socio
            HAVING COUNT(P.id_libro) > (
                SELECT AVG(libros_prestados)
                FROM (
                    SELECT COUNT(id_libro) AS libros_prestados
                    FROM Prestamos
                    GROUP BY id_socio
                )
            )
        );
        ```
    6. Libros disponibles que nunca han sido prestados

        ```sql
        SELECT L.titulo
        FROM Libros L
        WHERE L.disponible = 1
        AND L.id NOT IN (
            SELECT id_libro
            FROM Prestamos
        );
        ```
    7. Socios con préstamos en todas las categorías de libros

        ```sql
        ?
        ```
    8. Bibliotecarios que han gestionado préstamos de todos los socios de Madrid

        ```sql
        SELECT B.id, B.nombre
        FROM Bibliotecarios B
        WHERE NOT EXISTS (
            SELECT S.id
            FROM Socios S
            WHERE S.ciudad = 'Madrid'
            AND NOT EXISTS (
                SELECT 1
                FROM Prestamos P
                WHERE P.id_bibliotecario = B.id
                AND P.id_socio = S.id
            )
        );
        ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
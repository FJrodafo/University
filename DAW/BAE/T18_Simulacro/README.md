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
        SELECT * FROM Libros WHERE disponible = 1;
        ```
    2. Mostrar socios de Madrid ordenados por apellido

        ```sql
        SELECT * FROM Socios WHERE ciudad = 'Madrid' ORDER BY apellido1 ASC;
        ```
    3. Libros publicados después de 1950

        ```sql
        SELECT * FROM Libros WHERE anio_publicacion > 1950 ORDER BY anio_publicacion ASC;
        ```
    4. Bibliotecarios con más de 3 años de antigüedad

        ```sql
        SELECT * FROM Bibliotecarios WHERE antiguedad > 3 ORDER BY antiguedad ASC;
        ```
    5. Préstamos realizados en 2023

        ```sql
        SELECT * FROM Prestamos WHERE fecha_prestamo REGEXP '^2023' ORDER BY fecha_prestamo ASC;
        ```
    6. Socios sin segundo apellido

        ```sql
        SELECT * FROM Socios WHERE apellido2 IS NULL;
        ```
    7. Libros del género "Realismo mágico"

        ```sql
        SELECT * FROM Libros WHERE genero = 'Realismo mágico';
        ```
    8. Préstamos no devueltos

        ```sql
        SELECT * FROM Prestamos WHERE fecha_devolucion IS NULL ORDER BY fecha_prestamo;
        ```
2. Consultas Multitabla (WHERE) (sin JOIN)

    1. Préstamos con nombres de socio y libro

        ```sql
        SELECT
            p.*,
            s.nombre AS nombre_socio,
            l.titulo AS titulo_libro
        FROM
            Prestamos p,
            Socios s,
            Libros l
        WHERE p.id_socio = s.id
        AND p.id_libro = l.id;
        ```
    2. Libros prestados a socios de Barcelona

        ```sql
        SELECT
            l.titulo AS titulo_libro,
            p.fecha_prestamo AS fecha_prestamo,
            s.id AS id_socio,
            s.nombre AS nombre_socio
        FROM
            Prestamos p,
            Socios s,
            Libros l
        WHERE p.id_socio = s.id
        AND p.id_libro = l.id
        AND s.ciudad = 'Barcelona';
        ```
    3. Socios que han tomado prestado "Cien años de soledad"

        ```sql
        SELECT
            p.id AS id_prestamo,
            p.fecha_prestamo AS fecha_prestamo,
            s.id AS id_socio,
            s.nombre AS nombre_socio,
            l.id AS id_libro,
            l.titulo AS titulo_libro
        FROM
            Prestamos p,
            Socios s,
            Libros l
        WHERE p.id_socio = s.id
        AND p.id_libro = l.id
        AND l.titulo = 'Cien años de soledad';
        ```
    4. Bibliotecarios que han gestionado préstamos

        ```sql
        
        ```
    5. Préstamos con retraso (fecha_devolucion > fecha_prestamo + 14 días)

        ```sql
        
        ```
    6. Socios que nunca han tomado prestado un libro

        ```sql
        SELECT
            s.id AS id_socio,
            s.nombre AS nombre_socio
        FROM Socios s
        WHERE s.id NOT IN (
            SELECT p.id_socio AS id_socio
            FROM Prestamos p
        );
        ```
    7. Libros más prestados

        ```sql
        
        ```
    8. Autores cuyos libros han sido prestados

        ```sql
        SELECT l.autor FROM Libros l WHERE l.id IN (SELECT id_libro FROM Prestamos);
        ```

        ```sql
        SELECT l.autor FROM Libros l WHERE EXISTS (SELECT id_libro FROM Prestamos p WHERE l.id = p.id_libro);
        ```
3. Consultas Multitabla (JOIN)

    1. Préstamos con nombres de socio y libro

        ```sql
        SELECT
            p.*,
            s.nombre AS nombre_socio,
            l.titulo AS titulo_libro
        FROM Prestamos p
        JOIN Socios s ON p.id_socio = s.id
        JOIN Libros l ON p.id_libro = l.id;
        ```
    2. Libros prestados a socios de Barcelona

        ```sql
        SELECT
            l.titulo AS titulo_libro,
            p.fecha_prestamo AS fecha_prestamo,
            s.id AS id_socio,
            s.nombre AS nombre_socio
        FROM Prestamos p
        JOIN Socios s ON p.id_socio = s.id
        JOIN Libros l ON p.id_libro = l.id
        WHERE s.ciudad = 'Barcelona';
        ```
    3. Socios que han tomado prestado "Cien años de soledad"

        ```sql
        SELECT
            p.id AS id_prestamo,
            p.fecha_prestamo AS fecha_prestamo,
            s.id AS id_socio,
            s.nombre AS nombre_socio,
            l.id AS id_libro,
            l.titulo AS titulo_libro
        FROM Prestamos p
        JOIN Socios s ON p.id_socio = s.id
        JOIN Libros l ON p.id_libro = l.id
        WHERE l.titulo = 'Cien años de soledad';
        ```
    4. Bibliotecarios que han gestionado préstamos

        ```sql
        
        ```
    5. Préstamos con datos completos (socio, libro, bibliotecario)

        ```sql
        SELECT s.*, l.*, p.*
        FROM Prestamos p
        JOIN Socios s ON p.id_socio = s.id
        JOIN Libros l ON p.id_libro = l.id;
        ```
    6. Socios con sus préstamos activos

        ```sql
        
        ```
    7. Libros nunca prestados

        ```sql
        
        ```
    8. Autores con número de libros prestados

        ```sql
        
        ```
4. Consultas resumen

    1. Número de socios por ciudad

        ```sql
        
        ```
    2. Promedio de antigüedad de bibliotecarios

        ```sql
        
        ```
    3. Cantidad de préstamos por mes en 2023

        ```sql
        
        ```
    4. Libros más populares (por veces prestados)

        ```sql
        
        ```
    5. Socios más activos (por préstamos realizados)

        ```sql
        
        ```
    6. Porcentaje de libros disponibles

        ```sql
        
        ```
    7. Días promedio de préstamo

        ```sql
        
        ```
    8. Número de préstamos por categoría de socio

        ```sql
        
        ```
5. Subconsultas

    1. Socios que han prestado libros de Gabriel García Márquez

        ```sql
        
        ```
    2. Libros con préstamos superiores al promedio

        ```sql
        
        ```
    3. Socios con todos los préstamos devueltos a tiempo

        ```sql
        
        ```
    4. Bibliotecarios que no han gestionado préstamos

        ```sql
        
        ```
    5. Socios que han prestado más libros que el promedio

        ```sql
        
        ```
    6. Libros disponibles que nunca han sido prestados

        ```sql
        
        ```
    7. Socios con préstamos en todas las categorías de libros

        ```sql
        
        ```
    8. Bibliotecarios que han gestionado préstamos de todos los socios de Madrid

        ```sql
        
        ```
                
<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
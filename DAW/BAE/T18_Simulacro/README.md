## Simulacro

```sql
CREATE TABLE socio (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    ciudad TEXT,
    fecha_alta TEXT,
    categoria TEXT
);

CREATE TABLE libro (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    autor TEXT,
    genero TEXT,
    año_publicacion INTEGER,
    disponible INTEGER 
);

CREATE TABLE prestamo (
    id INTEGER PRIMARY KEY,
    fecha_prestamo TEXT,
    fecha_devolucion TEXT,
    id_socio INTEGER,
    id_libro INTEGER,
    FOREIGN KEY (id_socio) REFERENCES socio(id),
    FOREIGN KEY (id_libro) REFERENCES libro(id)
);

CREATE TABLE bibliotecario (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    antiguedad INTEGER 
);

INSERT INTO socio VALUES(1, 'Laura', 'García', 'Martínez', 'Madrid', '2020-03-15', 'A');
INSERT INTO socio VALUES(2, 'Carlos', 'López', 'Fernández', 'Barcelona', '2021-05-20', 'B');
INSERT INTO socio VALUES(3, 'Ana', 'Sánchez', NULL, 'Valencia', '2022-01-10', 'C');
INSERT INTO socio VALUES(4, 'David', 'Pérez', 'Gómez', 'Sevilla', '2021-11-30', 'A');
INSERT INTO socio VALUES(5, 'Elena', 'Martín', 'Díaz', 'Madrid', '2023-02-18', 'B');
INSERT INTO socio VALUES(6, 'Javier', 'Ruiz', 'Moreno', 'Bilbao', '2020-07-22', 'A');
INSERT INTO socio VALUES(7, 'Sofía', 'Hernández', 'Jiménez', 'Zaragoza', '2022-09-05', 'C');
INSERT INTO socio VALUES(8, 'Miguel', 'Navarro', 'Torres', 'Málaga', '2021-04-12', 'B');
INSERT INTO socio VALUES(9, 'Patricia', 'Romero', NULL, 'Barcelona', '2023-01-15', 'A');
INSERT INTO socio VALUES(10, 'Antonio', 'Domingo', 'Santos', 'Valencia', '2020-12-08', 'C');

INSERT INTO libro VALUES(1, 'El Quijote', 'Miguel de Cervantes', 'Clásico', 1605, 1);
INSERT INTO libro VALUES(2, 'Cien años de soledad', 'Gabriel García Márquez', 'Realismo mágico', 1967, 0);
INSERT INTO libro VALUES(3, '1984', 'George Orwell', 'Ciencia ficción', 1949, 1);
INSERT INTO libro VALUES(4, 'Orgullo y prejuicio', 'Jane Austen', 'Romance', 1813, 0);
INSERT INTO libro VALUES(5, 'La sombra del viento', 'Carlos Ruiz Zafón', 'Misterio', 2001, 1);
INSERT INTO libro VALUES(6, 'Rayuela', 'Julio Cortázar', 'Experimental', 1963, 0);
INSERT INTO libro VALUES(7, 'Ficciones', 'Jorge Luis Borges', 'Cuentos', 1944, 1);
INSERT INTO libro VALUES(8, 'Los pilares de la Tierra', 'Ken Follett', 'Histórica', 1989, 0);
INSERT INTO libro VALUES(9, 'El amor en los tiempos del cólera', 'Gabriel García Márquez', 'Romance', 1985, 1);
INSERT INTO libro VALUES(10, 'La casa de los espíritus', 'Isabel Allende', 'Realismo mágico', 1982, 0);

INSERT INTO bibliotecario VALUES(1, 'Daniel', 'Vázquez', 'Gil', 5);
INSERT INTO bibliotecario VALUES(2, 'María', 'Castro', 'Ortega', 3);
INSERT INTO bibliotecario VALUES(3, 'Pablo', 'Molina', 'Serrano', 2);
INSERT INTO bibliotecario VALUES(4, 'Lucía', 'Reyes', 'Martín', 7);
INSERT INTO bibliotecario VALUES(5, 'Alejandro', 'Suárez', 'Blanco', 1);
INSERT INTO bibliotecario VALUES(6, 'Isabel', 'Morales', 'Iglesias', 4);
INSERT INTO bibliotecario VALUES(7, 'Francisco', 'Santana', 'Méndez', 6);
INSERT INTO bibliotecario VALUES(8, 'Cristina', 'Cabrera', 'Flores', 2);

INSERT INTO prestamo VALUES(1, '2023-01-10', '2023-01-24', 1, 2);
INSERT INTO prestamo VALUES(2, '2023-02-15', '2023-03-01', 3, 4);
INSERT INTO prestamo VALUES(3, '2023-03-20', NULL, 5, 6);
INSERT INTO prestamo VALUES(4, '2023-04-05', '2023-04-19', 2, 8);
INSERT INTO prestamo VALUES(5, '2023-05-12', NULL, 4, 10);
INSERT INTO prestamo VALUES(6, '2023-01-22', '2023-02-05', 6, 2);
INSERT INTO prestamo VALUES(7, '2023-02-18', '2023-03-04', 7, 4);
INSERT INTO prestamo VALUES(8, '2023-03-25', NULL, 8, 6);
INSERT INTO prestamo VALUES(9, '2023-04-10', '2023-04-24', 9, 8);
INSERT INTO prestamo VALUES(10, '2023-05-15', NULL, 10, 10);
INSERT INTO prestamo VALUES(11, '2023-01-05', '2023-01-19', 1, 1);
INSERT INTO prestamo VALUES(12, '2023-02-10', '2023-02-24', 2, 3);
INSERT INTO prestamo VALUES(13, '2023-03-15', NULL, 3, 5);
INSERT INTO prestamo VALUES(14, '2023-04-20', '2023-05-04', 4, 7);
INSERT INTO prestamo VALUES(15, '2023-05-25', NULL, 5, 9);
```

```sql
-- 1. Consultas Básicas (8 consultas - 1.6 puntos)

-- Listar todos los libros disponibles
SELECT * FROM libro WHERE disponible = 1;

-- Mostrar socios de Madrid ordenados por apellido
SELECT * FROM socio WHERE ciudad = 'Madrid' ORDER BY apellido1 ASC;

-- Libros publicados después de 1950
SELECT * FROM libro WHERE año_publicacion > 1950 ORDER BY año_publicacion ASC;

-- Bibliotecarios con más de 3 años de antigüedad
SELECT * FROM bibliotecario WHERE antiguedad > 3 ORDER BY antiguedad ASC;

-- Préstamos realizados en 2023
SELECT * FROM prestamo WHERE fecha_prestamo REGEXP '^2023' ORDER BY fecha_prestamo ASC;

-- Socios sin segundo apellido
SELECT * FROM socio WHERE apellido2 IS NULL;

-- Libros del género "Realismo mágico"
SELECT * FROM libro WHERE genero = 'Realismo mágico';

-- Préstamos no devueltos (fecha_devolucion IS NULL)
SELECT * FROM prestamo WHERE fecha_devolucion IS NULL ORDER BY fecha_prestamo;
```

```sql
-- 2. Consultas Multitabla (WHERE) (8 consultas - 2.4 puntos)

-- Préstamos con nombres de socio y libro (sin JOIN)
SELECT
    p.*,
    s.nombre AS nombre_socio,
    l.titulo AS titulo_libro
FROM
    prestamo p,
    socio s,
    libro l
WHERE p.id_socio = s.id
AND p.id_libro = l.id;

-- Libros prestados a socios de Barcelona (sin JOIN)
SELECT
    l.titulo AS titulo_libro,
    p.fecha_prestamo AS fecha_prestamo,
    s.id AS id_socio,
    s.nombre AS nombre_socio
FROM
    prestamo p,
    socio s,
    libro l
WHERE p.id_socio = s.id
AND p.id_libro = l.id
AND s.ciudad = 'Barcelona';

-- Socios que han tomado prestado "Cien años de soledad" (sin JOIN)
SELECT
    p.id AS id_prestamo,
    p.fecha_prestamo AS fecha_prestamo,
    s.id AS id_socio,
    s.nombre AS nombre_socio,
    l.id AS id_libro,
    l.titulo AS titulo_libro
FROM
    prestamo p,
    socio s,
    libro l
WHERE p.id_socio = s.id
AND p.id_libro = l.id
AND l.titulo = 'Cien años de soledad';

-- Bibliotecarios que han gestionado préstamos (sin JOIN)
SELECT

-- Préstamos con retraso (fecha_devolucion > fecha_prestamo + 14 días)
SELECT

-- Socios que nunca han tomado prestado un libro (sin LEFT JOIN)
SELECT
    s.id AS id_socio,
    s.nombre AS nombre_socio
FROM socio s
WHERE s.id NOT IN (
    SELECT p.id_socio AS id_socio
    FROM prestamo p
);

-- Libros más prestados (sin JOIN)
SELECT

-- Autores cuyos libros han sido prestados (sin JOIN)
SELECT l.autor FROM libro l WHERE l.id IN (SELECT id_libro FROM prestamo);
SELECT l.autor FROM libro l WHERE EXISTS (SELECT id_libro FROM prestamo p WHERE l.id = p.id_libro);
```

```sql
-- 3. Consultas Multitabla (JOIN) (8 consultas - 2.4 puntos)

-- Préstamos con nombres de socio y libro (JOIN)
SELECT
    p.*,
    s.nombre AS nombre_socio,
    l.titulo AS titulo_libro
FROM prestamo p
JOIN socio s ON p.id_socio = s.id
JOIN libro l ON p.id_libro = l.id;

-- Libros prestados a socios de Barcelona (JOIN)
SELECT
    l.titulo AS titulo_libro,
    p.fecha_prestamo AS fecha_prestamo,
    s.id AS id_socio,
    s.nombre AS nombre_socio
FROM prestamo p
JOIN socio s ON p.id_socio = s.id
JOIN libro l ON p.id_libro = l.id
WHERE s.ciudad = 'Barcelona';

-- Socios que han tomado prestado "Cien años de soledad" (JOIN)
SELECT
    p.id AS id_prestamo,
    p.fecha_prestamo AS fecha_prestamo,
    s.id AS id_socio,
    s.nombre AS nombre_socio,
    l.id AS id_libro,
    l.titulo AS titulo_libro
FROM prestamo p
JOIN socio s ON p.id_socio = s.id
JOIN libro l ON p.id_libro = l.id
WHERE l.titulo = 'Cien años de soledad';

-- Bibliotecarios que han gestionado préstamos (JOIN)
SELECT

-- Préstamos con datos completos (socio, libro, bibliotecario)
SELECT s.*, l.*, p.*
FROM prestamo p
JOIN socio s ON p.id_socio = s.id
JOIN libro l ON p.id_libro = l.id;

-- Socios con sus préstamos activos (JOIN)

-- Libros nunca prestados (LEFT JOIN)

-- Autores con número de libros prestados (JOIN + GROUP BY)
```

```sql
-- 4. Consultas Resumen (8 consultas - 2.4 puntos)

-- Número de socios por ciudad

-- Promedio de antigüedad de bibliotecarios

-- Cantidad de préstamos por mes en 2023

-- Libros más populares (por veces prestados)

-- Socios más activos (por préstamos realizados)

-- Porcentaje de libros disponibles

-- Días promedio de préstamo

-- Número de préstamos por categoría de socio
```

```sql
-- 5. Subconsultas (8 consultas - 1.2 puntos)

-- Socios que han prestado libros de Gabriel García Márquez

-- Libros con préstamos superiores al promedio

-- Socios con todos los préstamos devueltos a tiempo

-- Bibliotecarios que no han gestionado préstamos

-- Socios que han prestado más libros que el promedio

-- Libros disponibles que nunca han sido prestados

-- Socios con préstamos en todas las categorías de libros

-- Bibliotecarios que han gestionado préstamos de todos los socios de Madrid
```

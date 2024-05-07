## Índice

1. [Biblioteca](#biblioteca)
2. [Consultas](#consultas)

## Biblioteca

```sql
CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    fecha_nacimiento DATE,
    UNIQUE (nombre, apellidos, fecha_nacimiento)
);

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    UNIQUE (titulo)
);

CREATE TABLE autores_libros (
    autorid INT,
    libroid INT,
    PRIMARY KEY (autorid, libroid),
    FOREIGN KEY (autorid) REFERENCES autores(id),
    FOREIGN KEY (libroid) REFERENCES libros(id)
);

CREATE TABLE libros_categorias (
    libroid INT,
    categoriaid INT,
    PRIMARY KEY (libroid, categoriaid),
    FOREIGN KEY (libroid) REFERENCES libros(id),
    FOREIGN KEY (categoriaid) REFERENCES categorias(id)
);

CREATE TABLE volumenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libroid INT,
    estado VARCHAR(100),
    fechadeadquisicion DATE,
    FOREIGN KEY (libroid) REFERENCES libros(id)
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    telefono VARCHAR(20),
    UNIQUE (nombre, apellidos, telefono)
);

CREATE TABLE prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    volumenid INT,
    usuarioid INT,
    fechaprestamo DATE,
    fechadevolucion DATE,
    FOREIGN KEY (volumenid) REFERENCES volumenes(id),
    FOREIGN KEY (usuarioid) REFERENCES usuarios(id)
);
```

## Consultas

```sql
-- ¿Cuántos volúmenes están disponibles para préstamos? (su estado pone: disponible)

SELECT
```

```sql
-- Obtener los usuarios (nombre y apellidos) que incluyan en su nombre o su apellido las letras: Ana

SELECT
```

```sql
-- ¿En qué categorías aparece el libro "Cien años de soledad"? (mostrar solo el nombre de las categorías a las que corresponda)

SELECT
```

```sql
-- Obtener los años (sin repeticiones) en los que se han realizado préstamos, ordenados de mayor a menor

SELECT
```

```sql
-- Obtener los préstamos que se hayan realizado en los meses de verano: junio, julio, agosto y septiembre

SELECT
```

```sql
-- Se quiere nombre y apellidos de los usuarios que tienen actualmente prestados libros. Nota: observar que no debe aparecer información repetida. Por ejemplo, si Juan Pérez tiene varios libros en préstamo, se debe evitar que aparezcan varias filas diciendo: Juan Pérez

SELECT
```

```sql
-- Encontrar los títulos (únicamente los títulos) de todos los libros escritos por "Gabriel García Márquez"

SELECT
```

```sql
-- Listar todos los usuarios (nombre y apellidos) a los que les han prestado libros de la categoría "Novela"

SELECT
```

```sql
-- Obtener el id de los volúmenes que no han sido devueltos (la fecha de devolución está a null), el título del libro al que corresponde y el nombre del usuario que los tiene

SELECT
```

```sql
-- Mostrar la cantidad de préstamos por cada categoría (no hace falta mostrar las categorías que no han tenido préstamos)

SELECT
```

```sql
-- Obtener la media de libros por cada categoría y el nombre de la categoría (no preocuparse por si hay categorías que no tienen libros y que por ese motivo no aparezcan en los resultados)

SELECT
```

```sql
-- Encontrar los usuarios (nombre y apellidos) que han recibido más de cuatro préstamos

SELECT
```

```sql
-- Listar autores (nombre y apellidos) que han escrito al menos dos libros, y la cantidad de libros que han escrito

SELECT
```

```sql
-- Mostrar categorías con al menos dos volúmenes disponibles

SELECT
```

```sql
-- Obtener los títulos de los libros de los que no hay volúmenes

SELECT
```

```sql
-- Crear una tabla llamada prestamos_finalizados que se obtenga como el resultado de una consulta que obtenga los préstamos finalizados. Esto es: la fecha de devolución no es null

SELECT
```

```sql
-- En la tabla creada: prestamos_finalizados vamos a hacer un update, donde el usuarioid sea el 1 si la fecha de préstamo es en el año 2023

SELECT
```

```sql
-- Mostrar todos los autores que tenemos registrados y la cantidad de libros que han escrito que tengamos registrados en nuestra base de datos (si no hay ningún libro de ese autor en nuestra base de datos debe aparecer 0 en la cantidad de libros del autor)

SELECT
```

```sql
-- Obtener los títulos de los libros cuyo número de volúmenes supera el promedio de volúmenes por libro en la biblioteca

SELECT
```

```sql
-- Mostrar la fecha de adquisición más reciente entre los libros que no se han prestado nunca

SELECT
```

<link rel="stylesheet" href="./README.css">
<a class="scrollup" href="#top">&#x1F53A</a>
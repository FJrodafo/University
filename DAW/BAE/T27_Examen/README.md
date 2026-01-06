## Examen: Consultas, Índices, Vistas, Funciones, Procedimientos y Triggers en MySQL

Crear el fichero `docker-compose.yml` con el siguiente contenido:

```yml
version: '3.1'
services:
  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: bae
      MYSQL_DATABASE: libreria
    ports:
      - "3306:3306"
    volumes:
      - ./docker-init:/docker-entrypoint-initdb.d

  adminer:
    image: adminer
    restart: always
    ports:
      - 8100:8080
```

Crear el directorio `docker-init` con el archivo `init.sql` con el siguiente contenido:

```sql
DROP DATABASE IF EXISTS Libreria;
CREATE DATABASE Libreria;
USE Libreria;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    nacionalidad VARCHAR(100)
);

CREATE TABLE Libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    genero VARCHAR(100),
    paginas INT,
    precio DECIMAL(6,2),
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES Autores(id)
);

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    ciudad VARCHAR(100)
);

CREATE TABLE Empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT,
    id_cliente INT,
    id_empleado INT,
    fecha DATE,
    FOREIGN KEY (id_libro) REFERENCES Libros(id),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Autores (nombre, nacionalidad) VALUES
    ('Gabriel Garcia Marquez', 'Colombiana'),
    ('J.K. Rowling', 'Britanica'),
    ('Jorge Luis Borges', 'Argentina'),
    ('Miguel de Cervantes', 'Espanola');

INSERT INTO Libros (titulo, genero, paginas, precio, id_autor) VALUES
    ('Cien Anos de Soledad', 'Realismo Magico', 417, 25.50, 1),
    ('Harry Potter y la piedra filosofal', 'Fantasia', 320, 30.00, 2),
    ('Ficciones', 'Filosofia', 250, 22.00, 3),
    ('El Quijote', 'Clasico', 863, 35.00, 4),
    ('Libro sin autor', 'Drama', 200, 18.00, NULL);

INSERT INTO Clientes (nombre, telefono, ciudad) VALUES
    ('Ana Perez', '123456789', 'Madrid'),
    ('Carlos Gomez', '987654321', 'Barcelona'),
    ('Lucia Torres', '456789123', 'Sevilla');

INSERT INTO Empleados (nombre) VALUES
    ('Marta Ruiz'),
    ('Luis Ortega');

INSERT INTO Pedidos (id_libro, id_cliente, id_empleado, fecha) VALUES
    (1, 1, 1, '2023-06-15'),
    (2, 2, 2, '2024-01-10'),
    (3, 1, 2, '2024-03-05'),
    (4, 3, 1, '2022-11-22'),
    (2, 1, 1, '2024-05-12');
```

Ejecuta a continuación el siguiente comando para iniciar la base de datos:

```shell
docker compose up -d
```

Ejecuta a continuación el siguiente comando e introduce la contraseña "bae" para acceder a MySQL desde la terminal:

```shell
docker exec -it t27_examen-db-1 mysql -u root -p
```

Verifica las bases de datos que tienes cargadas con la siguiente sentencia SQL:

```sql
SHOW DATABASES;
```

Seleccionamos la base de datos "Libreria" con la siguiente sentencia SQL:

```sql
USE Libreria;
```

También se puede acceder a través de un navegador. Para ello utilizaremos "Adminer". Una vez que accedas al localhost http://127.0.0.1:8099, Adminer te pedirá los siguientes datos:

```
Sistema: MySQL
Servidor: db
Usuario: bae
Contraseña: bae
```

1. Consultas

    1. Consultas simples

        1. Mostrar todos los libros registrados:

            ```sql
            SELECT *
            FROM Libros;
            ```

            ```
            +----+------------------------------------+-----------------+---------+--------+----------+
            | id | titulo                             | genero          | paginas | precio | id_autor |
            +----+------------------------------------+-----------------+---------+--------+----------+
            |  1 | Cien Anos de Soledad               | Realismo Magico |     417 |  25.50 |        1 |
            |  2 | Harry Potter y la piedra filosofal | Fantasia        |     320 |  30.00 |        2 |
            |  3 | Ficciones                          | Filosofia       |     250 |  22.00 |        3 |
            |  4 | El Quijote                         | Clasico         |     863 |  35.00 |        4 |
            |  5 | Libro sin autor                    | Drama           |     200 |  18.00 |     NULL |
            +----+------------------------------------+-----------------+---------+--------+----------+
            ```

            ```sql
            SELECT
                L.id,
                L.titulo,
                L.genero,
                L.paginas,
                L.precio,
                A.nombre AS autor
            FROM Libros L
            LEFT JOIN Autores A ON L.id_autor = A.id;
            ```

            ```
            +----+------------------------------------+-----------------+---------+--------+------------------------+
            | id | titulo                             | genero          | paginas | precio | autor                  |
            +----+------------------------------------+-----------------+---------+--------+------------------------+
            |  1 | Cien Anos de Soledad               | Realismo Magico |     417 |  25.50 | Gabriel Garcia Marquez |
            |  2 | Harry Potter y la piedra filosofal | Fantasia        |     320 |  30.00 | J.K. Rowling           |
            |  3 | Ficciones                          | Filosofia       |     250 |  22.00 | Jorge Luis Borges      |
            |  4 | El Quijote                         | Clasico         |     863 |  35.00 | Miguel de Cervantes    |
            |  5 | Libro sin autor                    | Drama           |     200 |  18.00 | NULL                   |
            +----+------------------------------------+-----------------+---------+--------+------------------------+
            ```
        2. Listar nombres y nacionalidad de los autores:

            ```sql
            SELECT nombre, nacionalidad
            FROM Autores;
            ```

            ```
            +------------------------+--------------+
            | nombre                 | nacionalidad |
            +------------------------+--------------+
            | Gabriel Garcia Marquez | Colombiana   |
            | J.K. Rowling           | Britanica    |
            | Jorge Luis Borges      | Argentina    |
            | Miguel de Cervantes    | Espanola     |
            +------------------------+--------------+
            ```
        3. Ver todos los pedidos realizados:

            ```sql
            SELECT *
            FROM Pedidos;
            ```

            ```
            +----+----------+------------+-------------+------------+
            | id | id_libro | id_cliente | id_empleado | fecha      |
            +----+----------+------------+-------------+------------+
            |  1 |        1 |          1 |           1 | 2023-06-15 |
            |  2 |        2 |          2 |           2 | 2024-01-10 |
            |  3 |        3 |          1 |           2 | 2024-03-05 |
            |  4 |        4 |          3 |           1 | 2022-11-22 |
            |  5 |        2 |          1 |           1 | 2024-05-12 |
            +----+----------+------------+-------------+------------+
            ```

            ```sql
            SELECT
                P.id AS id_pedido,
                L.titulo AS libro,
                C.nombre AS cliente,
                E.nombre AS empleado,
                P.fecha
            FROM Pedidos P
            JOIN Libros L ON P.id_libro = L.id
            JOIN Clientes C ON P.id_cliente = C.id
            JOIN Empleados E ON P.id_empleado = E.id;
            ```

            ```
            +-----------+------------------------------------+--------------+-------------+------------+
            | id_pedido | libro                              | cliente      | empleado    | fecha      |
            +-----------+------------------------------------+--------------+-------------+------------+
            |         1 | Cien Anos de Soledad               | Ana Perez    | Marta Ruiz  | 2023-06-15 |
            |         2 | Harry Potter y la piedra filosofal | Carlos Gomez | Luis Ortega | 2024-01-10 |
            |         3 | Ficciones                          | Ana Perez    | Luis Ortega | 2024-03-05 |
            |         4 | El Quijote                         | Lucia Torres | Marta Ruiz  | 2022-11-22 |
            |         5 | Harry Potter y la piedra filosofal | Ana Perez    | Marta Ruiz  | 2024-05-12 |
            +-----------+------------------------------------+--------------+-------------+------------+
            ```
        4. Mostrar nombre y teléfono de los clientes:

            ```sql
            SELECT nombre, telefono
            FROM Clientes;
            ```

            ```
            +--------------+-----------+
            | nombre       | telefono  |
            +--------------+-----------+
            | Ana Perez    | 123456789 |
            | Carlos Gomez | 987654321 |
            | Lucia Torres | 456789123 |
            +--------------+-----------+
            ```
        5. Mostrar los libros con su título, género y precio:

            ```sql
            SELECT titulo, genero, precio
            FROM Libros;
            ```

            ```
            +------------------------------------+-----------------+--------+
            | titulo                             | genero          | precio |
            +------------------------------------+-----------------+--------+
            | Cien Anos de Soledad               | Realismo Magico |  25.50 |
            | Harry Potter y la piedra filosofal | Fantasia        |  30.00 |
            | Ficciones                          | Filosofia       |  22.00 |
            | El Quijote                         | Clasico         |  35.00 |
            | Libro sin autor                    | Drama           |  18.00 |
            +------------------------------------+-----------------+--------+
            ```
    2. Consultas `WHERE`

        1. Pedidos realizados por clientes de "Barcelona":

            ```sql
            SELECT P.*
            FROM Pedidos P, Clientes C
            WHERE P.id_cliente = C.id
            AND C.ciudad = 'Barcelona';
            ```

            ```
            +----+----------+------------+-------------+------------+
            | id | id_libro | id_cliente | id_empleado | fecha      |
            +----+----------+------------+-------------+------------+
            |  2 |        2 |          2 |           2 | 2024-01-10 |
            +----+----------+------------+-------------+------------+
            ```

            ```sql
            SELECT
                P.id AS id_pedido,
                L.titulo AS libro,
                C.nombre AS cliente,
                E.nombre AS empleado,
                P.fecha
            FROM Pedidos P, Libros L, Clientes C, Empleados E
            WHERE P.id_libro = L.id
            AND P.id_cliente = C.id
            AND P.id_empleado = E.id
            AND C.ciudad = 'Barcelona';
            ```

            ```
            +-----------+------------------------------------+--------------+-------------+------------+
            | id_pedido | libro                              | cliente      | empleado    | fecha      |
            +-----------+------------------------------------+--------------+-------------+------------+
            |         2 | Harry Potter y la piedra filosofal | Carlos Gomez | Luis Ortega | 2024-01-10 |
            +-----------+------------------------------------+--------------+-------------+------------+
            ```
        2. Libros con precio superior a 30€:

            ```sql
            SELECT *
            FROM Libros
            WHERE precio > 30;
            ```

            ```
            +----+------------+---------+---------+--------+----------+
            | id | titulo     | genero  | paginas | precio | id_autor |
            +----+------------+---------+---------+--------+----------+
            |  4 | El Quijote | Clasico |     863 |  35.00 |        4 |
            +----+------------+---------+---------+--------+----------+
            ```

            ```sql
            SELECT
                L.id,
                L.titulo,
                L.genero,
                L.paginas,
                L.precio,
                A.nombre AS autor
            FROM Libros L, Autores A
            WHERE L.id_autor = A.id
            AND L.precio > 30;
            ```

            ```
            +----+------------+---------+---------+--------+---------------------+
            | id | titulo     | genero  | paginas | precio | autor               |
            +----+------------+---------+---------+--------+---------------------+
            |  4 | El Quijote | Clasico |     863 |  35.00 | Miguel de Cervantes |
            +----+------------+---------+---------+--------+---------------------+
            ```
        3. Pedidos realizados después de 2023:

            ```sql
            SELECT *
            FROM Pedidos
            WHERE fecha > '2023-12-31';
            ```

            ```
            +----+----------+------------+-------------+------------+
            | id | id_libro | id_cliente | id_empleado | fecha      |
            +----+----------+------------+-------------+------------+
            |  2 |        2 |          2 |           2 | 2024-01-10 |
            |  3 |        3 |          1 |           2 | 2024-03-05 |
            |  5 |        2 |          1 |           1 | 2024-05-12 |
            +----+----------+------------+-------------+------------+
            ```

            ```sql
            SELECT
                P.id AS id_pedido,
                L.titulo AS libro,
                C.nombre AS cliente,
                E.nombre AS empleado,
                P.fecha
            FROM Pedidos P, Libros L, Clientes C, Empleados E
            WHERE P.id_libro = L.id
            AND P.id_cliente = C.id
            AND P.id_empleado = E.id
            AND P.fecha > '2023-12-31';
            ```

            ```
            +-----------+------------------------------------+--------------+-------------+------------+
            | id_pedido | libro                              | cliente      | empleado    | fecha      |
            +-----------+------------------------------------+--------------+-------------+------------+
            |         2 | Harry Potter y la piedra filosofal | Carlos Gomez | Luis Ortega | 2024-01-10 |
            |         3 | Ficciones                          | Ana Perez    | Luis Ortega | 2024-03-05 |
            |         5 | Harry Potter y la piedra filosofal | Ana Perez    | Marta Ruiz  | 2024-05-12 |
            +-----------+------------------------------------+--------------+-------------+------------+
            ```
        4. Libros de autores de nacionalidad "Argentina":

            ```sql
            SELECT L.*
            FROM Libros L, Autores A
            WHERE L.id_autor = A.id
            AND A.nacionalidad = 'Argentina';
            ```

            ```
            +----+-----------+-----------+---------+--------+----------+
            | id | titulo    | genero    | paginas | precio | id_autor |
            +----+-----------+-----------+---------+--------+----------+
            |  3 | Ficciones | Filosofia |     250 |  22.00 |        3 |
            +----+-----------+-----------+---------+--------+----------+
            ```

            ```sql
            SELECT
                L.id,
                L.titulo,
                L.genero,
                L.paginas,
                L.precio,
                A.nombre AS autor
            FROM Libros L, Autores A
            WHERE L.id_autor = A.id
            AND A.nacionalidad = 'Argentina';
            ```

            ```
            +----+-----------+-----------+---------+--------+-------------------+
            | id | titulo    | genero    | paginas | precio | autor             |
            +----+-----------+-----------+---------+--------+-------------------+
            |  3 | Ficciones | Filosofia |     250 |  22.00 | Jorge Luis Borges |
            +----+-----------+-----------+---------+--------+-------------------+
            ```
        10. Título de libros junto con el nombre de su autor:

            ```sql
            SELECT
                L.titulo AS titulo_libro,
                A.nombre AS nombre_autor
            FROM Libros L, Autores A
            WHERE L.id_autor = A.id;
            ```

            ```
            +------------------------------------+------------------------+
            | titulo_libro                       | nombre_autor           |
            +------------------------------------+------------------------+
            | Cien Anos de Soledad               | Gabriel Garcia Marquez |
            | Harry Potter y la piedra filosofal | J.K. Rowling           |
            | Ficciones                          | Jorge Luis Borges      |
            | El Quijote                         | Miguel de Cervantes    |
            +------------------------------------+------------------------+
            ```
    3. Consultas `JOIN`

        1. Pedidos realizados por la empleada llamada "Marta Ruiz":

            ```sql
            SELECT P.*
            FROM Pedidos P
            JOIN Empleados E ON P.id_empleado = E.id
            WHERE E.nombre = 'Marta Ruiz';
            ```

            ```
            +----+----------+------------+-------------+------------+
            | id | id_libro | id_cliente | id_empleado | fecha      |
            +----+----------+------------+-------------+------------+
            |  1 |        1 |          1 |           1 | 2023-06-15 |
            |  4 |        4 |          3 |           1 | 2022-11-22 |
            |  5 |        2 |          1 |           1 | 2024-05-12 |
            +----+----------+------------+-------------+------------+
            ```

            ```sql
            SELECT
                P.id AS id_pedido,
                L.titulo AS libro,
                C.nombre AS cliente,
                E.nombre AS empleado,
                P.fecha
            FROM Pedidos P
            JOIN Empleados E ON P.id_empleado = E.id
            JOIN Libros L ON P.id_libro = L.id
            JOIN Clientes C ON P.id_cliente = C.id
            WHERE E.nombre = 'Marta Ruiz';
            ```

            ```
            +-----------+------------------------------------+--------------+------------+------------+
            | id_pedido | libro                              | cliente      | empleado   | fecha      |
            +-----------+------------------------------------+--------------+------------+------------+
            |         1 | Cien Anos de Soledad               | Ana Perez    | Marta Ruiz | 2023-06-15 |
            |         4 | El Quijote                         | Lucia Torres | Marta Ruiz | 2022-11-22 |
            |         5 | Harry Potter y la piedra filosofal | Ana Perez    | Marta Ruiz | 2024-05-12 |
            +-----------+------------------------------------+--------------+------------+------------+
            ```
        2. Clientes que compraron libros de género "Fantasia":

            ```sql
            SELECT C.*
            FROM Clientes C
            JOIN Pedidos P ON C.id = P.id_cliente
            JOIN Libros L ON P.id_libro = L.id
            WHERE L.genero = 'Fantasia';
            ```

            ```
            +----+--------------+-----------+-----------+
            | id | nombre       | telefono  | ciudad    |
            +----+--------------+-----------+-----------+
            |  2 | Carlos Gomez | 987654321 | Barcelona |
            |  1 | Ana Perez    | 123456789 | Madrid    |
            +----+--------------+-----------+-----------+
            ```
        3. Libros que no tienen autor asignado:

            ```sql
            SELECT L.*
            FROM Libros L
            LEFT JOIN Autores A ON L.id_autor = A.id
            WHERE A.id IS NULL;
            ```

            ```
            +----+-----------------+--------+---------+--------+----------+
            | id | titulo          | genero | paginas | precio | id_autor |
            +----+-----------------+--------+---------+--------+----------+
            |  5 | Libro sin autor | Drama  |     200 |  18.00 |     NULL |
            +----+-----------------+--------+---------+--------+----------+
            ```

            ```sql
            SELECT
                L.id,
                L.titulo,
                L.genero,
                L.paginas,
                L.precio,
                A.nombre AS autor
            FROM Libros L
            LEFT JOIN Autores A ON L.id_autor = A.id
            WHERE A.id IS NULL;
            ```

            ```
            +----+-----------------+--------+---------+--------+-------+
            | id | titulo          | genero | paginas | precio | autor |
            +----+-----------------+--------+---------+--------+-------+
            |  5 | Libro sin autor | Drama  |     200 |  18.00 | NULL  |
            +----+-----------------+--------+---------+--------+-------+
            ```
        4. Libros con más de 300 páginas:

            ```sql
            SELECT *
            FROM Libros
            WHERE paginas > 300;
            ```

            ```
            +----+------------------------------------+-----------------+---------+--------+----------+
            | id | titulo                             | genero          | paginas | precio | id_autor |
            +----+------------------------------------+-----------------+---------+--------+----------+
            |  1 | Cien Anos de Soledad               | Realismo Magico |     417 |  25.50 |        1 |
            |  2 | Harry Potter y la piedra filosofal | Fantasia        |     320 |  30.00 |        2 |
            |  4 | El Quijote                         | Clasico         |     863 |  35.00 |        4 |
            +----+------------------------------------+-----------------+---------+--------+----------+
            ```

            ```sql
            SELECT
                L.id,
                L.titulo,
                L.genero,
                L.paginas,
                L.precio,
                A.nombre AS autor
            FROM Libros L
            LEFT JOIN Autores A ON L.id_autor = A.id
            WHERE L.paginas > 300;
            ```

            ```
            +----+------------------------------------+-----------------+---------+--------+------------------------+
            | id | titulo                             | genero          | paginas | precio | autor                  |
            +----+------------------------------------+-----------------+---------+--------+------------------------+
            |  1 | Cien Anos de Soledad               | Realismo Magico |     417 |  25.50 | Gabriel Garcia Marquez |
            |  2 | Harry Potter y la piedra filosofal | Fantasia        |     320 |  30.00 | J.K. Rowling           |
            |  4 | El Quijote                         | Clasico         |     863 |  35.00 | Miguel de Cervantes    |
            +----+------------------------------------+-----------------+---------+--------+------------------------+
            ```
        5. Pedidos realizados por clientes que compraron más de un libro:

            ```sql
            SELECT
                P.id AS id_pedido,
                C.nombre AS cliente,
                L.titulo AS libro,
                E.nombre AS empleado,
                P.fecha
            FROM Pedidos P
            JOIN Clientes C ON P.id_cliente = C.id
            JOIN Libros L ON P.id_libro = L.id
            JOIN Empleados E ON P.id_empleado = E.id
            WHERE P.id_cliente IN (
                SELECT id_cliente
                FROM Pedidos
                GROUP BY id_cliente
                HAVING COUNT(DISTINCT id_libro) > 1
            );
            ```

            ```
            +-----------+-----------+------------------------------------+-------------+------------+
            | id_pedido | cliente   | libro                              | empleado    | fecha      |
            +-----------+-----------+------------------------------------+-------------+------------+
            |         1 | Ana Perez | Cien Anos de Soledad               | Marta Ruiz  | 2023-06-15 |
            |         3 | Ana Perez | Ficciones                          | Luis Ortega | 2024-03-05 |
            |         5 | Ana Perez | Harry Potter y la piedra filosofal | Marta Ruiz  | 2024-05-12 |
            +-----------+-----------+------------------------------------+-------------+------------+
            ```
    4. Subconsultas

        1. Mostrar libros de autores que hayan escrito más de 3 libros:

            ```sql
            SELECT *
            FROM Libros
            WHERE id_autor IN (
                SELECT id_autor
                FROM Libros
                GROUP BY id_autor
                HAVING COUNT(*) > 3
            );
            ```

            ```
            No existe ningún autor que tenga más de 3 L.
            ```
        2. Clientes que compraron el libro llamado "1984":

            ```sql
            SELECT *
            FROM Clientes
            WHERE id IN (
                SELECT id_cliente
                FROM Pedidos
                WHERE id_libro = (
                    SELECT id
                    FROM Libros
                    WHERE titulo = '1984'
                )
            );
            ```

            ```
            No existe ningún libro titulado "1984".
            ```
        3. Libros que hayan sido pedidos al menos una vez:

            ```sql
            SELECT *
            FROM Libros
            WHERE id IN (
                SELECT id_libro
                FROM Pedidos
            );
            ```

            ```
            +----+------------------------------------+-----------------+---------+--------+----------+
            | id | titulo                             | genero          | paginas | precio | id_autor |
            +----+------------------------------------+-----------------+---------+--------+----------+
            |  1 | Cien Anos de Soledad               | Realismo Magico |     417 |  25.50 |        1 |
            |  2 | Harry Potter y la piedra filosofal | Fantasia        |     320 |  30.00 |        2 |
            |  3 | Ficciones                          | Filosofia       |     250 |  22.00 |        3 |
            |  4 | El Quijote                         | Clasico         |     863 |  35.00 |        4 |
            +----+------------------------------------+-----------------+---------+--------+----------+
            ```

            ```sql
            SELECT
                L.id,
                L.titulo,
                L.genero,
                L.paginas,
                L.precio,
                A.nombre AS autor
            FROM Libros L
            JOIN Autores A ON L.id_autor = A.id
            WHERE L.id IN (
                SELECT id_libro
                FROM Pedidos
            );
            ```

            ```
            +----+------------------------------------+-----------------+---------+--------+------------------------+
            | id | titulo                             | genero          | paginas | precio | autor                  |
            +----+------------------------------------+-----------------+---------+--------+------------------------+
            |  1 | Cien Anos de Soledad               | Realismo Magico |     417 |  25.50 | Gabriel Garcia Marquez |
            |  2 | Harry Potter y la piedra filosofal | Fantasia        |     320 |  30.00 | J.K. Rowling           |
            |  3 | Ficciones                          | Filosofia       |     250 |  22.00 | Jorge Luis Borges      |
            |  4 | El Quijote                         | Clasico         |     863 |  35.00 | Miguel de Cervantes    |
            +----+------------------------------------+-----------------+---------+--------+------------------------+
            ```
        4. Pedidos hechos por clientes con más de 2 compras:

            ```sql
            SELECT *
            FROM Pedidos
            WHERE id_cliente IN (
                SELECT id_cliente
                FROM Pedidos
                GROUP BY id_cliente
                HAVING COUNT(*) > 2
            );
            ```

            ```
            +----+----------+------------+-------------+------------+
            | id | id_libro | id_cliente | id_empleado | fecha      |
            +----+----------+------------+-------------+------------+
            |  1 |        1 |          1 |           1 | 2023-06-15 |
            |  3 |        3 |          1 |           2 | 2024-03-05 |
            |  5 |        2 |          1 |           1 | 2024-05-12 |
            +----+----------+------------+-------------+------------+
            ```

            ```sql
            SELECT
                P.id AS id_pedido,
                C.nombre AS cliente,
                L.titulo AS libro,
                E.nombre AS empleado,
                P.fecha
            FROM Pedidos P
            JOIN Clientes C ON P.id_cliente = C.id
            JOIN Libros L ON P.id_libro = L.id
            JOIN Empleados E ON P.id_empleado = E.id
            WHERE P.id_cliente IN (
                SELECT id_cliente
                FROM Pedidos
                GROUP BY id_cliente
                HAVING COUNT(*) > 2
            );
            ```

            ```
            +-----------+-----------+------------------------------------+-------------+------------+
            | id_pedido | cliente   | libro                              | empleado    | fecha      |
            +-----------+-----------+------------------------------------+-------------+------------+
            |         1 | Ana Perez | Cien Anos de Soledad               | Marta Ruiz  | 2023-06-15 |
            |         3 | Ana Perez | Ficciones                          | Luis Ortega | 2024-03-05 |
            |         5 | Ana Perez | Harry Potter y la piedra filosofal | Marta Ruiz  | 2024-05-12 |
            +-----------+-----------+------------------------------------+-------------+------------+
            ```
        5. Autores de libros que nunca han sido vendidos:

            ```sql
            SELECT DISTINCT
                A.nombre AS autor,
                A.nacionalidad
            FROM Autores A
            JOIN Libros L ON A.id = L.id_autor
            WHERE L.id NOT IN (
                SELECT id_libro
                FROM Pedidos
            );
            ```

            ```
            No existen libros que no hayan sido vendidos.
            ```
2. Índices

    1. Crear índice en columna ciudad de clientes:

        ```sql
        CREATE INDEX idx_ciudad ON Clientes(ciudad);
        ```
    2. Crear índice en columna género de libros:

        ```sql
        CREATE INDEX idx_genero ON Libros(genero);
        ```
    3. Ver los índices existentes en ambas tablas:

        ```sql
        SHOW INDEX FROM Clientes;
        ```

        ```
        +----------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
        | Table    | Non_unique | Key_name   | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
        +----------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
        | Clientes |          0 | PRIMARY    |            1 | id          | A         |           3 |     NULL | NULL   |      | BTREE      |         |               |
        | Clientes |          1 | idx_ciudad |            1 | ciudad      | A         |           3 |     NULL | NULL   | YES  | BTREE      |         |               |
        +----------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
        ```

        ```sql
        SHOW INDEX FROM Libros;
        ```

        ```
        +--------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
        | Table  | Non_unique | Key_name   | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
        +--------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
        | Libros |          0 | PRIMARY    |            1 | id          | A         |           5 |     NULL | NULL   |      | BTREE      |         |               |
        | Libros |          1 | id_autor   |            1 | id_autor    | A         |           5 |     NULL | NULL   | YES  | BTREE      |         |               |
        | Libros |          1 | idx_genero |            1 | genero      | A         |           5 |     NULL | NULL   | YES  | BTREE      |         |               |
        +--------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
        ```
    4. Eliminar los índices creados:

        ```sql
        DROP INDEX idx_ciudad ON Clientes;
        ```

        ```sql
        DROP INDEX idx_genero ON Libros;
        ```
3. Vistas

    1. Crear una vista "Vista_pedidos_completos" con: nombre del cliente, título del libro, fecha del pedido y nombre del empleado:

        ```sql
        CREATE VIEW Vista_pedidos_completos AS
        SELECT 
            C.nombre AS nombre_cliente,
            L.titulo AS titulo_libro,
            P.fecha AS fecha_pedido,
            E.nombre AS nombre_empleado
        FROM Pedidos P
        JOIN Clientes C ON P.id_cliente = C.id
        JOIN Libros L ON P.id_libro = L.id
        JOIN Empleados E ON P.id_empleado = E.id;
        ```
    2. Consultar pedidos de libros titulados "El Quijote":

        ```sql
        SELECT *
        FROM Vista_pedidos_completos
        WHERE titulo_libro = 'El Quijote';
        ```

        ```
        +----------------+--------------+--------------+-----------------+
        | nombre_cliente | titulo_libro | fecha_pedido | nombre_empleado |
        +----------------+--------------+--------------+-----------------+
        | Lucia Torres   | El Quijote   | 2022-11-22   | Marta Ruiz      |
        +----------------+--------------+--------------+-----------------+
        ```
    3. Eliminar la vista:

        ```sql
        DROP VIEW Vista_pedidos_completos;
        ```
4. Funciones

    1. Crear función "Numero_pedidos_cliente" que reciba el nombre de un cliente y devuelva la cantidad de pedidos que ha hecho:

        ```sql
        DELIMITER //
        DROP FUNCTION IF EXISTS Numero_pedidos_cliente//
        CREATE FUNCTION Numero_pedidos_cliente(param_nombre_cliente VARCHAR(100))
        RETURNS INT
        DETERMINISTIC
        BEGIN
            DECLARE total_pedidos INT;
            
            SELECT COUNT(*) INTO total_pedidos
            FROM Pedidos P
            JOIN Clientes C ON P.id_cliente = C.id
            WHERE C.nombre = param_nombre_cliente;
            
            RETURN total_pedidos;
        END //
        DELIMITER ;
        ```
    2. Consultar función con la cliente "Ana Pérez":

        ```sql
        SELECT Numero_pedidos_cliente('Ana Perez') AS numero_total_pedidos;
        ```

        ```
        +----------------------+
        | numero_total_pedidos |
        +----------------------+
        |                    3 |
        +----------------------+
        ```
    3. Eliminar la función:

        ```sql
        DROP FUNCTION IF EXISTS Numero_pedidos_cliente;
        ```
5. Procedimientos

    1. Crear procedimiento "Libros_por_nacionalidad" que reciba una nacionalidad y devuelva los libros de autores de esa nacionalidad:

        ```sql
        DELIMITER //
        DROP PROCEDURE IF EXISTS Libros_por_nacionalidad//
        CREATE PROCEDURE Libros_por_nacionalidad(IN param_nacionalidad VARCHAR(100))
        BEGIN
            SELECT
                L.titulo,
                L.genero,
                L.paginas,
                L.precio,
                A.nombre AS autor
            FROM Libros L
            JOIN Autores A ON L.id_autor = A.id
            WHERE A.nacionalidad = param_nacionalidad;
        END //
        DELIMITER ;
        ```
    2. Ejecutar con nacionalidad "Española":

        ```sql
        CALL Libros_por_nacionalidad('Espanola');
        ```

        ```
        +------------+---------+---------+--------+---------------------+
        | titulo     | genero  | paginas | precio | autor               |
        +------------+---------+---------+--------+---------------------+
        | El Quijote | Clasico |     863 |  35.00 | Miguel de Cervantes |
        +------------+---------+---------+--------+---------------------+
        ```
    3. Eliminar el procedimiento:

        ```sql
        DROP PROCEDURE IF EXISTS Libros_por_nacionalidad;
        ```
6. Triggers

    1. Crear tabla "Auditoria_pedidos" para registrar inserciones en pedidos.

        ```sql
        CREATE TABLE Auditoria_pedidos (
            id_pedido INT,
            id_libro INT,
            id_cliente INT,
            id_empleado INT,
            fecha DATE,
            accion VARCHAR(20), -- Para registrar 'INSERT'
            fecha_insercion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
        ```
    2. Crear trigger "After_insert_pedidos" que registre datos en la tabla "Auditoria_pedidos" al insertar datos en la tabla "Pedidos":

        ```sql
        DELIMITER //
        DROP TRIGGER IF EXISTS After_insert_pedidos//
        CREATE TRIGGER After_insert_pedidos
        AFTER INSERT ON Pedidos
        FOR EACH ROW
        BEGIN
            INSERT INTO Auditoria_pedidos (id_pedido, id_libro, id_cliente, id_empleado, fecha, accion)
            VALUES (NEW.id, NEW.id_libro, NEW.id_cliente, NEW.id_empleado, NEW.fecha, 'INSERT');
        END //
        DELIMITER ;
        ```
    3. Insertar un pedido y consultar auditoría:

        ```sql
        INSERT INTO Pedidos (id_libro, id_cliente, id_empleado, fecha) VALUES (4, 2, 2, '2025-06-06');
        ```

        ```sql
        SELECT * FROM Auditoria_pedidos;
        ```

        ```
        +-----------+----------+------------+-------------+------------+--------+---------------------+
        | id_pedido | id_libro | id_cliente | id_empleado | fecha      | accion | fecha_insercion     |
        +-----------+----------+------------+-------------+------------+--------+---------------------+
        |         6 |        4 |          2 |           2 | 2025-06-06 | INSERT | 2025-06-06 12:23:43 |
        +-----------+----------+------------+-------------+------------+--------+---------------------+
        ```
    4. Eliminar trigger y tabla de auditoría.

        ```sql
        DROP TRIGGER IF EXISTS After_insert_pedidos;
        ```

        ```sql
        DROP TABLE IF EXISTS Auditoria_pedidos;
        ```
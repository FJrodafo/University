## Simulacro: Consultas, Índices, Vistas, Funciones y Procedimientos en MySQL

Como analista de datos en una universidad, se te ha encargado la explotación de una base de datos que permita gestionar estudiantes, profesores, cursos y matrículas.

Crear el fichero `docker-compose.yml` con el siguiente contenido:

```yml
services:
  db:
    image: mysql:latest
    container_name: mysql_container
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: bae # Contraseña root personalizada
      MYSQL_DATABASE: bae # Nombre de la base de datos
      MYSQL_USER: bae # Usuario normal
      MYSQL_PASSWORD: bae # Contraseña del usuario normal
    volumes:
      - mysql_universidad_data:/var/lib/mysql
      - ./docker-init:/docker-entrypoint-initdb.d
    ports:
      - "3309:3306" # Puerto externo 3309 -> interno 3306
    networks:
      - db-network

  adminer:
    image: adminer
    container_name: adminer_container
    restart: always
    depends_on:
      - db
    ports:
      - "8099:8080" # Adminer accesible desde el mismo puerto que usaba phpMyAdmin
    networks:
      - db-network

networks:
  db-network:
    driver: bridge

volumes:
  mysql_universidad_data:
    driver: local
```

Crear el directorio `docker-init` con el archivo `init.sql` con el siguiente contenido:

```sql
DROP DATABASE IF EXISTS Universidad;
CREATE DATABASE Universidad;
USE Universidad;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Estudiantes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE Profesores (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    departamento VARCHAR(50)
);

CREATE TABLE Cursos (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    id_profesor INT,
    creditos INT,
    FOREIGN KEY (id_profesor) REFERENCES Profesores(id)
);

CREATE TABLE Matriculas (
    id INT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Estudiantes (id, nombre, email, ciudad) VALUES
    (1, 'María López', 'maria@uni.edu', 'Madrid'),
    (2, 'Juan Pérez', 'juan@uni.edu', 'Barcelona'),
    (3, 'Lucía Fernández', 'lucia@uni.edu', 'Valencia'),
    (4, 'Carlos Ruiz', 'carlos@uni.edu', 'Sevilla');

INSERT INTO Profesores (id, nombre, departamento) VALUES
    (1, 'Dra. Ana Torres', 'Matemáticas'),
    (2, 'Dr. Luis Gómez', 'Informática'),
    (3, 'Dra. Marta Díaz', 'Física');

INSERT INTO Cursos (id, nombre, id_profesor, creditos) VALUES
    (1, 'Álgebra Lineal', 1, 6),
    (2, 'Programación I', 2, 5),
    (3, 'Mecánica Clásica', 3, 6),
    (4, 'Estructuras de Datos', 2, 5),
    (5, 'Cálculo I', 1, 6);

INSERT INTO Matriculas (id, id_estudiante, id_curso, fecha) VALUES
    (1, 1, 1, '2021-09-01'),
    (2, 2, 2, '2022-09-01'),
    (3, 3, 3, '2023-09-02'),
    (4, 4, 4, '2024-09-03'),
    (5, 1, 5, '2020-09-04'),
    (6, 2, 4, '2022-09-05'),
    (7, 3, 1, '2023-09-06'),
    (8, 4, 2, '2024-09-06');
```

Ejecuta a continuación el siguiente comando para iniciar la base de datos:

```shell
docker compose up -d
```

Ejecuta a continuación el siguiente comando e introduce la contraseña "bae" para acceder a MySQL desde la terminal:

```shell
docker exec -it mysql_container mysql -u root -p
```

Verifica las bases de datos que tienes cargadas con la siguiente sentencia SQL:

```sql
SHOW DATABASES;
```

Seleccionamos la base de datos "Universidad" con la siguiente sentencia SQL:

```sql
USE Universidad;
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

        1. Obtener todos los cursos disponibles:

            ```sql
            SELECT *
            FROM Cursos;
            ```
        2. Obtener el nombre de todos los profesores:

            ```sql
            SELECT nombre
            FROM Profesores;
            ```
        3. Obtener todas las matrículas:

            ```sql
            SELECT *
            FROM Matriculas;
            ```
        4. Obtener los nombres y correos de los estudiantes:

            ```sql
            SELECT nombre, email
            FROM Estudiantes;
            ```
        5. Obtener los cursos y su número de créditos:

            ```sql
            SELECT nombre, creditos
            FROM Cursos;
            ```
    2. Consultas `WHERE`

        1. Obtener los cursos impartidos por profesores del departamento de informática:

            ```sql
            SELECT
                C.nombre AS nombre_curso,
                C.creditos,
                P.nombre AS nombre_profesor,
                P.departamento
            FROM Cursos C, Profesores P
            WHERE C.id_profesor = P.id
              AND P.departamento = 'Informática';
            ```
        2. Obtener los estudiantes que viven en Madrid:

            ```sql
            SELECT *
            FROM Estudiantes
            WHERE ciudad = 'Madrid';
            ```
        3. Obtener los cursos con más de 5 créditos:

            ```sql
            SELECT *
            FROM Cursos
            WHERE creditos > 5;
            ```
        4. Obtener las matrículas realizadas después del año 2022:

            ```sql
            SELECT *
            FROM Matriculas
            WHERE fecha > '2022-12-31';
            ```
        5. Obtener los cursos impartidos por la profesora "Dra. Ana Torres":

            ```sql
            SELECT
                C.nombre AS nombre_curso,
                C.creditos,
                P.nombre AS nombre_profesor,
                P.departamento
            FROM Cursos C, Profesores P
            WHERE C.id_profesor = P.id
              AND P.nombre = 'Dra. Ana Torres';
            ```
    3. Consultas `JOIN`

        1. Obtener los cursos impartidos por profesores del departamento de informática:

            ```sql
            SELECT
                C.nombre AS nombre_curso,
                C.creditos,
                P.nombre AS nombre_profesor,
                P.departamento
            FROM Cursos C
            JOIN Profesores P ON C.id_profesor = P.id
            WHERE P.departamento = 'Informática';
            ```
        2. Obtener los estudiantes que viven en Madrid:

            ```sql
            SELECT *
            FROM Estudiantes
            WHERE ciudad = 'Madrid';
            ```
        3. Obtener los cursos con más de 5 créditos:

            ```sql
            SELECT *
            FROM Cursos
            WHERE creditos > 5;
            ```
        4. Obtener las matrículas realizadas después del año 2022:

            ```sql
            SELECT *
            FROM Matriculas
            WHERE fecha > '2022-12-31';
            ```
        5. Obtener los cursos impartidos por la profesora "Dra. Ana Torres":

            ```sql
            SELECT
                C.nombre AS nombre_curso,
                C.creditos,
                P.nombre AS nombre_profesor,
                P.departamento
            FROM Cursos C
            JOIN Profesores P ON C.id_profesor = P.id
            WHERE P.nombre = 'Dra. Ana Torres';
            ```
    4. Subconsultas

        1. Obtener los cursos impartidos por profesores del departamento de informática:

            ```sql
            SELECT *
            FROM Cursos
            WHERE id_profesor IN (
                SELECT id
                FROM Profesores
                WHERE departamento = 'Informática'
            );
            ```
        2. Obtener los estudiantes que viven en Madrid:

            ```sql
            SELECT *
            FROM Estudiantes
            WHERE id IN (
                SELECT id
                FROM Estudiantes
                WHERE ciudad = 'Madrid'
            );
            ```
        3. Obtener los cursos con más de 5 créditos:

            ```sql
            SELECT *
            FROM Cursos WHERE id IN (
                SELECT id
                FROM Cursos
                WHERE creditos > 5
            );
            ```
        4. Obtener las matrículas realizadas después del año 2022:

            ```sql
            SELECT *
            FROM Matriculas
            WHERE id IN (
                SELECT id
                FROM Matriculas
                WHERE fecha > '2022-12-31'
            );
            ```
        5. Obtener los cursos impartidos por la profesora "Dra. Ana Torres":

            ```sql
            SELECT *
            FROM Cursos
            WHERE id_profesor = (
                SELECT id
                FROM Profesores
                WHERE nombre = 'Dra. Ana Torres'
            );
            ```
2. Índices

    1. Crear un índice en la columna "ciudad" de la tabla "Estudiantes":

        ```sql
        CREATE INDEX idx_ciudad ON Estudiantes(ciudad);
        ```
    2. Crear un índice en la columna "departamento" de la tabla "Profesores":

        ```sql
        CREATE INDEX idx_departamento ON Profesores(departamento);
        ```
    3. Obtener los índices creados:

        ```sql
        SHOW INDEX FROM Estudiantes;
        ```

        ```sql
        SHOW INDEX FROM Profesores;
        ```
    4. Eliminar los índices creados:

        ```sql
        DROP INDEX idx_ciudad ON Estudiantes;
        ```

        ```sql
        DROP INDEX idx_departamento ON Profesores;
        ```
3. Vistas

    1. Crear una vista llamada "vista_matriculas_completas" que muestre el nombre, curso y fecha de la matrícula de cada estudiante:

        ```sql
        CREATE VIEW vista_matriculas_completas AS
        SELECT
            E.nombre AS nombre_estudiante,
            C.nombre AS nombre_curso,
            M.fecha AS fecha_matricula
        FROM Matriculas M
        JOIN Estudiantes E ON M.id_estudiante = E.id
        JOIN Cursos C ON M.id_curso = C.id;

        ```
    2. Obtener datos desde la vista mostrando el nombre y la fecha de la matrícula de cada estudiante:

        ```sql
        SELECT
            nombre_estudiante,
            fecha_matricula
        FROM vista_matriculas_completas;
        ```
    3. Eliminar la vista:

        ```sql
        DROP VIEW IF EXISTS vista_matriculas_completas;
        ```
4. Funciones

    1. Crear una función llamada "total_creditos_estudiante" que reciba el ID de un estudiante y devuelva el total de créditos que ha matriculado:

        ```sql
        DELIMITER //
        DROP FUNCTION IF EXISTS total_creditos_estudiante//
        CREATE FUNCTION total_creditos_estudiante(param_id_estudiante INT)
        RETURNS INT
        DETERMINISTIC
        BEGIN
            DECLARE total INT;
        
            SELECT SUM(C.creditos) INTO total
            FROM Matriculas M
            JOIN Cursos C ON M.id_curso = C.id
            WHERE M.id_estudiante = param_id_estudiante;
        
            RETURN IFNULL(total, 0);
        END//
        DELIMITER ;
        ```
    2. Ejecutar la función para un estudiante específico:

        ```sql
        SELECT total_creditos_estudiante(1) AS creditos_totales;
        ```
    3. Eliminar la función:

        ```sql
        DROP FUNCTION IF EXISTS total_creditos_estudiante;
        ```
5. Procedimientos

    1. Crear un procedimiento llamado "cursos_por_profesor" que reciba el nombre del profesor como parámetro y devuelva los cursos que imparte y su número de créditos:

        ```sql
        DELIMITER //
        DROP PROCEDURE IF EXISTS cursos_por_profesor//
        CREATE PROCEDURE cursos_por_profesor(IN param_nombre_profesor VARCHAR(100))
        BEGIN
            SELECT
                C.nombre AS nombre_curso,
                C.creditos
            FROM Cursos C
            JOIN Profesores P ON C.id_profesor = P.id
            WHERE P.nombre = param_nombre_profesor;
        END//
        DELIMITER ;
        ```
    2. Ejecutar el procedimiento con el nombre "Dr. Luis Gómez":

        ```sql
        CALL cursos_por_profesor('Dr. Luis Gómez');
        ```
    3. Eliminar el procedimiento:

        ```sql
        DROP PROCEDURE IF EXISTS cursos_por_profesor;
        ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
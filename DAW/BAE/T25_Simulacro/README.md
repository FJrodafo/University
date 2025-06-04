## Simulacro: Consultas, Índices, Vistas, Funciones, Procedimientos y Triggers en MySQL

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

```txt
Sistema: MySQL
Servidor: db
Usuario: bae
Contraseña: bae
```

1. Consultas

    1. Obtener el contenido de la tabla "Estudiantes":

        ```sql
        SELECT *
        FROM Estudiantes;
        ```
    2. Obtener el contenido de la tabla "Profesores":

        ```sql
        SELECT *
        FROM Profesores;
        ```
    3. Obtener el contenido de la tabla "Cursos":

        ```sql
        SELECT *
        FROM Cursos;
        ```
    4. Obtener el contenido de la tabla "Matriculas":

        ```sql
        SELECT *
        FROM Matriculas;
        ```
    5. Obtener cada estudiante con la cantidad de cursos en los que está matriculado:

        ```sql
        SELECT
            E.nombre AS nombre_estudiante,
            COUNT(M.id_curso) AS cantidad_cursos
        FROM Matriculas M
        JOIN Estudiantes E ON M.id_estudiante = E.id
        GROUP BY E.id, E.nombre;
        ```
    6. Obtener cada estudiante con el total de créditos acumulados:

        ```sql
        SELECT
            E.nombre AS nombre_estudiante,
            IFNULL(SUM(C.creditos), 0) AS total_creditos
        FROM Matriculas M
        JOIN Estudiantes E ON M.id_estudiante = E.id
        JOIN Cursos C ON M.id_curso = C.id
        GROUP BY E.id, E.nombre;
        ```
    7. Obtener los cursos con la cantidad de estudiantes matriculados ordenados de mayor a menor:

        ```sql
        SELECT
            C.nombre AS nombre_curso,
            COUNT(M.id_estudiante) AS cantidad_estudiantes_matriculados
        FROM Matriculas M
        JOIN Cursos C ON M.id_curso = C.id
        GROUP BY C.id, C.nombre
        ORDER BY cantidad_estudiantes_matriculados DESC;
        ```
    8. Obtener la media de créditos por curso:

        ```sql
        SELECT AVG(creditos) AS media_creditos
        FROM Cursos;
        ```
    9. Obtener los cursos que no tienen estudiantes matriculados:

        ```sql
        SELECT C.*
        FROM Matriculas M
        JOIN Cursos C ON M.id_curso = C.id
        WHERE M.id IS NULL;
        ```
    10. Obtener el nombre del profesor y cuántos cursos imparte:

        ```sql
        SELECT
            P.nombre AS nombre_profesor,
            COUNT(C.id) AS cantidad_cursos
        FROM Cursos C
        JOIN Profesores P ON C.id_profesor = P.id
        GROUP BY P.id, P.nombre;
        ```
    11. Obtener los profesores que no imparten ningún curso:

        ```sql
        SELECT P.*
        FROM Cursos C
        JOIN Profesores P ON C.id_profesor = P.id
        WHERE C.id IS NULL;
        ```
    12. Obtener la ciudad con mayor número de estudiantes registrados:

        ```sql
        SELECT
            ciudad,
            COUNT(*) AS cantidad_estudiantes_registrados
        FROM Estudiantes
        GROUP BY ciudad
        ORDER BY cantidad_estudiantes_registrados DESC
        LIMIT 1;
        ```
    13. Obtener los estudiantes matriculados en más de 1 curso:

        ```sql
        SELECT
            E.nombre AS nombre_estudiante,
            COUNT(M.id_curso) AS cantidad_cursos
        FROM Matriculas M
        JOIN Estudiantes E ON M.id_estudiante = E.id
        GROUP BY E.id, E.nombre
        HAVING COUNT(M.id_curso) > 1;
        ```
    14. Obtener los cursos junto a su clasificación según créditos (6 créditos o más: "Carga alta", menos de 6 créditos: "Carga baja"):

        ```sql
        SELECT
            nombre AS nombre_curso,
            creditos,
            CASE
                WHEN creditos >= 6 THEN 'Carga alta'
                ELSE 'Carga baja'
            END AS clasificacion_creditos
        FROM Cursos;
        ```
    15. Obtener los estudiantes y clasificar su carga académica (12 créditos o más: "Carga alta", entre 6 y 12 créditos: "Carga media", menos de 6 créditos: "Carga baja"):

        ```sql
        SELECT
            E.nombre AS nombre_estudiante,
            IFNULL(SUM(C.creditos), 0) AS total_creditos,
            CASE
                WHEN IFNULL(SUM(C.creditos), 0) >= 12 THEN 'Carga alta'
                WHEN IFNULL(SUM(C.creditos), 0) BETWEEN 6 AND 12 THEN 'Carga media'
                ELSE 'Carga baja'
            END AS clasificacion_creditos
        FROM Matriculas M
        JOIN Estudiantes E ON M.id_estudiante = E.id
        JOIN Cursos C ON M.id_curso = C.id
        GROUP BY E.id, E.nombre;
        ```
    16. Obtener los cursos en los que se haya matriculado al menos un estudiante de Sevilla:

        ```sql
        SELECT DISTINCT
            C.nombre AS nombre_curso
        FROM Matriculas M
        JOIN Cursos C ON M.id_curso = C.id
        JOIN Estudiantes E ON M.id_estudiante = E.id
        WHERE E.ciudad = 'Sevilla';
        ```
    17. Obtener los cursos impartidos por profesores del departamento de matemáticas:

        ```sql
        SELECT
            C.nombre AS nombre_curso,
            C.creditos
        FROM Cursos C
        JOIN Profesores P ON C.id_profesor = P.id
        WHERE P.departamento = 'Matemáticas';
        ```
    18. Obtener los cursos en los que se haya matriculado algún estudiante antes del año 2022:

        ```sql
        SELECT DISTINCT
            C.nombre AS nombre_curso,
            C.creditos
        FROM Matriculas M
        JOIN Cursos C ON M.id_curso = C.id
        WHERE M.fecha < '2022-01-01';
        ```
    19. Obtener los estudiantes que han cursado materias impartidas por el profesor "Dr. Luis Gómez":

        ```sql
        SELECT DISTINCT
            E.nombre AS nombre_estudiante,
            E.email,
            E.ciudad
        FROM Matriculas M
        JOIN Estudiantes E ON M.id_estudiante = E.id
        JOIN Cursos C ON M.id_curso = C.id
        JOIN Profesores P ON C.id_profesor = P.id
        WHERE P.nombre = 'Dr. Luis Gómez';
        ```
    20. Mostrar los cursos más recientes (última matrícula por curso):

        ```sql
        SELECT
            C.nombre AS nombre_curso,
            MAX(M.fecha) AS fecha_ultima_matricula
        FROM Matriculas M
        JOIN Cursos C ON M.id_curso = C.id
        GROUP BY C.id, C.nombre
        ORDER BY fecha_ultima_matricula DESC;
        ```
2. Índices

    1. Crear un índice en la columna "fecha" de la tabla "Matriculas":

        ```sql
        
        ```
    2. Crear un índice compuesto en la tabla "Matriculas" sobre "id_estudiante" e "id_curso":

        ```sql
        
        ```
    3. Consultar los índices de la tabla "Matriculas":

        ```sql
        
        ```
    4. Eliminar ambos índices:

        ```sql
        
        ```
3. Vistas

    1. Crear una vista llamada "resumen_matriculas" que muestra el nombre del estudiante, nombre del curso, nombre del profesor y la fecha de matrícula:

        ```sql
        
        ```
    2. Consultar los datos desde la vista mostrando el nombre del estudiante y el curso:

        ```sql
        
        ```
    3. Eliminar la vista:

        ```sql
        
        ```
4. Funciones

    1. Crear una función llamada "promedio_creditos_por_anio" que reciba un año como parámetro y devuelva el promedio de créditos matriculados por estudiante ese año. Ejecuta la función para el año 2023. Para finalizar elimina la función:

        ```sql
        
        ```
5. Procedimientos

    1. Crear un procedimiento llamado "matricular_estudiante" que reciba el ID del estudiante, el ID del curso y la fecha de matriculación. Además el procedimiento debe verificar que el estudiante ya no esté matriculado en ese curso, si no lo está, agregarlo en la tabla "Matriculas", si ya lo está, lanzar un error. Ejecutar el procedimiento para matricular al estudiante con ID 1 en el curso con ID 2. Para finalizar elimina el procedimiento:

        ```sql
        
        ```
6. Triggers

    1. Crear una tabla llamada "Auditoria_matriculas" que registre el tipo de operación (INSERT), ID del estudiante, ID del curso, fecha y hora de la operación y usuario que realizó la acción:

        ```sql
        
        ```
    2. Crear un trigger que inserte un registro en la tabla "Auditoria_matriculas" al insertar un registro "AFTER INSERT" en la tabla "Matriculas":

        ```sql
        
        ```
    3. Consultar los registros de la auditoría:

        ```sql
        
        ```
    4. Eliminar el trigger y la tabla de auditoría:

        ```sql
        
        ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
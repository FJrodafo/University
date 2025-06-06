## Examen: Consultas, Índices, Vistas, Funciones, Procedimientos y Triggers en MySQL

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
DROP DATABASE IF EXISTS Clinica;
CREATE DATABASE Clinica;
USE Clinica;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    ciudad VARCHAR(50)
);

CREATE TABLE Veterinarios (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(50)
);

CREATE TABLE Mascotas (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    especie VARCHAR(30),
    raza VARCHAR(50),
    edad INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
);

CREATE TABLE Visitas (
    id INT PRIMARY KEY,
    id_mascota INT,
    id_veterinario INT,
    fecha DATE,
    motivo VARCHAR(200),
    FOREIGN KEY (id_mascota) REFERENCES Mascotas(id),
    FOREIGN KEY (id_veterinario) REFERENCES Veterinarios(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Clientes (id, nombre, telefono, ciudad) VALUES
    (1, 'Ana Martin', '600123456', 'Madrid'),
    (2, 'Pedro Lopez', '611987654', 'Barcelona'),
    (3, 'Laura Sanchez', '622456789', 'Valencia'),
    (4, 'Sergio Ruiz', '633111222', 'Sevilla');

INSERT INTO Veterinarios (id, nombre, especialidad) VALUES
    (1, 'Dr. Pablo Torres', 'Dermatologia'),
    (2, 'Dra. Elena Gomez', 'Cirugia'),
    (3, 'Dr. Manuel Diaz', 'Medicina General');


INSERT INTO Mascotas (id, nombre, especie, raza, edad, id_cliente) VALUES
    (1, 'Luna', 'Perro', 'Labrador', 5, 1),
    (2, 'Milo', 'Gato', 'Siames', 3, 2),
    (3, 'Rocky', 'Perro', 'Bulldog', 7, 3),
    (4, 'Kiwi', 'Ave', 'Periquito', 2, 4);

INSERT INTO Visitas (id, id_mascota, id_veterinario, fecha, motivo) VALUES
    (1, 1, 3, '2023-05-01', 'Chequeo general'),
    (2, 2, 1, '2023-06-10', 'Perdida de pelo'),
    (3, 3, 2, '2023-07-15', 'Extraccion de diente'),
    (4, 4, 3, '2023-08-05', 'Revision anual'),
    (5, 1, 1, '2024-01-10', 'Alergia cutanea'),
    (6, 2, 3, '2024-02-20', 'Vacunacion'),
    (7, 3, 2, '2024-03-18', 'Cirugia hernia'),
    (8, 4, 1, '2024-04-12', 'Problemas en plumas');
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

Seleccionamos la base de datos "Clinica" con la siguiente sentencia SQL:

```sql
USE Clinica;
```

También se puede acceder a través de un navegador. Para ello utilizaremos "Adminer". Una vez que accedas al localhost http://127.0.0.1:8099, Adminer te pedirá los siguientes datos:

```txt
Sistema: MySQL
Servidor: db
Usuario: bae
Contraseña: bae
```

1. Consultas

    1. Consultas simples

        1. Mostrar todas las mascotas registradas:

            ```sql
            SELECT *
            FROM Mascotas;
            ```

            ```txt
            +----+--------+---------+-----------+------+------------+
            | id | nombre | especie | raza      | edad | id_cliente |
            +----+--------+---------+-----------+------+------------+
            |  1 | Luna   | Perro   | Labrador  |    5 |          1 |
            |  2 | Milo   | Gato    | Siames    |    3 |          2 |
            |  3 | Rocky  | Perro   | Bulldog   |    7 |          3 |
            |  4 | Kiwi   | Ave     | Periquito |    2 |          4 |
            +----+--------+---------+-----------+------+------------+
            ```
        2. Ver los nombres y especialidades de los veterinarios:

            ```sql
            SELECT nombre, especialidad
            FROM Veterinarios;
            ```

            ```txt
            +------------------+------------------+
            | nombre           | especialidad     |
            +------------------+------------------+
            | Dr. Pablo Torres | Dermatologia     |
            | Dra. Elena Gomez | Cirugia          |
            | Dr. Manuel Diaz  | Medicina General |
            +------------------+------------------+
            ```
        3. Listar todas las visitas:

            ```sql
            SELECT *
            FROM Visitas;
            ```

            ```txt
            +----+------------+----------------+------------+----------------------+
            | id | id_mascota | id_veterinario | fecha      | motivo               |
            +----+------------+----------------+------------+----------------------+
            |  1 |          1 |              3 | 2023-05-01 | Chequeo general      |
            |  2 |          2 |              1 | 2023-06-10 | Perdida de pelo      |
            |  3 |          3 |              2 | 2023-07-15 | Extraccion de diente |
            |  4 |          4 |              3 | 2023-08-05 | Revision anual       |
            |  5 |          1 |              1 | 2024-01-10 | Alergia cutanea      |
            |  6 |          2 |              3 | 2024-02-20 | Vacunacion           |
            |  7 |          3 |              2 | 2024-03-18 | Cirugia hernia       |
            |  8 |          4 |              1 | 2024-04-12 | Problemas en plumas  |
            +----+------------+----------------+------------+----------------------+
            ```
        4. Ver el nombre y teléfono de los clientes:

            ```sql
            SELECT nombre, telefono
            FROM Clientes;
            ```

            ```txt
            +---------------+-----------+
            | nombre        | telefono  |
            +---------------+-----------+
            | Ana Martin    | 600123456 |
            | Pedro Lopez   | 611987654 |
            | Laura Sanchez | 622456789 |
            | Sergio Ruiz   | 633111222 |
            +---------------+-----------+
            ```
        5. Ver las mascotas con su especie y edad:

            ```sql
            SELECT nombre, especie, edad
            FROM Mascotas;
            ```

            ```txt
            +--------+---------+------+
            | nombre | especie | edad |
            +--------+---------+------+
            | Luna   | Perro   |    5 |
            | Milo   | Gato    |    3 |
            | Rocky  | Perro   |    7 |
            | Kiwi   | Ave     |    2 |
            +--------+---------+------+
            ```
    2. Consultas `WHERE`

        1. Visitas realizadas por veterinarios especializados en "Cirugia":

            ```sql
            SELECT
                Vi.id,
                M.nombre AS nombre_mascota,
                Vet.nombre AS nombre_veterinario,
                Vi.fecha,
                Vi.motivo
            FROM Visitas Vi, Mascotas M, Veterinarios Vet
            WHERE Vi.id_mascota = M.id
            AND Vi.id_veterinario = Vet.id
            AND Vet.especialidad = 'Cirugia';
            ```

            ```txt
            +----+----------------+--------------------+------------+----------------------+
            | id | nombre_mascota | nombre_veterinario | fecha      | motivo               |
            +----+----------------+--------------------+------------+----------------------+
            |  3 | Rocky          | Dra. Elena Gomez   | 2023-07-15 | Extraccion de diente |
            |  7 | Rocky          | Dra. Elena Gomez   | 2024-03-18 | Cirugia hernia       |
            +----+----------------+--------------------+------------+----------------------+
            ```
        2. Mascotas cuya edad sea mayor de 5 años:

            ```sql
            SELECT
                M.id,
                M.nombre AS nombre_mascota,
                M.especie,
                M.raza,
                M.edad,
                C.nombre AS nombre_cliente
            FROM Mascotas M, Clientes C
            WHERE M.id_cliente = C.id
            AND M.edad > 5;
            ```

            ```txt
            +----+----------------+---------+---------+------+----------------+
            | id | nombre_mascota | especie | raza    | edad | nombre_cliente |
            +----+----------------+---------+---------+------+----------------+
            |  3 | Rocky          | Perro   | Bulldog |    7 | Laura Sanchez  |
            +----+----------------+---------+---------+------+----------------+
            ```
        3. Visitas después del año 2023:

            ```sql
            SELECT
                Vi.id,
                M.nombre AS nombre_mascota,
                Vet.nombre AS nombre_veterinario,
                Vi.fecha,
                Vi.motivo
            FROM Visitas Vi, Mascotas M, Veterinarios Vet
            WHERE Vi.id_mascota = M.id
            AND Vi.id_veterinario = Vet.id
            AND Vi.fecha > '2023-12-31';
            ```

            ```txt
            +----+----------------+--------------------+------------+---------------------+
            | id | nombre_mascota | nombre_veterinario | fecha      | motivo              |
            +----+----------------+--------------------+------------+---------------------+
            |  5 | Luna           | Dr. Pablo Torres   | 2024-01-10 | Alergia cutanea     |
            |  6 | Milo           | Dr. Manuel Diaz    | 2024-02-20 | Vacunacion          |
            |  7 | Rocky          | Dra. Elena Gomez   | 2024-03-18 | Cirugia hernia      |
            |  8 | Kiwi           | Dr. Pablo Torres   | 2024-04-12 | Problemas en plumas |
            +----+----------------+--------------------+------------+---------------------+
            ```
        4. Mascotas de clientes de "Madrid":

            ```sql
            SELECT
                M.nombre AS nombre_mascota,
                C.nombre AS nombre_cliente,
                C.ciudad
            FROM Mascotas M, Clientes C
            WHERE M.id_cliente = C.id
            AND C.ciudad = 'Madrid';
            ```

            ```txt
            +----------------+----------------+--------+
            | nombre_mascota | nombre_cliente | ciudad |
            +----------------+----------------+--------+
            | Luna           | Ana Martin     | Madrid |
            +----------------+----------------+--------+
            ```
        5. Nombre de las mascotas con el nombre de sus dueños:

            ```sql
            SELECT
                M.nombre AS nombre_mascota,
                C.nombre AS nombre_duenio
            FROM Mascotas M, Clientes C
            WHERE M.id_cliente = C.id;
            ```

            ```txt
            +----------------+---------------+
            | nombre_mascota | nombre_duenio |
            +----------------+---------------+
            | Luna           | Ana Martin    |
            | Milo           | Pedro Lopez   |
            | Rocky          | Laura Sanchez |
            | Kiwi           | Sergio Ruiz   |
            +----------------+---------------+
            ```
    3. Consultas `JOIN`

        1. Visitas realizadas por veterinarios especializados en "Cirugia":

            ```sql
            SELECT
                Vi.id,
                M.nombre AS nombre_mascota,
                Vet.nombre AS nombre_veterinario,
                Vi.fecha,
                Vi.motivo
            FROM Visitas Vi
            JOIN Mascotas M ON Vi.id_mascota = M.id
            JOIN Veterinarios Vet ON Vi.id_veterinario = Vet.id
            WHERE Vet.especialidad = 'Cirugia';
            ```

            ```txt
            +----+----------------+--------------------+------------+----------------------+
            | id | nombre_mascota | nombre_veterinario | fecha      | motivo               |
            +----+----------------+--------------------+------------+----------------------+
            |  3 | Rocky          | Dra. Elena Gomez   | 2023-07-15 | Extraccion de diente |
            |  7 | Rocky          | Dra. Elena Gomez   | 2024-03-18 | Cirugia hernia       |
            +----+----------------+--------------------+------------+----------------------+
            ```
        2. Mascotas cuya edad sea mayor de 5 años:

            ```sql
            SELECT
                M.id,
                M.nombre AS nombre_mascota,
                M.especie,
                M.raza,
                M.edad,
                C.nombre AS nombre_cliente
            FROM Mascotas M
            JOIN Clientes C ON M.id_cliente = C.id
            WHERE M.edad > 5;
            ```

            ```txt
            +----+----------------+---------+---------+------+----------------+
            | id | nombre_mascota | especie | raza    | edad | nombre_cliente |
            +----+----------------+---------+---------+------+----------------+
            |  3 | Rocky          | Perro   | Bulldog |    7 | Laura Sanchez  |
            +----+----------------+---------+---------+------+----------------+
            ```
        3. Visitas después del año 2023:

            ```sql
            SELECT
                Vi.id,
                M.nombre AS nombre_mascota,
                Vet.nombre AS nombre_veterinario,
                Vi.fecha,
                Vi.motivo
            FROM Visitas Vi
            JOIN Mascotas M ON Vi.id_mascota = M.id
            JOIN Veterinarios Vet ON Vi.id_veterinario = Vet.id
            WHERE Vi.fecha > '2023-12-31';
            ```

            ```txt
            +----+----------------+--------------------+------------+---------------------+
            | id | nombre_mascota | nombre_veterinario | fecha      | motivo              |
            +----+----------------+--------------------+------------+---------------------+
            |  5 | Luna           | Dr. Pablo Torres   | 2024-01-10 | Alergia cutanea     |
            |  6 | Milo           | Dr. Manuel Diaz    | 2024-02-20 | Vacunacion          |
            |  7 | Rocky          | Dra. Elena Gomez   | 2024-03-18 | Cirugia hernia      |
            |  8 | Kiwi           | Dr. Pablo Torres   | 2024-04-12 | Problemas en plumas |
            +----+----------------+--------------------+------------+---------------------+
            ```
        4. Mascotas de clientes de "Madrid":

            ```sql
            SELECT
                M.nombre AS nombre_mascota,
                C.nombre AS nombre_cliente,
                C.ciudad
            FROM Mascotas M
            JOIN Clientes C ON M.id_cliente = C.id
            WHERE C.ciudad = 'Madrid';
            ```

            ```txt
            +----------------+----------------+--------+
            | nombre_mascota | nombre_cliente | ciudad |
            +----------------+----------------+--------+
            | Luna           | Ana Martin     | Madrid |
            +----------------+----------------+--------+
            ```
        5. Mascotas atendidas por el "Dr. Pablo Torres":

            ```sql
            SELECT
                Vi.id,
                M.nombre AS nombre_mascota,
                Vet.nombre AS nombre_veterinario,
                Vi.fecha,
                Vi.motivo
            FROM Visitas Vi
            JOIN Mascotas M ON Vi.id_mascota = M.id
            JOIN Veterinarios Vet ON Vi.id_veterinario = Vet.id
            WHERE Vet.nombre = 'Dr. Pablo Torres';
            ```

            ```txt
            +----+----------------+--------------------+------------+---------------------+
            | id | nombre_mascota | nombre_veterinario | fecha      | motivo              |
            +----+----------------+--------------------+------------+---------------------+
            |  2 | Milo           | Dr. Pablo Torres   | 2023-06-10 | Perdida de pelo     |
            |  5 | Luna           | Dr. Pablo Torres   | 2024-01-10 | Alergia cutanea     |
            |  8 | Kiwi           | Dr. Pablo Torres   | 2024-04-12 | Problemas en plumas |
            +----+----------------+--------------------+------------+---------------------+
            ```
    4. Subconsultas

        1. Mascotas atendidas por veterinarios de "Dermatologia":

            ```sql
            SELECT nombre
            FROM Mascotas
            WHERE id IN (
                SELECT id_mascota
                FROM Visitas
                WHERE id_veterinario IN (
                    SELECT id
                    FROM Veterinarios
                    WHERE especialidad = 'Dermatologia'
                )
            );
            ```

            ```txt
            +--------+
            | nombre |
            +--------+
            | Milo   |
            | Luna   |
            | Kiwi   |
            +--------+
            ```
        2. Clientes con mascotas llamadas "Milo":

            ```sql
            SELECT nombre
            FROM Clientes
            WHERE id IN (
                SELECT id_cliente
                FROM Mascotas
                WHERE nombre = 'Milo'
            );
            ```

            ```txt
            +-------------+
            | nombre      |
            +-------------+
            | Pedro Lopez |
            +-------------+
            ```
        3. Mascotas que hayan tenido al menos una visita:

            ```sql
            SELECT nombre
            FROM Mascotas
            WHERE id IN (
                SELECT id_mascota
                FROM Visitas
            );
            ```

            ```txt
            +--------+
            | nombre |
            +--------+
            | Luna   |
            | Milo   |
            | Rocky  |
            | Kiwi   |
            +--------+
            ```
        4. Visitas de mascotas con más de 6 años:

            ```sql
            SELECT *
            FROM Visitas
            WHERE id_mascota IN (
                SELECT id
                FROM Mascotas
                WHERE edad > 6
            );
            ```

            ```txt
            +----+------------+----------------+------------+----------------------+
            | id | id_mascota | id_veterinario | fecha      | motivo               |
            +----+------------+----------------+------------+----------------------+
            |  3 |          3 |              2 | 2023-07-15 | Extraccion de diente |
            |  7 |          3 |              2 | 2024-03-18 | Cirugia hernia       |
            +----+------------+----------------+------------+----------------------+
            ```
        5. Veterinarios que han atendido mascotas de especie "Perro":

            ```sql
            SELECT nombre
            FROM Veterinarios
            WHERE id IN (
                SELECT id_veterinario
                FROM Visitas
                WHERE id_mascota IN (
                    SELECT id
                    FROM Mascotas
                    WHERE especie = 'Perro'
                )
            );
            ```

            ```txt
            +------------------+
            | nombre           |
            +------------------+
            | Dr. Manuel Diaz  |
            | Dra. Elena Gomez |
            | Dr. Pablo Torres |
            +------------------+
            ```
2. Índices

    1. Crear un índice en la columna ciudad de la tabla clientes:

        ```sql
        CREATE INDEX idx_ciudad ON Clientes(ciudad);
        ```
    2. Crear un índice en la columna especialidad de veterinarios:

        ```sql
        CREATE INDEX idx_especialidad ON Veterinarios(especialidad);
        ```
    3. Ver los índices existentes en ambas tablas:

        ```sql
        SHOW INDEX FROM Clientes;
        ```

        ```txt
        +----------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        | Table    | Non_unique | Key_name   | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
        +----------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        | Clientes |          0 | PRIMARY    |            1 | id          | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
        | Clientes |          1 | idx_ciudad |            1 | ciudad      | A         |           4 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
        +----------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        ```

        ```sql
        SHOW INDEX FROM Veterinarios;
        ```

        ```txt
        +--------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        | Table        | Non_unique | Key_name         | Seq_in_index | Column_name  | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
        +--------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        | Veterinarios |          0 | PRIMARY          |            1 | id           | A         |           3 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
        | Veterinarios |          1 | idx_especialidad |            1 | especialidad | A         |           3 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
        +--------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        ```
    4. Eliminar ambos índices:

        ```sql
        DROP INDEX idx_ciudad ON Clientes;
        ```

        ```sql
        DROP INDEX idx_especialidad ON Veterinarios;
        ```
3. Vistas

    1. Crear una vista llamada Vista_visitas_completas con: nombre de la mascota, cliente, veterinario, fecha y motivo:

        ```sql
        CREATE VIEW Vista_visitas_completas AS
        SELECT
            M.nombre AS nombre_mascota,
            C.nombre AS nombre_cliente,
            Vet.nombre AS nombre_veterinario,
            Vi.fecha,
            Vi.motivo
        FROM Visitas Vi
        JOIN Mascotas M ON Vi.id_mascota = M.id
        JOIN Clientes C ON M.id_cliente = C.id
        JOIN Veterinarios Vet ON Vi.id_veterinario = Vet.id;
        ```
    2. Consultar visitas de mascotas llamadas "Rocky":

        ```sql
        SELECT *
        FROM Vista_visitas_completas
        WHERE nombre_mascota = 'Rocky';
        ```

        ```txt
        +----------------+----------------+--------------------+------------+----------------------+
        | nombre_mascota | nombre_cliente | nombre_veterinario | fecha      | motivo               |
        +----------------+----------------+--------------------+------------+----------------------+
        | Rocky          | Laura Sanchez  | Dra. Elena Gomez   | 2023-07-15 | Extraccion de diente |
        | Rocky          | Laura Sanchez  | Dra. Elena Gomez   | 2024-03-18 | Cirugia hernia       |
        +----------------+----------------+--------------------+------------+----------------------+
        ```
    3. Eliminar la vista:

        ```sql
        DROP VIEW Vista_visitas_completas;
        ```
4. Funciones

    1. Crear una función llamada Visitas_por_especie que reciba una especie de mascota y devuelva la cantidad de visitas:

        ```sql
        DELIMITER //
        DROP FUNCTION IF EXISTS Visitas_por_especie//
        CREATE FUNCTION Visitas_por_especie(especie_nombre VARCHAR(30))
        RETURNS INT
        DETERMINISTIC
        BEGIN
            DECLARE total_visitas INT;
            
            SELECT COUNT(*) INTO total_visitas
            FROM Visitas Vi
            JOIN Mascotas M ON Vi.id_mascota = M.id
            WHERE M.especie = especie_nombre;
            
            RETURN total_visitas;
        END //
        DELIMITER ;
        ```
    2. Ejecutarla con "Perro":

        ```sql
        SELECT Visitas_por_especie('Perro') AS total_visitas_perros;
        ```

        ```txt
        +----------------------+
        | total_visitas_perros |
        +----------------------+
        |                    4 |
        +----------------------+
        ```
    3. Eliminar la función:

        ```sql
        DROP FUNCTION IF EXISTS Visitas_por_especie;
        ```
5. Procedimientos

    1. Crear un procedimiento llamado Mascotas_por_especialidad que reciba una especialidad y muestre mascotas atendidas por veterinarios con esa especialidad:

        ```sql
        DELIMITER //
        DROP PROCEDURE IF EXISTS Mascotas_por_especialidad//
        CREATE PROCEDURE Mascotas_por_especialidad(IN param_especialidad VARCHAR(50))
        BEGIN
            SELECT DISTINCT M.nombre AS nombre_mascota
            FROM Mascotas M
            JOIN Visitas Vi ON M.id = Vi.id_mascota
            JOIN Veterinarios Vet ON Vi.id_veterinario = Vet.id
            WHERE Vet.especialidad = param_especialidad;
        END //
        DELIMITER ;
        ```
    2. Ejecutarlo con "Dermatologia":

        ```sql
        CALL Mascotas_por_especialidad('Dermatologia');
        ```

        ```txt
        +----------------+
        | nombre_mascota |
        +----------------+
        | Milo           |
        | Luna           |
        | Kiwi           |
        +----------------+
        ```
    3. Eliminarlo:

        ```sql
        DROP PROCEDURE IF EXISTS Mascotas_por_especialidad;
        ```
6. Triggers

    1. Crear la tabla Auditoria_visitas:

        ```sql
        CREATE TABLE Auditoria_visitas (
            id INT,
            id_mascota INT,
            id_veterinario INT,
            fecha DATE,
            motivo VARCHAR(200),
            accion VARCHAR(20), -- Para registrar 'INSERT'
            fecha_auditoria TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
        ```
    2. Crear trigger after_insert_visitas para registrar inserciones:

        ```sql
        DELIMITER //
        DROP TRIGGER IF EXISTS after_insert_visitas//
        CREATE TRIGGER after_insert_visitas
        AFTER INSERT ON Visitas
        FOR EACH ROW
        BEGIN
            INSERT INTO Auditoria_visitas (
                id, id_mascota, id_veterinario, fecha, motivo, accion
            )
            VALUES (
                NEW.id, NEW.id_mascota, NEW.id_veterinario, NEW.fecha, NEW.motivo, 'INSERT'
            );
        END //
        DELIMITER ;
        ```
    3. Insertar visita y consultar auditoría:

        ```sql
        INSERT INTO Visitas (id, id_mascota, id_veterinario, fecha, motivo) VALUES (9, 1, 2, '2025-06-05', 'Chequeo dental');
        ```

        ```sql
        SELECT * FROM Auditoria_visitas;
        ```

        ```txt
        +------+------------+----------------+------------+----------------+--------+---------------------+
        | id   | id_mascota | id_veterinario | fecha      | motivo         | accion | fecha_auditoria     |
        +------+------------+----------------+------------+----------------+--------+---------------------+
        |    9 |          1 |              2 | 2025-06-05 | Chequeo dental | INSERT | 2025-06-05 18:14:20 |
        +------+------------+----------------+------------+----------------+--------+---------------------+
        ```
    4. Eliminar trigger y tabla de auditoría:

        ```sql
        DROP TRIGGER IF EXISTS after_insert_visitas;
        ```

        ```sql
        DROP TABLE IF EXISTS Auditoria_visitas;
        ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
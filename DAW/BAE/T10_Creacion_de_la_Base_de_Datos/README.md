## Creación de la Base de Datos

1. Crear las tablas con sus respectivos campos.
    1. Utilizando la terminal o línea de comandos, abre SQLite3 y crea una base de datos llamada `tarea.db`.

        ```shell
        sqlite3 tarea.db
        ```
    2. Dentro de SQLite, crea las siguientes tablas:
        1. `Propietarios`: Almacena información de los propietarios.
            * `id` (tipo INTEGER ENTERO, clave primaria, autoincremento)
            * `nombre` (tipo TEXT, no nulo)
            * `apellido` (tipo TEXT, no nulo)
            * `dni` (tipo TEXT, Valor único)

            ```sql
            -- Crear tabla "Propietarios"
            CREATE TABLE Propietarios (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                nombre TEXT NOT NULL,
                apellido TEXT NOT NULL,
                dni TEXT UNIQUE NOT NULL
            );
            ```
        2. `Vehiculos`: Almacena información sobre los vehículos de los propietarios.
            * `id` (tipo INTEGER ENTERO, clave primaria, autoincremento)
            * `marca` (tipo TEXT, no nulo)
            * `modelo` (tipo TEXT, no nulo)
            * `anio` (tipo INTEGER, no nulo)
            * `id_propietario` (tipo INTEGER, FK Propietarios(id))

            ```sql
            -- Crear tabla "Vehiculos"
            CREATE TABLE Vehiculos (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                marca TEXT NOT NULL,
                modelo TEXT NOT NULL,
                anio INTEGER NOT NULL,
                id_propietario INTEGER,
                FOREIGN KEY (id_propietario) REFERENCES Propietarios(id)
            );
            ```
2. Normaliza la tabla e inserta los siguientes datos:
    <details>
    <summary>Tabla</summary>

    | id    | propietario      | dni       | marca      | modelo     | anio  |
    | :---: | :--------------- | :-------: | :--------- | :--------- | :---: |
    | 1     | Juan Perez       | 12345678A | Ford       | Fiesta     | 2019  |
    | 2     | Maria Lopez      | 87654321B | Toyota     | Corolla    | 2018  |
    | 3     | Carlos Ruiz      | 11111111C | Nissan     | Sentra     | 2020  |
    | 4     | Laura Gomez      | 22222222D | Chevrolet  | Spark      | 2017  |
    | 5     | Pedro Martinez   | 33333333E | Honda      | Civic      | 2016  |
    | 6     | Ana Fernandez    | 44444444F | Ford       | Mustang    | 2021  |
    | 7     | Diego Sanchez    | 55555555G | Toyota     | RAV4       | 2019  |
    | 8     | Sofia Torres     | 66666666H | Volkswagen | Golf       | 2020  |
    | 9     | Javier Leon      | 77777777I | Honda      | CR-V       | 2018  |
    | 10    | Lucia Castillo   | 88888888J | Nissan     | Altima     | 2017  |
    | 11    | Luis Gonzalez    | 99999999K | Chevrolet  | Malibu     | 2019  |
    | 12    | Marta Diaz       | 10101010L | Toyota     | Camry      | 2020  |
    | 13    | Victor Vargas    | 11111112M | Honda      | Accord     | 2018  |
    | 14    | Elena Castro     | 12121212N | Ford       | Explorer   | 2021  |
    | 15    | Roberto Blanco   | 13131313O | Nissan     | Rogue      | 2017  |
    | 16    | Natalia Paredes  | 14141414P | Volkswagen | Jetta      | 2019  |
    | 17    | Fernando Herrera | 15151515Q | Chevrolet  | Equinox    | 2018  |
    | 18    | Clara Soto       | 16161616R | Toyota     | Highlander | 2020  |
    | 19    | Sergio Mendoza   | 17171717S | Honda      | Odyssey    | 2016  |
    | 20    | Patricia Navarro | 18181818T | Nissan     | Murano     | 2019  |
    </details>

    <details>
    <summary>1FN</summary>

    | id    | nombre   | apellido  | dni       | marca      | modelo     | anio  |
    | :---: | :------- | :-------- | :-------: | :--------- | :--------- | :---: |
    | 1     | Juan     | Perez     | 12345678A | Ford       | Fiesta     | 2019  |
    | 2     | Maria    | Lopez     | 87654321B | Toyota     | Corolla    | 2018  |
    | 3     | Carlos   | Ruiz      | 11111111C | Nissan     | Sentra     | 2020  |
    | 4     | Laura    | Gomez     | 22222222D | Chevrolet  | Spark      | 2017  |
    | 5     | Pedro    | Martinez  | 33333333E | Honda      | Civic      | 2016  |
    | 6     | Ana      | Fernandez | 44444444F | Ford       | Mustang    | 2021  |
    | 7     | Diego    | Sanchez   | 55555555G | Toyota     | RAV4       | 2019  |
    | 8     | Sofia    | Torres    | 66666666H | Volkswagen | Golf       | 2020  |
    | 9     | Javier   | Leon      | 77777777I | Honda      | CR-V       | 2018  |
    | 10    | Lucia    | Castillo  | 88888888J | Nissan     | Altima     | 2017  |
    | 11    | Luis     | Gonzalez  | 99999999K | Chevrolet  | Malibu     | 2019  |
    | 12    | Marta    | Diaz      | 10101010L | Toyota     | Camry      | 2020  |
    | 13    | Victor   | Vargas    | 11111112M | Honda      | Accord     | 2018  |
    | 14    | Elena    | Castro    | 12121212N | Ford       | Explorer   | 2021  |
    | 15    | Roberto  | Blanco    | 13131313O | Nissan     | Rogue      | 2017  |
    | 16    | Natalia  | Paredes   | 14141414P | Volkswagen | Jetta      | 2019  |
    | 17    | Fernando | Herrera   | 15151515Q | Chevrolet  | Equinox    | 2018  |
    | 18    | Clara    | Soto      | 16161616R | Toyota     | Highlander | 2020  |
    | 19    | Sergio   | Mendoza   | 17171717S | Honda      | Odyssey    | 2016  |
    | 20    | Patricia | Navarro   | 18181818T | Nissan     | Murano     | 2019  |
    </details>

    <details>
    <summary>2FN</summary>

    | id    | nombre   | apellido  | dni       |
    | :---: | :------- | :-------- | :-------: |
    | 1     | Juan     | Perez     | 12345678A |
    | 2     | Maria    | Lopez     | 87654321B |
    | 3     | Carlos   | Ruiz      | 11111111C |
    | 4     | Laura    | Gomez     | 22222222D |
    | 5     | Pedro    | Martinez  | 33333333E |
    | 6     | Ana      | Fernandez | 44444444F |
    | 7     | Diego    | Sanchez   | 55555555G |
    | 8     | Sofia    | Torres    | 66666666H |
    | 9     | Javier   | Leon      | 77777777I |
    | 10    | Lucia    | Castillo  | 88888888J |
    | 11    | Luis     | Gonzalez  | 99999999K |
    | 12    | Marta    | Diaz      | 10101010L |
    | 13    | Victor   | Vargas    | 11111112M |
    | 14    | Elena    | Castro    | 12121212N |
    | 15    | Roberto  | Blanco    | 13131313O |
    | 16    | Natalia  | Paredes   | 14141414P |
    | 17    | Fernando | Herrera   | 15151515Q |
    | 18    | Clara    | Soto      | 16161616R |
    | 19    | Sergio   | Mendoza   | 17171717S |
    | 20    | Patricia | Navarro   | 18181818T |

    | id    | marca      | modelo     | anio  | id_propietario |
    | :---: | :--------- | :--------- | :---: | :------------: |
    | 1     | Ford       | Fiesta     | 2019  | 1              |
    | 2     | Toyota     | Corolla    | 2018  | 2              |
    | 3     | Nissan     | Sentra     | 2020  | 3              |
    | 4     | Chevrolet  | Spark      | 2017  | 4              |
    | 5     | Honda      | Civic      | 2016  | 5              |
    | 6     | Ford       | Mustang    | 2021  | 6              |
    | 7     | Toyota     | RAV4       | 2019  | 7              |
    | 8     | Volkswagen | Golf       | 2020  | 8              |
    | 9     | Honda      | CR-V       | 2018  | 9              |
    | 10    | Nissan     | Altima     | 2017  | 10             |
    | 11    | Chevrolet  | Malibu     | 2019  | 11             |
    | 12    | Toyota     | Camry      | 2020  | 12             |
    | 13    | Honda      | Accord     | 2018  | 13             |
    | 14    | Ford       | Explorer   | 2021  | 14             |
    | 15    | Nissan     | Rogue      | 2017  | 15             |
    | 16    | Volkswagen | Jetta      | 2019  | 16             |
    | 17    | Chevrolet  | Equinox    | 2018  | 17             |
    | 18    | Toyota     | Highlander | 2020  | 18             |
    | 19    | Honda      | Odyssey    | 2016  | 19             |
    | 20    | Nissan     | Murano     | 2019  | 20             |
    </details>

    ```sql
    -- Insertar datos en la tabla "Propietarios"
    INSERT INTO Propietarios (nombre, apellido, dni)
    VALUES
    ('Juan', 'Perez', '12345678A'),
    ('Maria', 'Lopez', '87654321B'),
    ('Carlos', 'Ruiz', '11111111C'),
    ('Laura', 'Gomez', '22222222D'),
    ('Pedro', 'Martinez', '33333333E'),
    ('Ana', 'Fernandez', '44444444F'),
    ('Diego', 'Sanchez', '55555555G'),
    ('Sofia', 'Torres', '66666666H'),
    ('Javier', 'Leon', '77777777I'),
    ('Lucia', 'Castillo', '88888888J'),
    ('Luis', 'Gonzalez', '99999999K'),
    ('Marta', 'Diaz', '10101010L'),
    ('Victor', 'Vargas', '11111112M'),
    ('Elena', 'Castro', '12121212N'),
    ('Roberto', 'Blanco', '13131313O'),
    ('Natalia', 'Paredes', '14141414P'),
    ('Fernando', 'Herrera', '15151515Q'),
    ('Clara', 'Soto', '16161616R'),
    ('Sergio', 'Mendoza', '17171717S'),
    ('Patricia', 'Navarro', '18181818T');
    ```

    ```sql
    -- Insertar datos en la tabla "Vehiculos"
    INSERT INTO Vehiculos (marca, modelo, anio, id_propietario)
    VALUES
    ('Ford', 'Fiesta', 2019, 1),
    ('Toyota', 'Corolla', 2018, 2),
    ('Nissan', 'Sentra', 2020, 3),
    ('Chevrolet', 'Spark', 2017, 4),
    ('Honda', 'Civic', 2016, 5),
    ('Ford', 'Mustang', 2021, 6),
    ('Toyota', 'RAV4', 2019, 7),
    ('Volkswagen', 'Golf', 2020, 8),
    ('Honda', 'CR-V', 2018, 9),
    ('Nissan', 'Altima', 2017, 10),
    ('Chevrolet', 'Malibu', 2019, 11),
    ('Toyota', 'Camry', 2020, 12),
    ('Honda', 'Accord', 2018, 13),
    ('Ford', 'Explorer', 2021, 14),
    ('Nissan', 'Rogue', 2017, 15),
    ('Volkswagen', 'Jetta', 2019, 16),
    ('Chevrolet', 'Equinox', 2018, 17),
    ('Toyota', 'Highlander', 2020, 18),
    ('Honda', 'Odyssey', 2016, 19),
    ('Nissan', 'Murano', 2019, 20);
    ```
3. Realizar las siguientes consultas de datos:
    1. Seleccionar todos los propietarios.

        ```sql
        SELECT * FROM Propietarios;
        ```
    2. Listar todos los vehículos.

        ```sql
        SELECT * FROM Vehiculos;
        ```
    3. Seleccionar solo los nombres y apellidos de los propietarios.

        ```sql
        SELECT nombre, apellido FROM Propietarios;
        ```
    4. Listar todas las marcas y modelos de los vehículos.

        ```sql
        SELECT marca, modelo FROM Vehiculos;
        ```
    5. Seleccionar solo los propietarios con apellido "Perez".

        ```sql
        SELECT * FROM Propietarios WHERE apellido = 'Perez';
        ```
    6. Listar todos los vehículos con año 2019.

        ```sql
        SELECT * FROM Vehiculos WHERE anio = 2019;
        ```
    7. Seleccionar propietarios que tienen vehículos de la marca "Toyota".

        ```sql
        SELECT P.* FROM Propietarios P JOIN Vehiculos V ON P.id = V.id_propietario WHERE V.marca = 'Toyota';
        ```
    8. Listar vehículos con marca "Ford" y modelo "Fiesta".

        ```sql
        SELECT * FROM Vehiculos WHERE marca = 'Ford' AND modelo = 'Fiesta';
        ```
    9. Seleccionar propietarios con DNI "12345678A".

        ```sql
        SELECT * FROM Propietarios WHERE dni = '12345678A';
        ```
    10. Listar vehículos que pertenecen al propietario con ID 5.

        ```sql
        SELECT * FROM Vehiculos WHERE id_propietario = 5;
        ```
4. Realizar los siguientes updates:
    1. Actualizar el nombre del propietario con DNI "12345678A".

        ```sql
        UPDATE Propietarios SET nombre = 'Antonio' WHERE dni = '12345678A';
        ```
    2. Modificar el año de un vehículo con ID 3 a 2022.

        ```sql
        UPDATE Vehiculos SET anio = 2022 WHERE id = 3;
        ```
    3. Cambiar el modelo de todos los vehículos Nissan a "Micra".

        ```sql
        UPDATE Vehiculos SET modelo = 'Micra' WHERE marca = 'Nissan';
        ```
    4. Actualizar el apellido de un propietario con ID 7 a "Gomez".

        ```sql
        UPDATE Propietarios SET apellido = 'Gomez' WHERE id = 7;
        ```
    5. Modificar la marca de un vehículo con modelo "Fiesta" a "Renault".

        ```sql
        UPDATE Vehiculos SET marca = 'Renault' WHERE modelo = 'Fiesta';
        ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
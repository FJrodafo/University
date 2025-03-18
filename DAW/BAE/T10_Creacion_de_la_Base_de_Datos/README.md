## Creación de la Base de Datos

1. Crear las tablas con sus respectivos campos.
    1. Utilizando la terminal o línea de comandos, abre SQLite3 y crea una base de datos llamada `tarea.db`.
        ```shell
        
        ```
    2. Dentro de SQLite, crea las siguientes tablas:
        1. `Propietarios`: Almacena información de los propietarios.
            * `id` (tipo INTEGER ENTERO, clave primaria, autoincremento)
            * `nombre` (tipo TEXT, no nulo)
            * `apellido` (tipo TEXT, no nulo)
            * `dni` (tipo TEXT, Valor único)
            ```shell
            
            ```
        2. `Vehiculos`: Almacena información sobre los vehículos de los propietarios.
            * `id` (tipo INTEGER ENTERO, clave primaria, autoincremento)
            * `marca` (tipo TEXT, no nulo)
            * `modelo` (tipo TEXT, no nulo)
            * `anio` (tipo INTEGER, no nulo)
            * `id_propietario` (tipo INTEGER, FK Propietarios(id))
            ```shell
            
            ```
2. Normaliza la tabla e inserta los siguientes datos:
    <details>
    <summary>Tabla</summary>

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

    ```sql
    
    ```
3. Realizar las siguientes consultas de datos:
    1. Seleccionar todos los propietarios.
        ```sql
        
        ```
    2. Listar todos los vehículos.
        ```sql
        
        ```
    3. Seleccionar solo los nombres y apellidos de los propietarios.
        ```sql
        
        ```
    4. Listar todas las marcas y modelos de los vehículos.
        ```sql
        
        ```
    5. Seleccionar solo los propietarios con apellido "Perez".
        ```sql
        
        ```
    6. Listar todos los vehículos con año 2019.
        ```sql
        
        ```
    7. Seleccionar propietarios que tienen vehículos de la marca "Toyota".
        ```sql
        
        ```
    8. Listar vehículos con marca "Ford" y modelo "Fiesta".
        ```sql
        
        ```
    9. Seleccionar propietarios con DNI "12345678A".
        ```sql
        
        ```
    10. Listar vehículos que pertenecen al propietario con ID 5.
        ```sql
        
        ```
4. Realizar los siguientes updates:
    1. Actualizar el nombre de un propietario con DNI "12345678A".
        ```sql
        
        ```
    2. Modificar el año de un vehículo con ID 3 a 2022.
        ```sql
        
        ```
    3. Cambiar el modelo de todos los vehículos Nissan a "Micra".
        ```sql
        
        ```
    4. Actualizar el apellido de un propietario con ID 7 a "Gomez".
        ```sql
        
        ```
    5. Modificar la marca de un vehículo con modelo "Fiesta" a "Renault".
        ```sql
        
        ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
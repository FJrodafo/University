## Empleados

1. Creación de la Base de Datos.
    Crea con el siguente contenido el fichero `empleados.sql`.

    ```sql
    CREATE TABLE empleados (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        salario REAL,
        departamento TEXT
    );

    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
    INSERT INTO empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');
    ```
2. Lectura del fichero SQL.
    * Realiza un `.read` del fichero sql, de nombre `empleados.sql`, realiza la creación e inserción de información de la BBDD.

        ```sql
        
        ```
3. Realizar las siguientes consultas de datos:
    1. Funciones UPPER y LOWER:
        * Muestra el nombre de todos los empleados en mayúsculas.

            ```sql
            
            ```
    2. Funciones Numéricas:
        * Calcula el valor absoluto del salario de todos los empleados.

            ```sql
            
            ```
    3. Funciones de Fecha y Hora:
        * Muestra la fecha actual.

            ```sql
            
            ```
    4. Funciones de Agregación:
        * Calcula el promedio de salarios de todos los empleados.

            ```sql
            
            ```
        * Convierte la cadena '123' a un valor entero.

            ```sql
            
            ```
    5. Funciones de Manipulación de Cadenas:
        * Concatena el nombre y el departamento de cada empleado.

            ```sql
            
            ```
    6. Funciones de Manipulación de Cadenas (CONCAT_WS):
        * Concatena el nombre y el departamento de cada empleado con un guion como separador.

            ```sql
            
            ```
    7. Funciones de Control de Flujo (CASE):
        * Categoriza a los empleados según sus salarios.

            ```sql
            
            ```
    8. Funciones de Agregación (SUM):
        * Calcula la suma total de salarios de todos los empleados.

            ```sql
            
            ```
    9. Funciones Numéricas (ROUND):
        * Redondea el salario de todos los empleados a dos decimales.

            ```sql
            
            ```
    10. Funciones de Manipulación de Cadenas (LENGTH):
        * Muestra la longitud de cada nombre de empleado.

            ```sql
            
            ```
    11. Funciones de Agregación (COUNT):
        * Cuenta el número total de empleados en cada departamento.

            ```sql
            
            ```
    12. Funciones de Fecha y Hora (CURRENT_TIME):
        * Muestra la hora actual.

            ```sql
            
            ```
    13. Funciones de Conversión (CAST):
        * Convierte el salario a un valor de punto flotante.

            ```sql
            
            ```
    14. Funciones de Manipulación de Cadenas (SUBSTR):
        * Muestra los primeros tres caracteres de cada nombre de empleado.

            ```sql
            
            ```
    15. Order By and Like.
        * Empleados en el departamento de 'Ventas' con salarios superiores a 52000.

            ```sql
            
            ```
        * Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.

            ```sql
            
            ```
        * Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.

            ```sql
            
            ```
        * Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.

            ```sql
            
            ```
        * Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.

            ```sql
            
            ```
        * Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.

            ```sql
            
            ```
        * Empleados con salarios únicos (eliminando duplicados) en orden ascendente.

            ```sql
            
            ```
        * Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.

            ```sql
            
            ```
        * Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.

            ```sql
            
            ```
        * Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.

            ```sql
            
            ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
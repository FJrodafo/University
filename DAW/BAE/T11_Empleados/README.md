## Empleados

1. Creación de la Base de Datos.
    Crea con el siguente contenido el fichero `empleados.sql`.

    ```sql
    CREATE TABLE Empleados (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        salario REAL NOT NULL,
        departamento TEXT NOT NULL
    );

    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
    INSERT INTO Empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');
    ```
2. Lectura del fichero SQL.
    * Realiza un `.read` del fichero sql, de nombre `empleados.sql`, realiza la creación e inserción de información de la BBDD.

        ```shell
        sqlite3 empleados.db
        ```

        ```sqlite3
        .read empleados.sql
        ```
3. Realizar las siguientes consultas de datos:
    1. Funciones UPPER y LOWER:
        * Muestra el nombre de todos los empleados en mayúsculas.

            ```sql
            SELECT UPPER(nombre) FROM Empleados;
            ```
    2. Funciones Numéricas:
        * Calcula el valor absoluto del salario de todos los empleados.

            ```sql
            SELECT nombre, ABS(salario) FROM Empleados;
            ```
    3. Funciones de Fecha y Hora:
        * Muestra la fecha actual.

            ```sql
            SELECT DATE('now');
            ```
        * Muestra la hora actual.

            ```sql
            SELECT TIME('now');
            ```
    4. Funciones de Agregación:
        * Calcula el promedio de salarios de todos los empleados.

            ```sql
            SELECT AVG(salario) FROM Empleados;
            ```
        * Convierte la cadena "123" a un valor entero.

            ```sql
            SELECT CAST('123' AS INTEGER);
            ```
    5. Funciones de Manipulación de Cadenas:
        * Concatena el nombre y el departamento de cada empleado con un guion como separador.

            ```sql
            SELECT nombre || ' - ' || departamento FROM Empleados;
            ```
    6. Funciones de Control de Flujo (CASE):
        * Categoriza a los empleados según sus salarios.

            ```sql
            SELECT nombre, salario, CASE
                WHEN salario < 50000 THEN 'Bajo'
                WHEN salario BETWEEN 50000 AND 65000 THEN 'Medio'
                ELSE 'Alto'
                END AS categoria_salarial
            FROM Empleados;
            ```
    7. Funciones de Agregación (SUM):
        * Calcula la suma total de salarios de todos los empleados.

            ```sql
            SELECT SUM(salario) FROM Empleados;
            ```
    8. Funciones Numéricas (ROUND):
        * Redondea el salario de todos los empleados a dos decimales.

            ```sql
            SELECT nombre, ROUND(salario, 2) FROM Empleados;
            ```
    9. Funciones de Manipulación de Cadenas (LENGTH):
        * Muestra la longitud de cada nombre de empleado.

            ```sql
            SELECT nombre, LENGTH(nombre) FROM Empleados;
            ```
    10. Funciones de Agregación (COUNT):
        * Cuenta el número total de empleados en cada departamento.

            ```sql
            SELECT departamento, COUNT(*) FROM Empleados GROUP BY departamento;
            ```
    12. Funciones de Conversión (CAST):
        * Convierte el salario a un valor de punto flotante.

            ```sql
            SELECT CAST(salario AS REAL) FROM Empleados;
            ```
    13. Funciones de Manipulación de Cadenas (SUBSTR):
        * Muestra los primeros tres caracteres de cada nombre de empleado.

            ```sql
            SELECT nombre, SUBSTR(nombre, 1, 3) FROM Empleados;
            ```
    14. Order By and Like.
        * Muestra los empleados en el departamento de "Ventas" con salarios superiores a 52000.

            ```sql
            SELECT * FROM Empleados WHERE departamento = 'Ventas' AND salario > 52000;
            ```
        * Muestra los empleados cuyos nombres contienen la letra "a" y tienen salarios ordenados de manera ascendente.

            ```sql
            SELECT * FROM Empleados WHERE nombre LIKE '%a%' ORDER BY salario ASC;
            ```
        * Muestra los empleados en el departamento "Recursos Humanos" con salarios entre 45000 y 55000.

            ```sql
            SELECT * FROM Empleados WHERE departamento = 'Recursos Humanos' AND salario BETWEEN 45000 AND 55000;
            ```
        * Muestra los empleados con salarios en orden descendente, limitando a los primeros 5 resultados.

            ```sql
            SELECT * FROM Empleados ORDER BY salario DESC LIMIT 5;
            ```
        * Muestra los empleados cuyos nombres comienzan con "M" o "N" y tienen salarios superiores a 50000.

            ```sql
            SELECT * FROM Empleados WHERE (nombre LIKE 'M%' OR nombre LIKE 'N%') AND salario > 50000;
            ```
        * Muestra los empleados en el departamento "TI" o "Ventas" ordenados alfabéticamente por nombre.

            ```sql
            SELECT * FROM Empleados WHERE departamento IN ('TI', 'Ventas') ORDER BY nombre ASC;
            ```
        * Muestra los empleados con salarios únicos (eliminando duplicados) en orden ascendente.

            ```sql
            SELECT DISTINCT salario FROM Empleados ORDER BY salario ASC;
            ```
        * Muestra los empleados cuyos nombres terminan con "o" o "a" y están en el departamento "Ventas".

            ```sql
            SELECT * FROM Empleados WHERE (nombre LIKE '%o' OR nombre LIKE '%a') AND departamento = 'Ventas';
            ```
        * Muestra los empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.

            ```sql
            SELECT * FROM Empleados WHERE salario NOT BETWEEN 55000 AND 70000 ORDER BY departamento;
            ```
        * Muestra los empleados en el departamento "Recursos Humanos" con nombres que no contienen la letra "e".

            ```sql
            SELECT * FROM Empleados WHERE departamento = 'Recursos Humanos' AND nombre NOT LIKE '%e%';
            ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
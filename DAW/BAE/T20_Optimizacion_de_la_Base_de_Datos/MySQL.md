## Optimización de la Base de Datos - MySQL

Un instituto de enseñanza guarda los siguientes datos de sus alumnos:

* Número de inscripción, comienza desde 1 cada año.
* Año de inscripción.
* Nombre del alumno.
* Documento del alumno.
* Domicilio.
* Ciudad.
* Provincia.
* Clave primaria: número de inscripción y año de inscripción.

Se pide:

1. Elimine la tabla "Alumnos" si existe.

    ```sql
    DROP TABLE IF EXISTS Alumnos;
    ```

    ```
    ✅ MySQL returned an empty result set (i.e. zero rows). (Query took 0.0028 seconds.)
    ```
2. Cree la tabla "Alumnos" definiendo una clave primaria compuesta (número de inscripción y año de inscripción).

    ```sql
    CREATE TABLE Alumnos (
        numero_inscripcion INT NOT NULL,
        anio_inscripcion INT NOT NULL,
        nombre VARCHAR(100),
        documento VARCHAR(20),
        domicilio VARCHAR(150),
        ciudad VARCHAR(100),
        provincia VARCHAR(100),
        PRIMARY KEY (numero_inscripcion, anio_inscripcion)
    );
    ```

    ```
    ✅ MySQL returned an empty result set (i.e. zero rows). (Query took 0.0259 seconds.)
    ```
3. Define los siguientes indices:

    1. Un índice único por el campo "documento" y un índice común por "ciudad" y "provincia".

        ```sql
        CREATE UNIQUE INDEX idx_documento ON Alumnos(documento);
        ```

        ```
        ✅ MySQL returned an empty result set (i.e. zero rows). (Query took 0.0180 seconds.)
        ```

        ```sql
        CREATE INDEX idx_ciudad_provincia ON Alumnos(ciudad, provincia);
        ```

        ```
        ✅ MySQL returned an empty result set (i.e. zero rows). (Query took 0.0166 seconds.)
        ```
    2. Vea los índices de la tabla.

        ```sql
        SHOW INDEX FROM Alumnos;
        ```

        ```
        db/bae/		http://127.0.0.1:8099/index.php?route=/database/sql&db=bae
        Your SQL query has been executed successfully.

        SHOW INDEX FROM Alumnos;



        Alumnos	0	PRIMARY	1	numero_inscripcion	A	0	NULL	NULL		BTREE			YES	NULL	
        Alumnos	0	PRIMARY	2	anio_inscripcion	A	0	NULL	NULL		BTREE			YES	NULL	
        Alumnos	0	idx_documento	1	documento	A	0	NULL	NULL	YES	BTREE			YES	NULL	
        Alumnos	1	idx_ciudad_provincia	1	ciudad	A	0	NULL	NULL	YES	BTREE			YES	NULL	
        Alumnos	1	idx_ciudad_provincia	2	provincia	A	0	NULL	NULL	YES	BTREE			YES	NULL	
        ```
4. Intente ingresar un alumno con clave primaria repetida.

    ```sql
    INSERT INTO Alumnos VALUES (1, 2025, 'Juan Pérez', '12345678', 'Calle Falsa 1', 'Rosario', 'Santa Fe');
    ```

    ```
    ✅ 1 row inserted. (Query took 0.0045 seconds.)
    ```

    ```sql
    INSERT INTO Alumnos VALUES (1, 2025, 'Pedro Gómez', '87654321', 'Av. Siempre Viva 742', 'Rosario', 'Santa Fe');
    ```

    ```
    ❎ #1062 - Duplicate entry '1-2025' for key 'Alumnos.PRIMARY'
    ```
5. Intente ingresar un alumno con documento repetido.

    ```sql
    INSERT INTO Alumnos VALUES (2, 2025, 'Laura Díaz', '12345678', 'Calle 10 N°456', 'Santa Fe', 'Santa Fe');
    ```

    ```
    ❎ #1062 - Duplicate entry '12345678' for key 'Alumnos.idx_documento'
    ```
6. Ingrese varios alumnos de la misma ciudad y provincia.

    ```sql
    INSERT INTO Alumnos VALUES (2, 2025, 'María García', '23456789', 'Calle Falsa 2', 'Rosario', 'Santa Fe');
    ```

    ```
    ✅ 1 row inserted. (Query took 0.0053 seconds.)
    ```

    ```sql
    INSERT INTO Alumnos VALUES (3, 2025, 'Luis Rodríguez', '34567890', 'Calle Falsa 3', 'Rosario', 'Santa Fe');
    ```

    ```
    ✅ 1 row inserted. (Query took 0.0058 seconds.)
    ```

    ```sql
    INSERT INTO Alumnos VALUES (4, 2025, 'Ana López', '45678901', 'Calle Falsa 4', 'Rosario', 'Santa Fe');
    ```

    ```
    ✅ 1 row inserted. (Query took 0.0049 seconds.)
    ```

    ```sql
    SELECT * FROM Alumnos;
    ```

    ```
    db/bae/Alumnos/		http://127.0.0.1:8099/index.php?route=/database/sql&db=bae

       Showing rows 0 -  3 (4 total, Query took 0.0002 seconds.)


    SELECT * FROM Alumnos;


    numero_inscripcion	anio_inscripcion	nombre	documento	domicilio	ciudad	provincia	
    1	2025	Juan Pérez	12345678	Calle Falsa 1	Rosario	Santa Fe	
    2	2025	María García	23456789	Calle Falsa 2	Rosario	Santa Fe	
    3	2025	Luis Rodríguez	34567890	Calle Falsa 3	Rosario	Santa Fe	
    4	2025	Ana López	45678901	Calle Falsa 4	Rosario	Santa Fe	
    ```
7. Elimina los indices creados, y muestra que ya no se encuentran.

    ```sql
    DROP INDEX idx_documento ON Alumnos;
    ```

    ```
    ✅ MySQL returned an empty result set (i.e. zero rows). (Query took 0.0114 seconds.)
    ```

    ```sql
    DROP INDEX idx_ciudad_provincia ON Alumnos;
    ```

    ```
    ✅ MySQL returned an empty result set (i.e. zero rows). (Query took 0.0117 seconds.)
    ```

    ```sql
    SHOW INDEX FROM Alumnos;
    ```

    ```
    db/bae/		http://127.0.0.1:8099/index.php?route=/database/sql&db=bae
    Your SQL query has been executed successfully.
    
    SHOW INDEX FROM Alumnos;
    
    
    
    Alumnos	0	PRIMARY	1	numero_inscripcion	A	0	NULL	NULL		BTREE			YES	NULL	
    Alumnos	0	PRIMARY	2	anio_inscripcion	A	0	NULL	NULL		BTREE			YES	NULL	
    ```
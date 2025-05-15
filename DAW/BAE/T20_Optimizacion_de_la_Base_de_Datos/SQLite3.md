## Optimización de la Base de Datos - SQLite3

Un instituto de enseñanza guarda los siguientes datos de sus alumnos:

* Número de inscripción, comienza desde 1 cada año.
* Año de inscripción.
* Nombre del alumno.
* Documento del alumno.
* Domicilio.
* Ciudad.
* Provincia.
* Clave primaria: número de inscripción y año de inscripción.

```shell
sqlite3 instituto.db
```

```sqlite
.mode box
```

Se pide:

1. Elimine la tabla "Alumnos" si existe.

    ```sql
    DROP TABLE IF EXISTS Alumnos;
    ```
2. Cree la tabla "Alumnos" definiendo una clave primaria compuesta (número de inscripción y año de inscripción).

    ```sql
    CREATE TABLE Alumnos (
        numero_inscripcion INTEGER,
        anio_inscripcion INTEGER,
        nombre TEXT,
        documento TEXT,
        domicilio TEXT,
        ciudad TEXT,
        provincia TEXT,
        PRIMARY KEY (numero_inscripcion, anio_inscripcion)
    );
    ```

    ```sqlite
    .tables
    ```

    ```sqlite
    .schema Alumnos
    ```
3. Define los siguientes indices:

    1. Un índice único por el campo "documento" y un índice común por "ciudad" y "provincia".

        ```sql
        CREATE UNIQUE INDEX idx_documento ON Alumnos(documento);
        ```

        ```sql
        CREATE INDEX idx_ciudad_provincia ON Alumnos(ciudad, provincia);
        ```
    2. Vea los índices de la tabla.

        ```sql
        PRAGMA index_list('Alumnos');
        ```

        ```txt
        ┌─────┬────────────────────────────┬────────┬────────┬─────────┐
        │ seq │            name            │ unique │ origin │ partial │
        ├─────┼────────────────────────────┼────────┼────────┼─────────┤
        │ 0   │ idx_ciudad_provincia       │ 0      │ c      │ 0       │
        │ 1   │ idx_documento              │ 1      │ c      │ 0       │
        │ 2   │ sqlite_autoindex_Alumnos_1 │ 1      │ pk     │ 0       │
        └─────┴────────────────────────────┴────────┴────────┴─────────┘
        ```
4. Intente ingresar un alumno con clave primaria repetida.

    ```sql
    INSERT INTO Alumnos VALUES (1, 2025, 'Juan Pérez', '12345678', 'Calle Falsa 1', 'Rosario', 'Santa Fe');
    ```

    ```sql
    INSERT INTO Alumnos VALUES (1, 2025, 'Pedro Gómez', '87654321', 'Av. Siempre Viva 742', 'Rosario', 'Santa Fe');
    ```

    ```txt
    Runtime error: UNIQUE constraint failed: Alumnos.numero_inscripcion, Alumnos.anio_inscripcion (19)
    ```
5. Intente ingresar un alumno con documento repetido.

    ```sql
    INSERT INTO Alumnos VALUES (2, 2025, 'Laura Díaz', '12345678', 'Calle 10 N°456', 'Santa Fe', 'Santa Fe');
    ```

    ```txt
    Runtime error: UNIQUE constraint failed: Alumnos.documento (19)
    ```
6. Ingrese varios alumnos de la misma ciudad y provincia.

    ```sql
    INSERT INTO Alumnos VALUES (2, 2025, 'María García', '23456789', 'Calle Falsa 2', 'Rosario', 'Santa Fe');
    ```

    ```sql
    INSERT INTO Alumnos VALUES (3, 2025, 'Luis Rodríguez', '34567890', 'Calle Falsa 3', 'Rosario', 'Santa Fe');
    ```

    ```sql
    INSERT INTO Alumnos VALUES (4, 2025, 'Ana López', '45678901', 'Calle Falsa 4', 'Rosario', 'Santa Fe');
    ```

    ```sql
    SELECT * FROM Alumnos;
    ```

    ```txt
    ┌────────────────────┬──────────────────┬────────────────┬───────────┬───────────────┬─────────┬───────────┐
    │ numero_inscripcion │ anio_inscripcion │     nombre     │ documento │   domicilio   │ ciudad  │ provincia │
    ├────────────────────┼──────────────────┼────────────────┼───────────┼───────────────┼─────────┼───────────┤
    │ 1                  │ 2025             │ Juan Pérez     │ 12345678  │ Calle Falsa 1 │ Rosario │ Santa Fe  │
    │ 2                  │ 2025             │ María García   │ 23456789  │ Calle Falsa 2 │ Rosario │ Santa Fe  │
    │ 3                  │ 2025             │ Luis Rodríguez │ 34567890  │ Calle Falsa 3 │ Rosario │ Santa Fe  │
    │ 4                  │ 2025             │ Ana López      │ 45678901  │ Calle Falsa 4 │ Rosario │ Santa Fe  │
    └────────────────────┴──────────────────┴────────────────┴───────────┴───────────────┴─────────┴───────────┘
    ```
7. Elimina los indices creados, y muestra que ya no se encuentran.

    ```sql
    DROP INDEX IF EXISTS idx_documento;
    ```

    ```sql
    DROP INDEX IF EXISTS idx_ciudad_provincia;
    ```

    ```sql
    PRAGMA index_list('Alumnos');
    ```

    ```txt
    ┌─────┬────────────────────────────┬────────┬────────┬─────────┐
    │ seq │            name            │ unique │ origin │ partial │
    ├─────┼────────────────────────────┼────────┼────────┼─────────┤
    │ 0   │ sqlite_autoindex_Alumnos_1 │ 1      │ pk     │ 0       │
    └─────┴────────────────────────────┴────────┴────────┴─────────┘
    ```

    ```sqlite
    .exit
    ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
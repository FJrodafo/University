## Optimización de la Base de Datos

Una empresa guarda los siguientes datos de sus clientes, con los siguientes campos:

* documento CHAR(8) NOT NULL
* nombre VARCHAR(30) NOT NULL
* domicilio VARCHAR(30)
* ciudad VARCHAR(20)
* provincia VARCHAR(20)
* telefono VARCHAR(11)
* Clave primaria: documento.

```shell
sqlite3 empresa.db
```

```sqlite
.mode box
```

Se pide:

1. Elimine la tabla "Clientes" si existe.

    ```sql
    DROP TABLE IF EXISTS Clientes;
    ```
2. Cree la tabla "Clientes" definiendo una clave primaria (documento).

    ```sql
    CREATE TABLE Clientes (
        documento CHAR(8) NOT NULL,
        nombre VARCHAR(30) NOT NULL,
        domicilio VARCHAR(30),
        ciudad VARCHAR(20),
        provincia VARCHAR(20),
        telefono VARCHAR(11),
        PRIMARY KEY (documento)
    );
    ```

    ```sqlite
    .tables
    ```

    ```sqlite
    .schema Clientes
    ```
3. Define los siguientes indices:

    1. Un índice único por el campo "documento" y un índice común por "ciudad" y "provincia" (Justifica el tipo de indice en un comentario).

        ```sql
        -- Ya hay una PRIMARY KEY en 'documento', por lo que el índice único es redundante, pero lo dejamos por requerimiento (aunque SQLite lo ignora si ya es clave primaria).
        CREATE UNIQUE INDEX idx_documento ON Clientes(documento);
        ```

        ```sql
        -- Índice común para acelerar búsquedas por ciudad y provincia.
        CREATE INDEX idx_ciudad_provincia ON Clientes(ciudad, provincia);
        ```
    2. Vea los índices de la tabla.

        ```sql
        PRAGMA index_list('Clientes');
        ```

        ```txt
        ┌─────┬─────────────────────────────┬────────┬────────┬─────────┐
        │ seq │            name             │ unique │ origin │ partial │
        ├─────┼─────────────────────────────┼────────┼────────┼─────────┤
        │ 0   │ idx_ciudad_provincia        │ 0      │ c      │ 0       │
        │ 1   │ idx_documento               │ 1      │ c      │ 0       │
        │ 2   │ sqlite_autoindex_Clientes_1 │ 1      │ pk     │ 0       │
        └─────┴─────────────────────────────┴────────┴────────┴─────────┘
        ```
4. Agregue un índice único por el campo "telefono".

    ```sql
    CREATE UNIQUE INDEX idx_telefono ON Clientes(telefono);
    ```

    ```sql
    PRAGMA index_list('Clientes');
    ```

    ```txt
    ┌─────┬─────────────────────────────┬────────┬────────┬─────────┐
    │ seq │            name             │ unique │ origin │ partial │
    ├─────┼─────────────────────────────┼────────┼────────┼─────────┤
    │ 0   │ idx_telefono                │ 1      │ c      │ 0       │
    │ 1   │ idx_ciudad_provincia        │ 0      │ c      │ 0       │
    │ 2   │ idx_documento               │ 1      │ c      │ 0       │
    │ 3   │ sqlite_autoindex_Clientes_1 │ 1      │ pk     │ 0       │
    └─────┴─────────────────────────────┴────────┴────────┴─────────┘
    ```
5. Elimina los índices.

    ```sql
    DROP INDEX IF EXISTS idx_documento;
    ```

    ```sql
    DROP INDEX IF EXISTS idx_ciudad_provincia;
    ```

    ```sql
    DROP INDEX IF EXISTS idx_telefono;
    ```

    ```sql
    PRAGMA index_list('Clientes');
    ```

    ```txt
    ┌─────┬─────────────────────────────┬────────┬────────┬─────────┐
    │ seq │            name             │ unique │ origin │ partial │
    ├─────┼─────────────────────────────┼────────┼────────┼─────────┤
    │ 0   │ sqlite_autoindex_Clientes_1 │ 1      │ pk     │ 0       │
    └─────┴─────────────────────────────┴────────┴────────┴─────────┘
    ```

    ```sqlite
    .exit
    ```

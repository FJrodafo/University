## Optimización de la Base de Datos - MySQL

Una empresa guarda los siguientes datos de sus clientes, con los siguientes campos:

* documento CHAR(8) NOT NULL
* nombre VARCHAR(30) NOT NULL
* domicilio VARCHAR(30)
* ciudad VARCHAR(20)
* provincia VARCHAR(20)
* telefono VARCHAR(11)
* Clave primaria: documento.

Se pide:

1. Elimine la tabla "Clientes" si existe.

    ```sql
    DROP TABLE IF EXISTS Clientes;
    ```

    ```txt
    ✅ MySQL returned an empty result set (i.e. zero rows). (Query took 0.0037 seconds.)
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

    ```txt
    ✅ MySQL returned an empty result set (i.e. zero rows). (Query took 0.0247 seconds.)
    ```
3. Define los siguientes indices:

    1. Un índice único por el campo "documento" y un índice común por "ciudad" y "provincia" (Justifica el tipo de indice en un comentario).

        ```sql
        -- Ya hay una PRIMARY KEY en "documento", por lo que el índice único es redundante, pero lo dejamos por requerimiento.
        CREATE UNIQUE INDEX idx_documento ON Clientes(documento);
        ```

        ```txt
        ✅ MySQL returned an empty result set (i.e. zero rows). (Query took 0.0167 seconds.)
        ```

        ```sql
        -- Índice común para acelerar búsquedas por "ciudad" y "provincia".
        CREATE INDEX idx_ciudad_provincia ON Clientes(ciudad, provincia);
        ```

        ```txt
        ✅ MySQL returned an empty result set (i.e. zero rows). (Query took 0.0170 seconds.)
        ```
    2. Vea los índices de la tabla.

        ```sql
        SHOW INDEX FROM Clientes;
        ```

        ```txt
        db/bae/		http://127.0.0.1:8099/index.php?route=/database/sql&db=bae
        Your SQL query has been executed successfully.

        SHOW INDEX FROM Clientes;



        Clientes	0	PRIMARY	1	documento	A	0	NULL	NULL		BTREE			YES	NULL	
        Clientes	0	idx_documento	1	documento	A	0	NULL	NULL		BTREE			YES	NULL	
        Clientes	1	idx_ciudad_provincia	1	ciudad	A	0	NULL	NULL	YES	BTREE			YES	NULL	
        Clientes	1	idx_ciudad_provincia	2	provincia	A	0	NULL	NULL	YES	BTREE			YES	NULL	
        ```
4. Agregue un índice único por el campo "telefono".

    ```sql
    CREATE UNIQUE INDEX idx_telefono ON Clientes(telefono);
    ```

    ```txt
    ✅ MySQL returned an empty result set (i.e. zero rows). (Query took 0.0174 seconds.)
    ```

    ```sql
    SHOW INDEX FROM Clientes;
    ```

    ```txt
    db/bae/		http://127.0.0.1:8099/index.php?route=/database/sql&db=bae
    Your SQL query has been executed successfully.

    SHOW INDEX FROM Clientes;



    Clientes	0	PRIMARY	1	documento	A	0	NULL	NULL		BTREE			YES	NULL	
    Clientes	0	idx_documento	1	documento	A	0	NULL	NULL		BTREE			YES	NULL	
    Clientes	0	idx_telefono	1	telefono	A	0	NULL	NULL	YES	BTREE			YES	NULL	
    Clientes	1	idx_ciudad_provincia	1	ciudad	A	0	NULL	NULL	YES	BTREE			YES	NULL	
    Clientes	1	idx_ciudad_provincia	2	provincia	A	0	NULL	NULL	YES	BTREE			YES	NULL	
    ```
5. Elimina los índices.

    ```sql
    DROP INDEX idx_documento ON Clientes;
    ```

    ```txt
    ✅ MySQL returned an empty result set (i.e. zero rows). (Query took 0.0117 seconds.)
    ```

    ```sql
    DROP INDEX idx_ciudad_provincia ON Clientes;
    ```

    ```txt
    ✅ MySQL returned an empty result set (i.e. zero rows). (Query took 0.0128 seconds.)
    ```

    ```sql
    DROP INDEX idx_telefono ON Clientes;
    ```

    ```txt
    ✅ MySQL returned an empty result set (i.e. zero rows). (Query took 0.0119 seconds.)
    ```

    ```sql
    SHOW INDEX FROM Clientes;
    ```

    ```txt
    db/bae/		http://127.0.0.1:8099/index.php?route=/database/sql&db=bae
    Your SQL query has been executed successfully.
    
    SHOW INDEX FROM Clientes;
    
    
    
    Clientes	0	PRIMARY	1	documento	A	0	NULL	NULL		BTREE			YES	NULL	
    ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
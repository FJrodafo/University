## Simulacro

```sql
--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Consumidores (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    ciudad TEXT,
    categoria INTEGER
);

CREATE TABLE Suministradores (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    categoria REAL
);

CREATE TABLE Compras (
    id INTEGER PRIMARY KEY,
    total REAL,
    fecha TEXT,
    id_consumidor INTEGER,
    id_suministrador INTEGER,
    FOREIGN KEY (id_consumidor) REFERENCES Consumidores(id),
    FOREIGN KEY (id_suministrador) REFERENCES Suministradores(id)
); 

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Consumidores (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES
    (1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100),
    (2, 'Adela', 'Salas', 'Díaz', 'Granada', 200),
    (3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL),
    (4, 'Adrián', 'Suárez', NULL, 'Jaén', 300),
    (5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200),
    (6, 'María', 'Santana', 'Moreno', 'Cádiz', 100),
    (7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300),
    (8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200),
    (9, 'Guillermo', 'López', 'Gómez', 'Granada', 225),
    (10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

INSERT INTO Suministradores (id, nombre, apellido1, apellido2, categoria) VALUES
    (1, 'Daniel', 'Sáez', 'Vega', 0.15),
    (2, 'Juan', 'Gómez', 'López', 0.13),
    (3, 'Diego','Flores', 'Salas', 0.11),
    (4, 'Marta','Herrera', 'Gil', 0.14),
    (5, 'Antonio','Carretero', 'Ortega', 0.12),
    (6, 'Manuel','Domínguez', 'Hernández', 0.13),
    (7, 'Antonio','Vega', 'Hernández', 0.11),
    (8, 'Alfredo','Ruiz', 'Flores', 0.05);

INSERT INTO Compras (id, total, fecha, id_consumidor, id_suministrador) VALUES
    (1, 150.5, '2020-10-05', 5, 2),
    (2, 270.65, '2019-09-10', 1, 5),
    (3, 65.26, '2020-10-05', 2, 1),
    (4, 110.5, '2019-08-17', 8, 3),
    (5, 948.5, '2020-09-10', 5, 2),
    (6, 2400.6, '2019-07-27', 7, 1),
    (7, 5760, '2018-09-10', 2, 1),
    (8, 1983.43, '2020-10-10', 4, 6),
    (9, 2480.4, '2019-10-10', 8, 3),
    (10, 250.45, '2018-06-27', 8, 2),
    (11, 75.29, '2019-08-17', 3, 7),
    (12, 3045.6, '2020-04-25', 2, 1),
    (13, 545.75, '2022-01-25', 6, 1),
    (14, 145.82, '2020-02-02', 6, 1),
    (15, 370.85, '2022-03-11', 1, 5),
    (16, 2389.23, '2022-03-11', 1, 5);
```

1. Consultas sobre una tabla.

    1. Devuelve un listado con todos las compras que se han realizado. Las compras deben estar ordenados por la fecha de realización, mostrando en primer lugar las compras más recientes.

        ```sql
        SELECT * FROM Compras
        ORDER BY fecha DESC;
        ```
    2. Devuelve todos los datos de los dos compras de mayor valor.

        ```sql
        SELECT * FROM Compras
        ORDER BY total DESC
        LIMIT 2;
        ```
    3. Devuelve un listado con los identificadores de los consumidores que han realizado algúna compra. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.

        ```sql
        SELECT DISTINCT id_consumidor FROM Compras;
        ```
    4. Devuelve un listado de todos las compras que se realizaron durante el año 2020, cuya cantidad total sea superior a 500€.

        ```sql
        SELECT * FROM Compras
        WHERE strftime('%Y', fecha) = '2020' AND total > 500;
        ```
    5. Devuelve un listado con el nombre y los apellidos de los suministradores que tienen una comisión entre 0.11 y 0.15.

        ```sql
        SELECT nombre, apellido1, apellido2 FROM Suministradores
        WHERE categoria BETWEEN 0.11 AND 0.15;
        ```
    6. Devuelve el valor de la comisión de mayor valor que existe en la tabla suministrador.

        ```sql
        SELECT MAX(categoria) FROM Suministradores;
        ```
    7. Devuelve el identificador, nombre y primer apellido de aquellos consumidores cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

        ```sql
        SELECT id, nombre, apellido1 FROM Consumidores
        WHERE apellido2 IS NOT NULL
        ORDER BY apellido1, nombre;
        ```
2. Consultas Multitabla Where.

    1. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

        ```sql
        SELECT DISTINCT c.id, c.nombre, c.apellido1, c.apellido2
        FROM Consumidores c, Compras co
        WHERE c.id = co.id_consumidor
        ORDER BY c.apellido1, c.apellido2, c.nombre;
        ```
    2. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.

        ```sql
        SELECT co.*, c.*
        FROM Compras co, Consumidores c
        WHERE co.id_consumidor = c.id
        ORDER BY c.apellido1, c.apellido2, c.nombre;
        ```
    3. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador. El resultado debe mostrar todos los datos de las compras y de los suministradores. El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.

        ```sql
        SELECT co.*, s.*
        FROM Compras co, Suministradores s
        WHERE co.id_suministrador = s.id
        ORDER BY s.apellido1, s.apellido2, s.nombre;
        ```
    4. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado y con los datos de los suministradores asociados a cada compra.

        ```sql
        SELECT co.*, c.*, s.*
        FROM Compras co, Consumidores c, Suministradores s
        WHERE co.id_consumidor = c.id AND co.id_suministrador = s.id;
        ```
    5. Devuelve un listado de todos los consumidores que realizaron una compra durante el año 2020, cuya cantidad esté entre 300 € y 1000 €.

        ```sql
        SELECT DISTINCT c.*
        FROM Compras co, Consumidores c
        WHERE co.id_consumidor = c.id
        AND strftime('%Y', co.fecha) = '2020'
        AND co.total BETWEEN 300 AND 1000;
        ```
    6. Devuelve el nombre y los apellidos de todos los suministradores que han participado en algúna compra realizada por María Santana Moreno.

        ```sql
        SELECT DISTINCT s.nombre, s.apellido1, s.apellido2
        FROM Suministradores s, Compras co, Consumidores c
        WHERE c.id = co.id_consumidor
        AND s.id = co.id_suministrador
        AND c.nombre = 'María' AND c.apellido1 = 'Santana' AND c.apellido2 = 'Moreno';
        ```
    7. Devuelve el nombre de todos los consumidores que han realizado algúna compra con el suministrador Daniel Sáez Vega.

        ```sql
        SELECT DISTINCT c.nombre
        FROM Consumidores c, Compras co, Suministradores s
        WHERE co.id_consumidor = c.id AND co.id_suministrador = s.id
        AND s.nombre = 'Daniel' AND s.apellido1 = 'Sáez' AND s.apellido2 = 'Vega';
        ```
3. Consultas Multitabla Join.

    1. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

        ```sql
        SELECT DISTINCT c.id, c.nombre, c.apellido1, c.apellido2
        FROM Compras co
        JOIN Consumidores c ON co.id_consumidor = c.id
        ORDER BY c.apellido1, c.apellido2, c.nombre;
        ```
    2. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.

        ```sql
        SELECT co.*, c.*
        FROM Compras co
        JOIN Consumidores c ON co.id_consumidor = c.id
        ORDER BY c.apellido1, c.apellido2, c.nombre;
        ```
    3. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador. El resultado debe mostrar todos los datos de las compras y de los suministradores. El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.

        ```sql
        SELECT co.*, s.*
        FROM Compras co
        JOIN Suministradores s ON co.id_suministrador = s.id
        ORDER BY s.apellido1, s.apellido2, s.nombre;
        ```
    4. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado y con los datos de los suministradores asociados a cada compra.

        ```sql
        SELECT co.*, c.*, s.*
        FROM Compras co
        JOIN Consumidores c ON co.id_consumidor = c.id
        JOIN Suministradores s ON co.id_suministrador = s.id;
        ```
    5. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020, cuya cantidad esté entre 300 € y 1000 €.

        ```sql
        SELECT DISTINCT c.*
        FROM Compras co
        JOIN Consumidores c ON co.id_consumidor = c.id
        WHERE strftime('%Y', co.fecha) = '2020'
        AND co.total BETWEEN 300 AND 1000;
        ```
    6. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.

        ```sql
        SELECT DISTINCT s.nombre, s.apellido1, s.apellido2
        FROM Compras co
        JOIN Consumidores c ON co.id_consumidor = c.id
        JOIN Suministradores s ON co.id_suministrador = s.id
        WHERE c.nombre = 'María' AND c.apellido1 = 'Santana' AND c.apellido2 = 'Moreno';
        ```
    7. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.

        ```sql
        SELECT DISTINCT c.nombre
        FROM Compras co
        JOIN Consumidores c ON co.id_consumidor = c.id
        JOIN Suministradores s ON co.id_suministrador = s.id
        WHERE s.nombre = 'Daniel' AND s.apellido1 = 'Sáez' AND s.apellido2 = 'Vega';
        ```
4. Consultas resumen funciones.

    1. Calcula la cantidad media de todos las compras que aparecen en la tabla compra.

        ```sql
        SELECT AVG(total) FROM Compras;
        ```
    2. Calcula el número total de suministradores distintos que aparecen en la tabla compra.

        ```sql
        SELECT COUNT(DISTINCT id_suministrador) FROM Compras;
        ```
    3. Calcula el número total de consumidores que aparecen en la tabla consumidor.

        ```sql
        SELECT COUNT(*) FROM Consumidores;
        ```
    4. Calcula cuál es la mayor cantidad que aparece en la tabla compra.

        ```sql
        SELECT MAX(total) FROM Compras;
        ```
    5. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla consumidor.

        ```sql
        SELECT ciudad, MAX(categoria) AS max_categoria
        FROM Consumidores
        GROUP BY ciudad;
        ```
    6. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores. Es decir, el mismo consumidor puede haber realizado varios compras de diferentes cantidades el mismo día. Se pide que se calcule cuál es el compra de máximo valor para cada uno de los días en los que un consumidor ha realizado un compra. Muestra el identificador del consumidor, nombre, apellidos, la fecha y el valor de la cantidad.

        ```sql
        SELECT c.id, c.nombre, c.apellido1, c.apellido2, co.fecha, MAX(co.total) AS max_total
        FROM Compras co
        JOIN Consumidores c ON co.id_consumidor = c.id
        GROUP BY c.id, co.fecha;
        ```
    7. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores, teniendo en cuenta que sólo queremos mostrar aquellas compras que superen la cantidad de 2000 €.

        ```sql
        SELECT c.id, c.nombre, c.apellido1, c.apellido2, co.fecha, MAX(co.total) AS max_total
        FROM Compras co
        JOIN Consumidores c ON co.id_consumidor = c.id
        WHERE co.total > 2000
        GROUP BY c.id, co.fecha;
        ```
    8. Calcula el máximo valor de las compras realizadas para cada uno de los suministradores durante la fecha 2020-08-17. Muestra el identificador del suministrador, nombre, apellidos y total.

        ```sql
        SELECT s.id, s.nombre, s.apellido1, s.apellido2, MAX(co.total) AS max_total
        FROM Compras co
        JOIN Suministradores s ON co.id_suministrador = s.id
        WHERE co.fecha = '2020-08-17'
        GROUP BY s.id;
        ```
    9. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores. Tenga en cuenta que pueden existir consumidores que no han realizado ninguna compra. Estos consumidores también deben aparecer en el listado indicando que el número de compras realizadas es 0.

        ```sql
        SELECT c.id, c.nombre, c.apellido1, c.apellido2, COUNT(co.id) AS num_compras
        FROM Consumidores c
        LEFT JOIN Compras co ON c.id = co.id_consumidor
        GROUP BY c.id;
        ```
    10. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores durante el año 2020.

        ```sql
        SELECT c.id, c.nombre, c.apellido1, c.apellido2, COUNT(co.id) AS num_compras
        FROM Consumidores c
        LEFT JOIN Compras co ON c.id = co.id_consumidor
        WHERE strftime('%Y', co.fecha) = '2020'
        GROUP BY c.id;
        ```
5. Subconsultas con operadores básicos de comparación.
    
    1. Devuelve un listado con todos las compras que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).

        ```sql
        SELECT * FROM Compras
        WHERE id_consumidor = (
            SELECT id FROM Consumidores
            WHERE nombre = 'Adela' AND apellido1 = 'Salas' AND apellido2 = 'Díaz'
        );
        ```
    2. Devuelve la fecha y la cantidad del compra de menor valor realizado por el cliente Pepe Ruiz Santana.

        ```sql
        SELECT fecha, total FROM Compras
        WHERE id_consumidor = (
            SELECT id FROM Consumidores
            WHERE nombre = 'Pepe' AND apellido1 = 'Ruiz' AND apellido2 = 'Santana'
        )
        ORDER BY total ASC
        LIMIT 1;
        ```
    3. Devuelve el número de compras en los que ha participado el suministrador Daniel Sáez Vega. (Sin utilizar INNER JOIN)

        ```sql
        SELECT COUNT(*) FROM Compras
        WHERE id_suministrador = (
            SELECT id FROM Suministradores
            WHERE nombre = 'Daniel' AND apellido1 = 'Sáez' AND apellido2 = 'Vega'
        );
        ```
    4. Devuelve los datos del consumidor que realizó el compra más caro en el año 2021. (Sin utilizar INNER JOIN)

        ```sql
        SELECT * FROM Consumidores
        WHERE id = (
            SELECT id_consumidor FROM Compras
            WHERE strftime('%Y', fecha) = '2021'
            ORDER BY total DESC LIMIT 1
        );
        ```
    5. Devuelve un listado con los datos de los consumidores y las compras, de todos los consumidores que han realizado un compra durante el año 2020 con un valor mayor o igual al valor medio de las compras realizadas durante ese mismo año.

        ```sql
        SELECT * FROM Compras
        WHERE strftime('%Y', fecha) = '2020'
        AND total >= (
            SELECT AVG(total) FROM Compras
            WHERE strftime('%Y', fecha) = '2020'
        );
        ```
    6. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando IN o NOT IN).

        ```sql
        SELECT * FROM Consumidores
        WHERE id NOT IN (
            SELECT DISTINCT id_consumidor FROM Compras
        );
        ```
    7. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando IN o NOT IN).

        ```sql
        SELECT * FROM Suministradores
        WHERE id NOT IN (
            SELECT DISTINCT id_suministrador FROM Compras
        );
        ```
    8. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).

        ```sql
        SELECT * FROM Consumidores c
        WHERE NOT EXISTS (
            SELECT 1 FROM Compras co
            WHERE co.id_consumidor = c.id
        );
        ```
    9. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).

        ```sql
        SELECT * FROM Suministradores s
        WHERE NOT EXISTS (
            SELECT 1 FROM Compras co
            WHERE co.id_suministrador = s.id
        );
        ```
        
<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
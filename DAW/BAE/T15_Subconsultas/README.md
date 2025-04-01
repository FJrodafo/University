## Subconsultas

```sql
--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre TEXT,
    edad INTEGER,
    direccion TEXT
);

CREATE TABLE Coches (
    id_coche INTEGER PRIMARY KEY,
    modelo TEXT,
    marca TEXT,
    año INTEGER,
    precio REAL
);

CREATE TABLE Ventas (
    id_venta INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    id_coche INTEGER,
    fecha_venta DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_coche) REFERENCES Coches(id_coche)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Clientes (nombre, edad, direccion) VALUES
    ('Juan Pérez', 30, 'Calle A #123'),
    ('María Gómez', 25, 'Avenida B #456'),
    ('Carlos López', 35, 'Calle C #789'),
    ('Ana Martínez', 28, 'Avenida D #101'),
    ('Pedro Rodríguez', 40, 'Calle E #234'),
    ('Laura Sánchez', 32, 'Avenida F #567'),
    ('Miguel González', 27, 'Calle G #890'),
    ('Isabel Díaz', 38, 'Avenida H #111'),
    ('Francisco Ruiz', 33, 'Calle I #222'),
    ('Elena Torres', 29, 'Avenida J #333');

INSERT INTO Coches (modelo, marca, año, precio) VALUES
    ('Sedán', 'Toyota', 2022, 25000.00),
    ('Hatchback', 'Honda', 2021, 22000.00),
    ('SUV', 'Ford', 2023, 30000.00),
    ('Coupé', 'Chevrolet', 2022, 28000.00),
    ('Camioneta', 'Nissan', 2023, 32000.00),
    ('Compacto', 'Volkswagen', 2021, 20000.00),
    ('Híbrido', 'Hyundai', 2022, 27000.00),
    ('Deportivo', 'Mazda', 2023, 35000.00),
    ('Pickup', 'Ram', 2022, 31000.00),
    ('Eléctrico', 'Tesla', 2021, 40000.00);

INSERT INTO Ventas (id_cliente, id_coche, fecha_venta) VALUES
    (1, 1, '2023-01-15'),
    (2, 2, '2023-02-20'),
    (3, 3, '2023-03-25'),
    (4, 4, '2023-04-10'),
    (5, 5, '2023-05-05'),
    (6, 6, '2023-06-15'),
    (7, 7, '2023-07-20'),
    (8, 8, '2023-08-25'),
    (10, 10, '2023-10-05');
```

0. 

    ```sql
    SELECT
        Cl.nombre AS Cliente,
        Co.marca AS Marca,
        Co.precio AS Precio
    FROM Ventas V, Clientes Cl, Coches Co
    WHERE V.id_cliente = Cl.id_cliente
    AND V.id_coche = Co.id_coche
    AND Co.marca IN (
        SELECT Co.marca
        FROM Coches Co
        WHERE Co.precio > (
            SELECT AVG(precio)
            FROM Coches
        )
    );
    ```
1. Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.

    ```sql
    -- Realizar con subconsulta.
    SELECT
        Cl.nombre AS Cliente,
        Co.modelo AS Modelo,
        Co.precio AS Precio
    FROM Ventas V
    JOIN Clientes Cl ON V.id_cliente = Cl.id_cliente
    JOIN Coches Co ON V.id_cliente = Co.id_coche;
    ```
2. Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.

    ```sql
    SELECT
        Cl.nombre AS Cliente,
        Co.precio AS Precio
    FROM Ventas V, Clientes Cl, Coches Co
    WHERE V.id_cliente = Cl.id_cliente
    AND V.id_coche = Co.id_coche
    AND Co.precio > (
        SELECT AVG(precio)
        FROM Coches
    );
    ```
3. Mostrar los modelos de coches y sus precios que no han sido vendidos aún.

    ```sql
    SELECT 
    ```
```sql
-- Calcular el total gastado por todos los clientes en coches.
-- Cosas que debo de tener en cuenta: Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.

```

```sql
-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente.
-- Cosas que debo de tener en cuenta: ¿Por qué campo tengo que ordenadar? ¿Es uno o más campos?

```

```sql
-- Encontrar el modelo de coche más caro.
-- Cosas que debo de tener en cuenta: MAX

```

7. Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.

    ```sql
    SELECT id_cliente, COUNT(id_coche) FROM Ventas GROUP BY id_cliente;

    SELECT Cl.nombre, COUNT(Cl.id_cliente) AS Compras
    FROM Clientes Cl
    WHERE Cl.id_cliente IN (
        SELECT V.id_cliente
        FROM Ventas V
    )
    GROUP BY Cl.id_cliente;
    ```
```sql
-- Encontrar los clientes que han comprado coches de la marca 'Toyota'.
-- Cosas que debo de tener en cuenta: Like | regexp | =. Tabla normalizada ?.

```

```sql
-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.

```

```sql
-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.

```

```sql
-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.

```

```sql
-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
-- Cosas que debo de tener en cuenta: AVG

```

```sql
-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas.
-- Cosas que debo de tener en cuenta: COUNT| DESC|ASC precio

```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
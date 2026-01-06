## <img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T07_Ejercicios_de_normalizacion/Assets/Images/Computer.png" width="24" height="24"> Ejercicios de Normalización de Bases de Datos

1. [Ejercicio 1: Lista de Productos](#ejercicio-1-lista-de-productos)
2. [Ejercicio 2: Pedidos de Clientes](#ejercicio-2-pedidos-de-clientes)
3. [Ejercicio 3: Registro de Empleados](#ejercicio-3-registro-de-empleados)
4. [Ejercicio 4: Reservas de Hotel](#ejercicio-4-reservas-de-hotel)
5. [Ejercicio 5: Inscripciones a Cursos](#ejercicio-5-inscripciones-a-cursos)
6. [Ejercicio 6: Ventas de Tienda](#ejercicio-6-ventas-de-tienda)
7. [Ejercicio 7: Biblioteca de Libros](#ejercicio-7-biblioteca-de-libros)
8. [Ejercicio 8: Facturación de Servicios](#ejercicio-8-facturación-de-servicios)
9. [Ejercicio 9: Gestión de Vehículos](#ejercicio-9-gestión-de-vehículos)
10. [Ejercicio 10: Gestión de Proyectos](#ejercicio-10-gestión-de-proyectos)

#### **Ejercicio 1**: Lista de Productos

- Aplicar **1FN**, separando valores multivaluados en la columna "proveedor".
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.
- Aplicar **3FN**, únicamente si es necesario.

<details>
<summary>Tabla</summary>

| id_producto | nombre_producto | proveedor | categoria  | precio |
| :---------: | :-------------- | :-------- | :--------- | :----: |
| 1           | Laptop          | Dell, HP  | Tecnología | 1000   |
| 2           | Mouse           | Logitech  | Accesorios | 25     |
</details>
<details>
<summary>1FN</summary>

| id_producto | nombre_producto | proveedor | categoria  | precio |
| :---------: | :-------------- | :-------- | :--------- | :----: |
| 1           | Laptop          | Dell      | Tecnología | 1000   |
| 1           | Laptop          | HP        | Tecnología | 1000   |
| 2           | Mouse           | Logitech  | Accesorios | 25     |
</details>
<details>
<summary>2FN</summary>

| id_producto | nombre_producto | categoria  | precio |
| :---------: | :-------------- | :--------- | :----: |
| 1           | Laptop          | Tecnología | 1000   |
| 2           | Mouse           | Accesorios | 25     |

| nif_proveedor | nombre_proveedor |
| :-----------: | :--------------- |
| 12345678A     | Dell             |
| 23456789B     | HP               |
| 34567890C     | Logitech         |

| id_producto | nif_proveedor |
| :---------: | :-----------: |
| 1           | 12345678A     |
| 1           | 23456789B     |
| 2           | 34567890C     |
</details>
<details>
<summary>3FN</summary>

| id_categoria | nombre_categoria |
| :----------: | :--------------- |
| 1            | Tecnología       |
| 2            | Accesorios       |

| id_producto | id_categoria | nombre_producto | precio |
| :---------: | :----------: | :-------------- | :----: |
| 1           | 1            | Laptop          | 1000   |
| 2           | 2            | Mouse           | 25     |

| nif_proveedor | nombre_proveedor |
| :-----------: | :--------------- |
| 12345678A     | Dell             |
| 23456789B     | HP               |
| 34567890C     | Logitech         |

| id_producto | nif_proveedor |
| :---------: | :-----------: |
| 1           | 12345678A     |
| 1           | 23456789B     |
| 2           | 34567890C     |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T07_Ejercicios_de_normalizacion/Assets/Diagrams/Exported/lista_de_productos.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╦╗┌─┐┌┬┐┌─┐┌┐ ┌─┐┌─┐┌─┐
--   ║║├─┤ │ ├─┤├┴┐├─┤└─┐├┤ 
--  ═╩╝┴ ┴ ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

-- Eliminar la base de datos si ya existe.
DROP DATABASE IF EXISTS lista_de_productos_db;

-- Crear la base de datos.
CREATE DATABASE lista_de_productos_db;

-- Seleccionar la base de datos a usar.
USE lista_de_productos_db;

--  ╔╦╗┬─┐┌─┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--   ║║├┬┘│ │├─┘   ║ ├─┤├┴┐│  ├┤ 
--  ═╩╝┴└─└─┘┴     ╩ ┴ ┴└─┘┴─┘└─┘

-- Eliminar las tablas si ya existen (para evitar errores al crear las tablas).
DROP TABLE IF EXISTS Producto_Proveedor;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Proveedores;
DROP TABLE IF EXISTS Categorias;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Categorias".
CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    CONSTRAINT Unica_Categoria UNIQUE (nombre_categoria) -- Aseguramos que no haya duplicados en la columna "nombre_categoria".
);

-- Crear tabla "Productos".
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

-- Crear tabla "Proveedores".
CREATE TABLE Proveedores (
    nif_proveedor VARCHAR(9) PRIMARY KEY,
    nombre_proveedor VARCHAR(100) NOT NULL,
    CONSTRAINT Unico_Proveedor UNIQUE (nombre_proveedor)
);

-- Crear tabla intermedia "Producto_Proveedor".
CREATE TABLE Producto_Proveedor (
    id_producto INT,
    nif_proveedor VARCHAR(9),
    PRIMARY KEY (id_producto, nif_proveedor),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (nif_proveedor) REFERENCES Proveedores(nif_proveedor)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Categorias".
INSERT INTO Categorias (nombre_categoria)
VALUES
    ('Tecnología'),
    ('Accesorios');

-- Insertar en la tabla "Productos".
INSERT INTO Productos (id_categoria, nombre_producto, precio)
VALUES
    (1, 'Laptop', 1000.00),
    (2, 'Mouse', 25.00);

-- Insertar en la tabla "Proveedores".
INSERT INTO Proveedores (nif_proveedor, nombre_proveedor)
VALUES
    ('12345678A', 'Dell'),
    ('23456789B', 'HP'),
    ('34567890C', 'Logitech');

-- Insertar en la tabla intermedia "Producto_Proveedor".
INSERT INTO Producto_Proveedor (id_producto, nif_proveedor)
VALUES
    (1, '12345678A'), -- Laptop de 1000.00 euros suministrada por Dell.
    (1, '23456789B'), -- Laptop de 1000.00 euros suministrada por HP.
    (2, '34567890C'); -- Mouse de 25.00 euros suministrado por Logitech.
```
</details>

---

#### **Ejercicio 2**: Pedidos de Clientes

- Aplicar **1FN**, separando valores multivaluados.
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.
- Aplicar **3FN**, únicamente si es necesario.

<details>
<summary>Tabla</summary>

| id_pedido | cliente    | direccion   | producto | precio | cantidad | costo_total |
| :-------: | :--------- | :---------- | :------- | :----: | :------: | :---------: |
| 1         | Juan Pérez | Calle 123   | Laptop   | 1000   | 1        | 1000        |
| 2         | Ana López  | Av. Central | Teclado  | 25     | 2        | 50          |
</details>
<details>
<summary>1FN</summary>

| id_pedido | nombre_cliente | apellido_cliente | direccion   | producto | precio | cantidad | costo_total |
| :-------: | :------------- | :--------------- | :---------- | :------- | :----: | :------: | :---------: |
| 1         | Juan           | Pérez            | Calle 123   | Laptop   | 1000   | 1        | 1000        |
| 2         | Ana            | López            | Av. Central | Teclado  | 25     | 2        | 50          |
</details>
<details>
<summary>2FN</summary>

| dni_cliente | nombre_cliente | apellido_cliente | direccion   |
| :---------: | :------------- | :--------------- | :---------- |
| 12345678A   | Juan           | Pérez            | Calle 123   |
| 23456789B   | Ana            | López            | Av. Central |

| id_producto | nombre_producto | precio |
| :---------: | :-------------- | :----: |
| 1           | Laptop          | 1000   |
| 2           | Teclado         | 25     |

| id_pedido | dni_cliente | id_producto | cantidad | costo_total |
| :-------: | :---------: | :---------: | :------: | :---------: |
| 1         | 12345678A   | 1           | 1        | 1000        |
| 2         | 23456789B   | 2           | 2        | 50          |
</details>
<details>
<summary>3FN</summary>

| id_direccion | nombre_direccion |
| :----------: | :--------------- |
| 1            | Calle 123        |
| 2            | Av. Central      |

| dni_cliente | id_direccion | nombre_cliente | apellido_cliente |
| :---------: | :----------: | :------------- | :--------------- |
| 12345678A   | 1            | Juan           | Pérez            |
| 23456789B   | 2            | Ana            | López            |

| id_producto | nombre_producto | precio |
| :---------: | :-------------- | :----: |
| 1           | Laptop          | 1000   |
| 2           | Teclado         | 25     |

| id_pedido | dni_cliente | id_producto | cantidad | costo_total |
| :-------: | :---------: | :---------: | :------: | :---------: |
| 1         | 12345678A   | 1           | 1        | 1000        |
| 2         | 23456789B   | 2           | 2        | 50          |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T07_Ejercicios_de_normalizacion/Assets/Diagrams/Exported/pedidos_de_clientes.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╦╗┌─┐┌┬┐┌─┐┌┐ ┌─┐┌─┐┌─┐
--   ║║├─┤ │ ├─┤├┴┐├─┤└─┐├┤ 
--  ═╩╝┴ ┴ ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

-- Eliminar la base de datos si ya existe.
DROP DATABASE IF EXISTS pedidos_de_clientes_db;

-- Crear la base de datos.
CREATE DATABASE pedidos_de_clientes_db;

-- Seleccionar la base de datos a usar.
USE pedidos_de_clientes_db;

--  ╔╦╗┬─┐┌─┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--   ║║├┬┘│ │├─┘   ║ ├─┤├┴┐│  ├┤ 
--  ═╩╝┴└─└─┘┴     ╩ ┴ ┴└─┘┴─┘└─┘

-- Eliminar las tablas si ya existen (para evitar errores al crear las tablas).
DROP TABLE IF EXISTS Pedidos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Direcciones;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Direcciones".
CREATE TABLE Direcciones (
    id_direccion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_direccion VARCHAR(255) NOT NULL,
    CONSTRAINT Unica_Direccion UNIQUE (nombre_direccion)
);

-- Crear tabla "Clientes".
CREATE TABLE Clientes (
    dni_cliente VARCHAR(9) PRIMARY KEY,
    id_direccion INT,
    nombre_cliente VARCHAR(100) NOT NULL,
    apellido_cliente VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_direccion) REFERENCES Direcciones(id_direccion)
);

-- Crear tabla "Productos".
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

-- Crear tabla "Pedidos".
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    dni_cliente VARCHAR(9),
    id_producto INT,
    cantidad INT NOT NULL,
    costo_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (dni_cliente) REFERENCES Clientes(dni_cliente),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Direcciones".
INSERT INTO Direcciones (nombre_direccion)
VALUES
    ('Calle 123'),
    ('Av. Central');

-- Insertar en la tabla "Clientes".
INSERT INTO Clientes (dni_cliente, id_direccion, nombre_cliente, apellido_cliente)
VALUES
    ('12345678A', 1, 'Juan', 'Pérez'),
    ('23456789B', 2, 'Ana', 'López');

-- Insertar en la tabla "Productos".
INSERT INTO Productos (nombre_producto, precio)
VALUES
    ('Laptop', 1000.00),
    ('Teclado', 25.00);

-- Crear disparador para calcular el costo total del pedido antes de insertar en la tabla "Pedidos".
DELIMITER $$

CREATE TRIGGER Calcular_Costo_Total
BEFORE INSERT ON Pedidos
FOR EACH ROW
BEGIN
    DECLARE temp_precio DECIMAL(10,2);
    
    -- Obtenemos el precio del producto.
    SELECT precio INTO temp_precio
    FROM Productos
    WHERE id_producto = NEW.id_producto;

    -- Calculamos el costo total del pedido.
    SET NEW.costo_total = NEW.cantidad * temp_precio;
END $$

DELIMITER ;

-- Insertar en la tabla "Pedidos".
INSERT INTO Pedidos (dni_cliente, id_producto, cantidad)
VALUES
    ('12345678A', 1, 1), -- Juan Pérez pide un Laptop por 1000.00 euros.
    ('23456789B', 2, 2); -- Ana López pide dos Teclados por 50.00 euros.
```
</details>

---

#### **Ejercicio 3**: Registro de Empleados

- Aplicar **1FN**, separando valores multivaluados en la columna "telefono".
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.
- Aplicar **3FN**, únicamente si es necesario.

<details>
<summary>Tabla</summary>

| id_empleado | nombre    | telefono             | departamento |
| :---------: | :-------- | :------------------: | :----------- |
| 1           | Carlos R. | 912345678, 722345678 | Ventas       |
| 2           | Laura M.  | 612345678            | Finanzas     |
</details>
<details>
<summary>1FN</summary>

| id_empleado | nombre_empleado | apellido_empleado | telefono  | departamento |
| :---------: | :-------------- | :---------------- | :-------: | :----------- |
| 1           | Carlos          | R.                | 912345678 | Ventas       |
| 1           | Carlos          | R.                | 722345678 | Ventas       |
| 2           | Laura           | M.                | 612345678 | Finanzas     |
</details>
<details>
<summary>2FN</summary>

| id_departamento | nombre_departamento |
| :-------------: | :------------------ |
| 1               | Ventas              |
| 2               | Finanzas            |

| id_empleado | id_departamento | nombre_empleado | apellido_empleado |
| :---------: | :-------------: | :-------------- | :---------------- |
| 1           | 1               | Carlos          | R.                |
| 2           | 2               | Laura           | M.                |

| telefono  | id_empleado |
| :-------: | :---------: |
| 912345678 | 1           |
| 722345678 | 1           |
| 612345678 | 2           |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T07_Ejercicios_de_normalizacion/Assets/Diagrams/Exported/registro_de_empleados.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╦╗┌─┐┌┬┐┌─┐┌┐ ┌─┐┌─┐┌─┐
--   ║║├─┤ │ ├─┤├┴┐├─┤└─┐├┤ 
--  ═╩╝┴ ┴ ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

-- Eliminar la base de datos si ya existe.
DROP DATABASE IF EXISTS registro_de_empleados_db;

-- Crear la base de datos.
CREATE DATABASE registro_de_empleados_db;

-- Seleccionar la base de datos a usar.
USE registro_de_empleados_db;

--  ╔╦╗┬─┐┌─┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--   ║║├┬┘│ │├─┘   ║ ├─┤├┴┐│  ├┤ 
--  ═╩╝┴└─└─┘┴     ╩ ┴ ┴└─┘┴─┘└─┘

-- Eliminar las tablas si ya existen (para evitar errores al crear las tablas).
DROP TABLE IF EXISTS Telefonos;
DROP TABLE IF EXISTS Empleados;
DROP TABLE IF EXISTS Departamentos;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Departamentos".
CREATE TABLE Departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_departamento VARCHAR(50) NOT NULL,
    CONSTRAINT Unico_Departamento UNIQUE (nombre_departamento)
);

-- Crear tabla "Empleados".
CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    id_departamento INT,
    nombre_empleado VARCHAR(100) NOT NULL,
    apellido_empleado VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

-- Crear tabla "Telefonos".
CREATE TABLE Telefonos (
    telefono CHAR(9) PRIMARY KEY,
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Departamentos".
INSERT INTO Departamentos (nombre_departamento)
VALUES
    ('Ventas'),
    ('Finanzas');

-- Insertar en la tabla "Empleados".
INSERT INTO Empleados (id_departamento, nombre_empleado, apellido_empleado)
VALUES
    (1, 'Carlos', 'R.'),
    (2, 'Laura', 'M.');

-- Insertar en la tabla "Telefonos".
INSERT INTO Telefonos (telefono, id_empleado)
VALUES
    ('912345678', 1),  -- Carlos R. tiene el teléfono 912345678
    ('722345678', 1),  -- Carlos R. tiene el teléfono 722345678
    ('612345678', 2);  -- Laura M. tiene el teléfono 612345678
```
</details>

> [!NOTE]
> 
> Se ha establecido que los números de teléfono deben ser únicos y que cada empleado debe contar con su propio número de teléfono.

---

#### **Ejercicio 4**: Reservas de Hotel

- Aplicar **1FN**, separando valores multivaluados en la columna "fecha".
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| id_reserva | cliente  | habitacion | fecha                              | precio |
| :--------: | :------- | :--------: | :--------------------------------: | :----: |
| 5001       | Pedro G. | 101        | 2025-02-01, 2025-02-02, 2025-02-03 | 300    |
| 5002       | María T. | 202        | 2025-03-10, 2025-03-11             | 200    |
</details>
<details>
<summary>1FN</summary>

| id_reserva | cliente  | habitacion | fecha      | precio |
| :--------: | :------- | :--------: | :--------: | :----: |
| 5001       | Pedro G. | 101        | 2025-02-01 | 300    |
| 5001       | Pedro G. | 101        | 2025-02-02 | 300    |
| 5001       | Pedro G. | 101        | 2025-02-03 | 300    |
| 5002       | María T. | 202        | 2025-03-10 | 200    |
| 5002       | María T. | 202        | 2025-03-11 | 200    |
</details>
<details>
<summary>2FN</summary>

| id_cliente | nombre   |
| :--------: | :------- |
| 1          | Pedro G. |
| 2          | María T. |

| id_reserva | id_cliente | habitacion | precio |
| :--------: | :--------: | :--------: | :----: |
| 5001       | 1          | 101        | 300    |
| 5002       | 2          | 202        | 200    |

| fecha      | id_reserva |
| :--------: | :--------: |
| 2025-02-01 | 5001       |
| 2025-02-02 | 5001       |
| 2025-02-03 | 5001       |
| 2025-03-10 | 5002       |
| 2025-03-11 | 5002       |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T07_Ejercicios_de_normalizacion/Assets/Diagrams/Exported/reservas_de_hotel.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╦╗┌─┐┌┬┐┌─┐┌┐ ┌─┐┌─┐┌─┐
--   ║║├─┤ │ ├─┤├┴┐├─┤└─┐├┤ 
--  ═╩╝┴ ┴ ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

-- Eliminar la base de datos si ya existe.
DROP DATABASE IF EXISTS reservas_de_hotel_db;

-- Crear la base de datos.
CREATE DATABASE reservas_de_hotel_db;

-- Seleccionar la base de datos a usar.
USE reservas_de_hotel_db;

--  ╔╦╗┬─┐┌─┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--   ║║├┬┘│ │├─┘   ║ ├─┤├┴┐│  ├┤ 
--  ═╩╝┴└─└─┘┴     ╩ ┴ ┴└─┘┴─┘└─┘

-- Eliminar las tablas si ya existen (para evitar errores al crear las tablas).
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Reservas;
DROP TABLE IF EXISTS Fechas;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Clientes".
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL
);

-- Crear tabla "Reservas".
CREATE TABLE Reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    habitacion INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Crear tabla "Fechas".
CREATE TABLE Fechas (
    fecha DATE,
    id_reserva INT,
    PRIMARY KEY (fecha, id_reserva),
    FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Clientes".
INSERT INTO Clientes (id_cliente, nombre_cliente)
VALUES
    (1, 'Pedro G.'),
    (2, 'María T.');

-- Insertar en la tabla "Reservas".
INSERT INTO Reservas (id_reserva, id_cliente, habitacion, precio)
VALUES
    (5001, 1, 101, 300.00), -- Pedro G. ha reservado la habitación 101 por 300.00 euros.
    (5002, 2, 202, 200.00); -- María T. ha reservado la habitación 202 por 200.00 euros.

-- Insertar en la tabla "Fechas".
INSERT INTO Fechas (fecha, id_reserva)
VALUES
    ('2025-02-01', 5001),
    ('2025-02-02', 5001),
    ('2025-02-03', 5001),
    ('2025-03-10', 5002),
    ('2025-03-11', 5002);
```
</details>

---

#### **Ejercicio 5**: Inscripciones a Cursos

- Aplicar **1FN**, separando valores multivaluados en la columna "horario".
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| id_inscripcion | estudiante | curso       | profesor    | horario                   |
| :------------: | :--------- | :---------- | :---------- | :------------------------ |
| 3001           | Luis R.    | Matemáticas | Prof. Pérez | Lunes 10AM, Miércoles 2PM |
| 3002           | Ana S.     | Física      | Prof. Gómez | Martes 3PM                |
</details>
<details>
<summary>1FN</summary>

| id_inscripcion | estudiante | curso       | profesor    | horario       |
| :------------: | :--------- | :---------- | :---------- | :------------ |
| 3001           | Luis R.    | Matemáticas | Prof. Pérez | Lunes 10AM    |
| 3001           | Luis R.    | Matemáticas | Prof. Pérez | Miércoles 2PM |
| 3002           | Ana S.     | Física      | Prof. Gómez | Martes 3PM    |
</details>
<details>
<summary>2FN</summary>

| id_estudiante | nombre_estudiante |
| :-----------: | :---------------- |
| 1             | Luis R.           |
| 2             | Ana S.            |

| id_curso | nombre_curso | nombre_profesor |
| :------: | :----------- | :-------------- |
| 1        | Matemáticas  | Prof. Pérez     |
| 2        | Física       | Prof. Gómez     |

| id_inscripcion | id_estudiante | id_curso |
| :------------: | :-----------: | :------: |
| 3001           | 1             | 1        |
| 3002           | 2             | 2        |

| dia       | hora     | id_inscripcion |
| :-------- | :------: | :------------: |
| Lunes     | 10:00:00 | 3001           |
| Miércoles | 14:00:00 | 3001           |
| Martes    | 15:00:00 | 3002           |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T07_Ejercicios_de_normalizacion/Assets/Diagrams/Exported/inscripciones_a_cursos.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╦╗┌─┐┌┬┐┌─┐┌┐ ┌─┐┌─┐┌─┐
--   ║║├─┤ │ ├─┤├┴┐├─┤└─┐├┤ 
--  ═╩╝┴ ┴ ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

-- Eliminar la base de datos si ya existe.
DROP DATABASE IF EXISTS inscripciones_a_cursos_db;

-- Crear la base de datos.
CREATE DATABASE inscripciones_a_cursos_db;

-- Seleccionar la base de datos a usar.
USE inscripciones_a_cursos_db;

--  ╔╦╗┬─┐┌─┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--   ║║├┬┘│ │├─┘   ║ ├─┤├┴┐│  ├┤ 
--  ═╩╝┴└─└─┘┴     ╩ ┴ ┴└─┘┴─┘└─┘

-- Eliminar las tablas si ya existen (para evitar errores al crear las tablas).
DROP TABLE IF EXISTS Estudiantes;
DROP TABLE IF EXISTS Cursos;
DROP TABLE IF EXISTS Inscripciones;
DROP TABLE IF EXISTS Horarios;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Estudiantes".
CREATE TABLE Estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estudiante VARCHAR(100) NOT NULL
);

-- Crear tabla "Cursos".
CREATE TABLE Cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    nombre_profesor VARCHAR(100) NOT NULL
);

-- Crear tabla "Inscripciones".
CREATE TABLE Inscripciones (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

-- Crear tabla "Horarios".
CREATE TABLE Horarios (
    dia VARCHAR(20) NOT NULL,
    hora TIME NOT NULL,
    id_inscripcion INT,
    PRIMARY KEY (dia, hora, id_inscripcion),
    FOREIGN KEY (id_inscripcion) REFERENCES Inscripciones(id_inscripcion)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Estudiantes".
INSERT INTO Estudiantes (id_estudiante, nombre_estudiante)
VALUES
    (1, 'Luis R.'),
    (2, 'Ana S.');

-- Insertar en la tabla "Cursos".
INSERT INTO Cursos (id_curso, nombre_curso, nombre_profesor)
VALUES
    (1, 'Matemáticas', 'Prof. Pérez'),
    (2, 'Física', 'Prof. Gómez');

-- Insertar en la tabla "Inscripciones".
INSERT INTO Inscripciones (id_inscripcion, id_estudiante, id_curso)
VALUES
    (3001, 1, 1), -- Luis R. se inscribe en Matemáticas con Prof. Pérez.
    (3002, 2, 2); -- Ana S. se inscribe en Física con Prof. Gómez.

-- Insertar en la tabla "Horarios".
INSERT INTO Horarios (dia, hora, id_inscripcion)
VALUES
    ('Lunes', '10:00:00', 3001),
    ('Miércoles', '14:00:00', 3001),
    ('Martes', '15:00:00', 3002);
```
</details>

---

#### **Ejercicio 6**: Ventas de Tienda

- Aplicar **1FN**, separando valores multivaluados en la columna "producto_comprado".
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| id_venta | cliente   | producto_comprado | costo_total |
| :------: | :-------- | :---------------- | :---------: |
| 8001     | Juan P.   | Celular, Funda    | 500         |
| 8002     | Andrea M. | Laptop            | 1000        |
</details>
<details>
<summary>1FN</summary>

| id_venta | cliente   | producto_comprado | costo_total |
| :------: | :-------- | :---------------- | :---------: |
| 8001     | Juan P.   | Celular           | 500         |
| 8001     | Juan P.   | Funda             | 500         |
| 8002     | Andrea M. | Laptop            | 1000        |
</details>
<details>
<summary>2FN</summary>

| id_cliente | nombre_cliente |
| :--------: | :------------- |
| 1          | Juan P.        |
| 2          | Andrea M.      |

| id_venta | id_cliente | costo_total |
| :------: | :--------- | :---------: |
| 8001     | 1          | 500         |
| 8002     | 2          | 1000        |

| id_producto | nombre_producto | precio |
| :---------: | :-------------- | :----: |
| 1           | Celular         | 490    |
| 2           | Funda           | 10     |
| 3           | Laptop          | 1000   |

| id_venta | id_producto |
| :------: | :---------: |
| 8001     | 1           |
| 8001     | 2           |
| 8002     | 3           |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T07_Ejercicios_de_normalizacion/Assets/Diagrams/Exported/ventas_de_tienda.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╦╗┌─┐┌┬┐┌─┐┌┐ ┌─┐┌─┐┌─┐
--   ║║├─┤ │ ├─┤├┴┐├─┤└─┐├┤ 
--  ═╩╝┴ ┴ ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

-- Eliminar la base de datos si ya existe.
DROP DATABASE IF EXISTS ventas_de_tienda_db;

-- Crear la base de datos.
CREATE DATABASE ventas_de_tienda_db;

-- Seleccionar la base de datos a usar.
USE ventas_de_tienda_db;

--  ╔╦╗┬─┐┌─┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--   ║║├┬┘│ │├─┘   ║ ├─┤├┴┐│  ├┤ 
--  ═╩╝┴└─└─┘┴     ╩ ┴ ┴└─┘┴─┘└─┘

-- Eliminar las tablas si ya existen (para evitar errores al crear las tablas).
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Venta_Producto;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Clientes".
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL
);

-- Crear tabla "Ventas".
CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    costo_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Crear tabla "Productos".
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

-- Crear tabla "Venta_Producto".
CREATE TABLE Venta_Producto (
    id_venta INT,
    id_producto INT,
    PRIMARY KEY (id_venta, id_producto),
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Clientes".
INSERT INTO Clientes (id_cliente, nombre_cliente)
VALUES
    (1, 'Juan P.'),
    (2, 'Andrea M.');

-- Insertar en la tabla "Ventas".
INSERT INTO Ventas (id_venta, id_cliente, costo_total)
VALUES
    (8001, 1, 500.00),
    (8002, 2, 1000.00);

-- Insertar en la tabla "Productos".
INSERT INTO Productos (id_producto, nombre_producto, precio)
VALUES
    (1, 'Celular', 490.00),
    (2, 'Funda', 10.00),
    (3, 'Laptop', 1000.00);

-- Insertar en la tabla "Venta_Producto".
INSERT INTO Venta_Producto (id_venta, id_producto)
VALUES
    (8001, 1), -- Juan P. compra un Celular por 490.00 euros.
    (8001, 2), -- Juan P. compra una Funda por 10.00 euros.
    (8002, 3); -- Andrea M. compra un Laptop por 1000.00 euros.
```
</details>

---

#### **Ejercicio 7**: Biblioteca de Libros

- Aplicar **1FN**, separando valores multivaluados en la columna "autor".
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| id_libro | titulo     | autor     | genero          |
| :------: | :--------- | :-------- | :-------------- |
| 101      | El Quijote | Cervantes | Novela          |
| 102      | 1984       | Orwell    | Ciencia Ficción |
</details>
<details>
<summary>1FN</summary>

| id_libro | titulo     | autor     | genero          |
| :------: | :--------- | :-------- | :-------------- |
| 101      | El Quijote | Cervantes | Novela          |
| 102      | 1984       | Orwell    | Ciencia Ficción |
</details>
<details>
<summary>2FN</summary>

| id_libro | titulo     | genero          |
| :------: | :--------- | :-------------- |
| 101      | El Quijote | Novela          |
| 102      | 1984       | Ciencia Ficción |

| id_autor | nombre_autor |
| :------: | :----------- |
| 1        | Cervantes    |
| 2        | Orwell       |

| id_libro | id_autor |
| :------: | :------: |
| 101      | 1        |
| 102      | 2        |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T07_Ejercicios_de_normalizacion/Assets/Diagrams/Exported/biblioteca_de_libros.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╦╗┌─┐┌┬┐┌─┐┌┐ ┌─┐┌─┐┌─┐
--   ║║├─┤ │ ├─┤├┴┐├─┤└─┐├┤ 
--  ═╩╝┴ ┴ ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

-- Eliminar la base de datos si ya existe.
DROP DATABASE IF EXISTS biblioteca_de_libros_db;

-- Crear la base de datos.
CREATE DATABASE biblioteca_de_libros_db;

-- Seleccionar la base de datos a usar.
USE biblioteca_de_libros_db;

--  ╔╦╗┬─┐┌─┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--   ║║├┬┘│ │├─┘   ║ ├─┤├┴┐│  ├┤ 
--  ═╩╝┴└─└─┘┴     ╩ ┴ ┴└─┘┴─┘└─┘

-- Eliminar las tablas si ya existen (para evitar errores al crear las tablas).
DROP TABLE IF EXISTS Libros;
DROP TABLE IF EXISTS Autores;
DROP TABLE IF EXISTS Libro_Autor;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Libros".
CREATE TABLE Libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    genero VARCHAR(100) NOT NULL
);

-- Crear tabla "Autores".
CREATE TABLE Autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_autor VARCHAR(255) NOT NULL
);

-- Crear tabla "Libro_Autor".
CREATE TABLE Libro_Autor (
    id_libro INT,
    id_autor INT,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro),
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Libros".
INSERT INTO Libros (id_libro, titulo, genero) 
VALUES 
    (101, 'El Quijote', 'Novela'),
    (102, '1984', 'Ciencia Ficción');

-- Insertar en la tabla "Autores".
INSERT INTO Autores (id_autor, nombre_autor) 
VALUES 
    (1, 'Cervantes'),
    (2, 'Orwell');

-- Insertar en la tabla "Libro_Autor".
INSERT INTO Libro_Autor (id_libro, id_autor) 
VALUES 
    (101, 1),  -- La novela El Quijote tiene como autor a Cervantes.
    (102, 2);  -- El libro de ciencia ficción 1984 tiene como autor a Orwell.
```
</details>

---

#### **Ejercicio 8**: Facturación de Servicios

- Aplicar **1FN**, separando valores multivaluados en la columna "servicio_contratado".
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| id_factura | cliente | servicio_contratado | costo_total |
| :--------: | :------ | :------------------ | :---------: |
| 9001       | Juan P. | Internet, TV        | 50          |
| 9002       | Ana M.  | Teléfono            | 20          |
</details>
<details>
<summary>1FN</summary>

| id_factura | cliente | servicio_contratado | costo_total |
| :--------: | :------ | :------------------ | :---------: |
| 9001       | Juan P. | Internet            | 10          |
| 9001       | Juan P. | TV                  | 40          |
| 9002       | Ana M.  | Teléfono            | 20          |
</details>
<details>
<summary>2FN</summary>

| id_cliente | nombre_cliente |
| :--------: | :------------- |
| 1          | Juan P.        |
| 2          | Ana M.         |

| id_factura | id_cliente | costo_total |
| :--------: | :--------: | :---------: |
| 9001       | 1          | 50          |
| 9002       | 2          | 20          |

| id_servicio | nombre_servicio | precio |
| :---------: | :-------------- | :----: |
| 1           | Internet        | 10     |
| 2           | TV              | 40     |
| 3           | Teléfono        | 20     |

| id_factura | id_servicio |
| :--------: | :---------: |
| 9001       | 1           |
| 9001       | 2           |
| 9002       | 3           |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T07_Ejercicios_de_normalizacion/Assets/Diagrams/Exported/facturacion_de_servicios.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╦╗┌─┐┌┬┐┌─┐┌┐ ┌─┐┌─┐┌─┐
--   ║║├─┤ │ ├─┤├┴┐├─┤└─┐├┤ 
--  ═╩╝┴ ┴ ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

-- Eliminar la base de datos si ya existe.
DROP DATABASE IF EXISTS facturacion_de_servicios_db;

-- Crear la base de datos.
CREATE DATABASE facturacion_de_servicios_db;

-- Seleccionar la base de datos a usar.
USE facturacion_de_servicios_db;

--  ╔╦╗┬─┐┌─┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--   ║║├┬┘│ │├─┘   ║ ├─┤├┴┐│  ├┤ 
--  ═╩╝┴└─└─┘┴     ╩ ┴ ┴└─┘┴─┘└─┘

-- Eliminar las tablas si ya existen (para evitar errores al crear las tablas).
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Facturas;
DROP TABLE IF EXISTS Servicios;
DROP TABLE IF EXISTS Factura_Servicio;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Clientes".
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL
);

-- Crear tabla "Facturas".
CREATE TABLE Facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    costo_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Crear tabla "Servicios".
CREATE TABLE Servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_servicio VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    CONSTRAINT Unico_Servicio UNIQUE (nombre_servicio)
);

-- Crear tabla "Factura_Servicio".
CREATE TABLE Factura_Servicio (
    id_factura INT,
    id_servicio INT,
    PRIMARY KEY (id_factura, id_servicio),
    FOREIGN KEY (id_factura) REFERENCES Facturas(id_factura),
    FOREIGN KEY (id_servicio) REFERENCES Servicios(id_servicio)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Clientes".
INSERT INTO Clientes (id_cliente, nombre_cliente)
VALUES
    (1, 'Juan P.'),
    (2, 'Ana M.');

-- Insertar en la tabla "Facturas".
INSERT INTO Facturas (id_factura, id_cliente, costo_total)
VALUES
    (9001, 1, 50.00),
    (9002, 2, 20.00);

-- Insertar en la tabla "Servicios".
INSERT INTO Servicios (id_servicio, nombre_servicio, precio)
VALUES
    (1, 'Internet', 10.00),
    (2, 'TV', 40.00),
    (3, 'Teléfono', 20.00);

-- Insertar en la tabla "Factura_Servicio".
INSERT INTO Factura_Servicio (id_factura, id_servicio)
VALUES
    (9001, 1), -- Juan P. ha pagado 10.00 euros por el servicio: Internet.
    (9001, 2), -- Juan P. ha pagado 40.00 euros por el servicio: TV.
    (9002, 3); -- Ana M. ha pagado 20.00 euros por el servicio: Teléfono.
```
</details>

---

#### **Ejercicio 9**: Gestión de Vehículos

- Aplicar **1FN**, separando valores multivaluados en la columna "modelo".
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| id_vehiculo | marca  | modelo         | anio  |
| :---------: | :----- | :------------- | :---: |
| 5001        | Toyota | Corolla, Yaris | 2022  |
| 5002        | Honda  | Civic          | 2023  |
</details>
<details>
<summary>1FN</summary>

| id_vehiculo | marca  | modelo  | anio  |
| :---------: | :----- | :------ | :---: |
| 5001        | Toyota | Corolla | 2022  |
| 5002        | Toyota | Yaris   | 2022  |
| 5003        | Honda  | Civic   | 2023  |
</details>
<details>
<summary>2FN</summary>

| id_marca | nombre_marca |
| :------: | :----------- |
| 1        | Toyota       |
| 2        | Honda        |

| id_modelo | id_marca | nombre_modelo |
| :-------: | :------- | :------------ |
| 1         | 1        | Corolla       |
| 2         | 1        | Yaris         |
| 3         | 2        | Civic         |

| id_vehiculo | id_modelo | anio  |
| :---------: | :-------: | :---: |
| 5001        | 1         | 2022  |
| 5002        | 2         | 2022  |
| 5003        | 3         | 2023  |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T07_Ejercicios_de_normalizacion/Assets/Diagrams/Exported/gestion_de_vehiculos.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╦╗┌─┐┌┬┐┌─┐┌┐ ┌─┐┌─┐┌─┐
--   ║║├─┤ │ ├─┤├┴┐├─┤└─┐├┤ 
--  ═╩╝┴ ┴ ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

-- Eliminar la base de datos si ya existe.
DROP DATABASE IF EXISTS gestion_de_vehiculos_db;

-- Crear la base de datos.
CREATE DATABASE gestion_de_vehiculos_db;

-- Seleccionar la base de datos a usar.
USE gestion_de_vehiculos_db;

--  ╔╦╗┬─┐┌─┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--   ║║├┬┘│ │├─┘   ║ ├─┤├┴┐│  ├┤ 
--  ═╩╝┴└─└─┘┴     ╩ ┴ ┴└─┘┴─┘└─┘

-- Eliminar las tablas si ya existen (para evitar errores al crear las tablas).
DROP TABLE IF EXISTS Marcas;
DROP TABLE IF EXISTS Modelos;
DROP TABLE IF EXISTS Vehiculos;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Marcas".
CREATE TABLE Marcas (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre_marca VARCHAR(100) NOT NULL,
    CONSTRAINT Unica_Marca UNIQUE (nombre_marca)
);

-- Crear tabla "Modelos".
CREATE TABLE Modelos (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    id_marca INT,
    nombre_modelo VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES Marcas(id_marca),
    CONSTRAINT Unico_Modelo UNIQUE (nombre_modelo)
);

-- Crear tabla "Vehiculos".
CREATE TABLE Vehiculos (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_modelo INT,
    anio INT NOT NULL,
    FOREIGN KEY (id_modelo) REFERENCES Modelos(id_modelo)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Marcas".
INSERT INTO Marcas (id_marca, nombre_marca)
VALUES
    (1, 'Toyota'),
    (2, 'Honda');

-- Insertar en la tabla "Modelos".
INSERT INTO Modelos (id_modelo, id_marca, nombre_modelo)
VALUES
    (1, 1, 'Corolla'),
    (2, 1, 'Yaris'),
    (3, 2, 'Civic');

-- Insertar en la tabla "Vehiculos".
INSERT INTO Vehiculos (id_vehiculo, id_modelo, anio)
VALUES
    (5001, 1, 2022), -- Toyota Corolla del 2022.
    (5002, 2, 2022), -- Toyota Yaris del 2022.
    (5003, 3, 2023); -- Honda Civic del 2023.
```
</details>

---

#### **Ejercicio 10**: Gestión de Proyectos

- Aplicar **1FN**, separando valores multivaluados en la columna "miembro".
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| id_proyecto | nombre     | miembro      | presupuesto |
| :---------: | :--------- | :----------- | :---------: |
| 7001        | Web App    | Juan, Ana    | 5000        |
| 7002        | E-commerce | Pedro, María | 10000       |
</details>
<details>
<summary>1FN</summary>

| id_proyecto | nombre     | miembro      | presupuesto |
| :---------: | :--------- | :----------- | :---------: |
| 7001        | Web App    | Juan         | 5000        |
| 7001        | Web App    | Ana          | 5000        |
| 7002        | E-commerce | Pedro        | 10000       |
| 7002        | E-commerce | María        | 10000       |
</details>
<details>
<summary>2FN</summary>

| id_proyecto | nombre_proyecto | presupuesto |
| :---------: | :-------------- | :---------: |
| 7001        | Web App         | 5000        |
| 7002        | E-commerce      | 10000       |

| id_miembro | nombre_miembro |
| :--------: | :------------- |
| 1          | Juan           |
| 2          | Ana            |
| 3          | Pedro          |
| 4          | María          |

| id_proyecto | id_miembro |
| :---------: | :--------: |
| 7001        | 1          |
| 7001        | 2          |
| 7002        | 3          |
| 7002        | 4          |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/T07_Ejercicios_de_normalizacion/Assets/Diagrams/Exported/gestion_de_proyectos.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╦╗┌─┐┌┬┐┌─┐┌┐ ┌─┐┌─┐┌─┐
--   ║║├─┤ │ ├─┤├┴┐├─┤└─┐├┤ 
--  ═╩╝┴ ┴ ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

-- Eliminar la base de datos si ya existe.
DROP DATABASE IF EXISTS gestion_de_proyectos_db;

-- Crear la base de datos.
CREATE DATABASE gestion_de_proyectos_db;

-- Seleccionar la base de datos a usar.
USE gestion_de_proyectos_db;

--  ╔╦╗┬─┐┌─┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--   ║║├┬┘│ │├─┘   ║ ├─┤├┴┐│  ├┤ 
--  ═╩╝┴└─└─┘┴     ╩ ┴ ┴└─┘┴─┘└─┘

-- Eliminar las tablas si ya existen (para evitar errores al crear las tablas).
DROP TABLE IF EXISTS Proyectos;
DROP TABLE IF EXISTS Miembros;
DROP TABLE IF EXISTS Proyecto_Miembro;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Proyectos".
CREATE TABLE Proyectos (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(100) NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL
);

-- Crear tabla "Miembros".
CREATE TABLE Miembros (
    id_miembro INT AUTO_INCREMENT PRIMARY KEY,
    nombre_miembro VARCHAR(100) NOT NULL
);

-- Crear tabla "Proyecto_Miembro".
CREATE TABLE Proyecto_Miembro (
    id_proyecto INT,
    id_miembro INT,
    PRIMARY KEY (id_proyecto, id_miembro),
    FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto),
    FOREIGN KEY (id_miembro) REFERENCES Miembros(id_miembro)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Proyectos".
INSERT INTO Proyectos (id_proyecto, nombre_proyecto, presupuesto)
VALUES
    (7001, 'Web App', 5000.00),
    (7002, 'E-commerce', 10000.00);

-- Insertar en la tabla "Miembros".
INSERT INTO Miembros (id_miembro, nombre_miembro)
VALUES
    (1, 'Juan'),
    (2, 'Ana'),
    (3, 'Pedro'),
    (4, 'María');

-- Insertar en la tabla "Proyecto_Miembro".
INSERT INTO Proyecto_Miembro (id_proyecto, id_miembro)
VALUES
    (7001, 1), -- Juan forma parte del proyecto Web App con un presupuesto de 5000.00 euros.
    (7001, 2), -- Ana forma parte del proyecto Web App con un presupuesto de 5000.00 euros.
    (7002, 3), -- Pedro forma parte del proyecto E-commerce con un presupuesto de 10000.00 euros.
    (7002, 4); -- María forma parte del proyecto E-commerce con un presupuesto de 10000.00 euros.
```
</details>

---
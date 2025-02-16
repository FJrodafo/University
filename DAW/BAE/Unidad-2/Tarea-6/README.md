## <img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-5/Assets/Images/Computer.png" height="24"> Ejercicios de Normalización de Bases de Datos

## Índice

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

<details>
<summary>Tabla</summary>

| id_producto | nombre_producto | proveedor | categoria  | precio |
| :---------: | :-------------- | :-------- | :--------- | :----: |
| 1           | Laptop          | Dell, HP  | Tecnología | 1000   |
| 2           | Mouse           | Logitech  | Accesorios | 25     |
</details>
<details>
<summary>Solución 1FN</summary>

| id_producto | nombre_producto | proveedor | categoria  | precio |
| :---------: | :-------------- | :-------- | :--------- | :----: |
| 1           | Laptop          | Dell      | Tecnología | 1000   |
| 1           | Laptop          | HP        | Tecnología | 1000   |
| 2           | Mouse           | Logitech  | Accesorios | 25     |
</details>
<details>
<summary>Solución 2FN</summary>

| id_producto | nombre_producto | categoria  | precio |
| :---------: | :-------------- | :--------- | :----: |
| 1           | Laptop          | Tecnología | 1000   |
| 2           | Mouse           | Accesorios | 25     |

| id_proveedor | nombre_proveedor |
| :----------: | :--------------- |
| 1            | Dell             |
| 2            | HP               |
| 3            | Logitech         |

| id_producto | id_proveedor |
| :---------: | :----------: |
| 1           | 1            |
| 1           | 2            |
| 2           | 3            |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/Exported/lista_de_productos.drawio.svg">
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
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Proveedores;
DROP TABLE IF EXISTS Producto_Proveedor;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Productos".
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    CONSTRAINT Unico_Producto UNIQUE (nombre_producto) -- Aseguramos que no haya duplicados en productos (si aplica).
);

-- Crear tabla "Proveedores".
CREATE TABLE Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(100) NOT NULL,
    CONSTRAINT Unico_Proveedor UNIQUE (nombre_proveedor)
);

-- Crear tabla intermedia "Producto_Proveedor".
CREATE TABLE Producto_Proveedor (
    id_producto INT,
    id_proveedor INT,
    PRIMARY KEY (id_producto, id_proveedor),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Productos".
INSERT INTO Productos (id_producto, nombre_producto, categoria, precio)
VALUES
    (1, 'Laptop', 'Tecnología', 1000.00),
    (2, 'Mouse', 'Accesorios', 25.00);

-- Insertar en la tabla "Proveedores".
INSERT INTO Proveedores (id_proveedor, nombre_proveedor)
VALUES
    (1, 'Dell'),
    (2, 'HP'),
    (3, 'Logitech');

-- Insertar en la tabla intermedia "Producto_Proveedor".
INSERT INTO Producto_Proveedor (id_producto, id_proveedor)
VALUES
    (1, 1), -- Laptop suministrada por Dell.
    (1, 2), -- Laptop suministrada por HP.
    (2, 3); -- Mouse suministrado por Logitech.
```
</details>

> [!NOTE]
> 
> Se ha creado la tabla intermedia `Producto_Proveedor` para gestionar la relación de muchos a muchos entre productos y proveedores, asumiendo que un proveedor puede suministrar varios productos pertenecientes a distintas categorías.

> [!TIP]
> 
> Otra opción válida, considerando los datos proporcionados en este ejercicio, sería una relación **1:N**, donde cada proveedor solo pudiera suministrar productos de una categoría específica.

---

#### **Ejercicio 2**: Pedidos de Clientes

- Aplicar **1FN**, separando valores multivaluados.
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| id_pedido | cliente    | direccion   | producto | cantidad | precio |
| :-------: | :--------- | :---------- | :------- | :------: | :----: |
| 101       | Juan Pérez | Calle 123   | Laptop   | 1        | 1000   |
| 102       | Ana López  | Av. Central | Teclado  | 2        | 50     |
</details>
<details>
<summary>Solución 1FN</summary>

| id_pedido | cliente    | direccion   | producto | cantidad | precio |
| :-------: | :--------- | :---------- | :------- | :------: | :----: |
| 101       | Juan Pérez | Calle 123   | Laptop   | 1        | 1000   |
| 102       | Ana López  | Av. Central | Teclado  | 2        | 50     |
</details>
<details>
<summary>Solución 2FN</summary>

| id_cliente | nombre_cliente | direccion   |
| :--------: | :------------- | :---------- |
| 1          | Juan Pérez     | Calle 123   |
| 2          | Ana López      | Av. Central |

| id_producto | nombre_producto | precio |
| :---------: | :-------------- | :----: |
| 1           | Laptop          | 1000   |
| 2           | Teclado         | 50     |

| id_pedido | id_cliente | id_producto | cantidad |
| :-------: | :--------: | :---------: | :------: |
| 101       | 1          | 1           | 1        |
| 102       | 2          | 2           | 2        |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/Exported/pedidos_de_clientes.drawio.svg">
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
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Pedidos;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Clientes".
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

-- Crear tabla "Productos".
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    CONSTRAINT Unico_Producto UNIQUE (nombre_producto) -- Aseguramos que no haya duplicados en productos (si aplica).
);

-- Crear tabla "Pedidos".
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Clientes".
INSERT INTO Clientes (id_cliente, nombre_cliente, direccion)
VALUES
    (1, 'Juan Pérez', 'Calle 123'),
    (2, 'Ana López', 'Av. Central');

-- Insertar en la tabla "Productos".
INSERT INTO Productos (id_producto, nombre_producto, precio)
VALUES
    (1, 'Laptop', 1000.00),
    (2, 'Teclado', 50.00);

-- Insertar en la tabla "Pedidos".
INSERT INTO Pedidos (id_cliente, id_producto, cantidad)
VALUES
    (1, 1, 1), -- Juan Pérez pide un Laptop.
    (2, 2, 2); -- Ana López pide dos Teclados.
```
</details>

> [!TIP]
> 
> Aunque, considerando los datos proporcionados en este ejercicio, no hay valores multivaluados que deban separarse, se podría dividir el nombre y el apellido del cliente, y además, se podría crear una tabla adicional para las direcciones en caso de que se repitan.

---

#### **Ejercicio 3**: Registro de Empleados

- Aplicar **1FN**, separando valores multivaluados en la columna "telefono".
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| id_empleado | nombre    | telefono     | departamento |
| :---------: | :-------: | :----------: | :----------: |
| 1           | Carlos R. | 12345, 67890 | Ventas       |
| 2           | Laura M.  | 54321        | Finanzas     |
</details>
<details>
<summary>Solución 1FN</summary>

| id_empleado | nombre    | telefono | departamento |
| :---------: | :-------: | :------: | :----------: |
| 1           | Carlos R. | 12345    | Ventas       |
| 1           | Carlos R. | 67890    | Ventas       |
| 2           | Laura M.  | 54321    | Finanzas     |
</details>
<details>
<summary>Solución 2FN</summary>

| id_empleado | nombre    | departamento |
| :---------: | :-------: | :----------: |
| 1           | Carlos R. | Ventas       |
| 2           | Laura M.  | Finanzas     |

| telefono | id_empleado |
| :------: | :---------: |
| 12345    | 1           |
| 67890    | 1           |
| 54321    | 2           |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/Exported/registro_de_empleados.drawio.svg">
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
DROP TABLE IF EXISTS Empleados;
DROP TABLE IF EXISTS Telefonos;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Empleados".
CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    departamento VARCHAR(50) NOT NULL
);

-- Crear tabla "Telefonos".
CREATE TABLE Telefonos (
    telefono VARCHAR(20) PRIMARY KEY,
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Empleados".
INSERT INTO Empleados (id_empleado, nombre, departamento)
VALUES
    (1, 'Carlos R.', 'Ventas'),
    (2, 'Laura M.', 'Finanzas');

-- Insertar en la tabla "Telefonos".
INSERT INTO Telefonos (telefono, id_empleado)
VALUES
    ('12345', 1),  -- Carlos R. tiene el teléfono 12345
    ('67890', 1),  -- Carlos R. tiene el teléfono 67890
    ('54321', 2);  -- Laura M. tiene el teléfono 54321
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
<summary>Solución 1FN</summary>

| id_reserva | cliente  | habitacion | fecha      | precio |
| :--------: | :------- | :--------: | :--------: | :----: |
| 5001       | Pedro G. | 101        | 2025-02-01 | 300    |
| 5001       | Pedro G. | 101        | 2025-02-02 | 300    |
| 5001       | Pedro G. | 101        | 2025-02-03 | 300    |
| 5002       | María T. | 202        | 2025-03-10 | 200    |
| 5002       | María T. | 202        | 2025-03-11 | 200    |
</details>
<details>
<summary>Solución 2FN</summary>

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
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/Exported/reservas_de_hotel.drawio.svg">
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
    (5001, 1, 101, 300), -- Pedro G. ha reservado la habitación 101 por 300 euros.
    (5002, 2, 202, 200); -- María T. ha reservado la habitación 202 por 200 euros.

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
<summary>Solución 1FN</summary>

| id_inscripcion | estudiante | curso       | profesor    | horario       |
| :------------: | :--------- | :---------- | :---------- | :------------ |
| 3001           | Luis R.    | Matemáticas | Prof. Pérez | Lunes 10AM    |
| 3001           | Luis R.    | Matemáticas | Prof. Pérez | Miércoles 2PM |
| 3002           | Ana S.     | Física      | Prof. Gómez | Martes 3PM    |
</details>
<details>
<summary>Solución 2FN</summary>

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
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/Exported/inscripciones_a_cursos.drawio.svg">
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
<summary>Solución 1FN</summary>

| id_venta | cliente   | producto_comprado | costo_total |
| :------: | :-------- | :---------------- | :---------: |
| 8001     | Juan P.   | Celular, Funda    | 500         |
| 8002     | Andrea M. | Laptop            | 1000        |
</details>
<details>
<summary>Solución 2FN</summary>

| id_venta | cliente   | producto_comprado | costo_total |
| :------: | :-------- | :---------------- | :---------: |
| 8001     | Juan P.   | Celular, Funda    | 500         |
| 8002     | Andrea M. | Laptop            | 1000        |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/Exported/ventas_de_tienda.drawio.svg">
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
DROP TABLE IF EXISTS ;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "".
CREATE TABLE  ();

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "".
INSERT INTO  ()
VALUES
    ();
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
<summary>Solución 1FN</summary>

| id_libro | titulo     | autor     | genero          |
| :------: | :--------- | :-------- | :-------------- |
| 101      | El Quijote | Cervantes | Novela          |
| 102      | 1984       | Orwell    | Ciencia Ficción |
</details>
<details>
<summary>Solución 2FN</summary>

| id_libro | titulo     | autor     | genero          |
| :------: | :--------- | :-------- | :-------------- |
| 101      | El Quijote | Cervantes | Novela          |
| 102      | 1984       | Orwell    | Ciencia Ficción |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/Exported/biblioteca_de_libros.drawio.svg">
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
DROP TABLE IF EXISTS ;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "".
CREATE TABLE  ();

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "".
INSERT INTO  ()
VALUES
    ();
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
<summary>Solución 1FN</summary>

| id_factura | cliente | servicio_contratado | costo_total |
| :--------: | :------ | :------------------ | :---------: |
| 9001       | Juan P. | Internet, TV        | 50          |
| 9002       | Ana M.  | Teléfono            | 20          |
</details>
<details>
<summary>Solución 2FN</summary>

| id_factura | cliente | servicio_contratado | costo_total |
| :--------: | :------ | :------------------ | :---------: |
| 9001       | Juan P. | Internet, TV        | 50          |
| 9002       | Ana M.  | Teléfono            | 20          |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/Exported/facturacion_de_servicios.drawio.svg">
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
DROP TABLE IF EXISTS ;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "".
CREATE TABLE  ();

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "".
INSERT INTO  ()
VALUES
    ();
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
<summary>Solución 1FN</summary>

| id_vehiculo | marca  | modelo         | anio  |
| :---------: | :----- | :------------- | :---: |
| 5001        | Toyota | Corolla, Yaris | 2022  |
| 5002        | Honda  | Civic          | 2023  |
</details>
<details>
<summary>Solución 2FN</summary>

| id_vehiculo | marca  | modelo         | anio  |
| :---------: | :----- | :------------- | :---: |
| 5001        | Toyota | Corolla, Yaris | 2022  |
| 5002        | Honda  | Civic          | 2023  |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/Exported/gestion_de_vehiculos.drawio.svg">
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
DROP TABLE IF EXISTS ;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "".
CREATE TABLE  ();

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "".
INSERT INTO  ()
VALUES
    ();
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
<summary>Solución 1FN</summary>

| id_proyecto | nombre     | miembro      | presupuesto |
| :---------: | :--------- | :----------- | :---------: |
| 7001        | Web App    | Juan, Ana    | 5000        |
| 7002        | E-commerce | Pedro, María | 10000       |
</details>
<details>
<summary>Solución 2FN</summary>

| id_proyecto | nombre     | miembro      | presupuesto |
| :---------: | :--------- | :----------- | :---------: |
| 7001        | Web App    | Juan, Ana    | 5000        |
| 7002        | E-commerce | Pedro, María | 10000       |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/Exported/gestion_de_proyectos.drawio.svg">
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
DROP TABLE IF EXISTS ;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "".
CREATE TABLE  ();

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "".
INSERT INTO  ()
VALUES
    ();
```
</details>

---

<link rel="stylesheet" href="./../../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
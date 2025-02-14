## <img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-5/Assets/Computer.png" height="24"> Ejercicios de Normalización de Bases de Datos

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
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/lista_de_productos.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╗ ┌─┐┌─┐┌─┐  ┌┬┐┌─┐  ╔╦╗┌─┐┌┬┐┌─┐┌─┐
--  ╠╩╗├─┤└─┐├┤    ││├┤    ║║├─┤ │ │ │└─┐
--  ╚═╝┴ ┴└─┘└─┘  ─┴┘└─┘  ═╩╝┴ ┴ ┴ └─┘└─┘

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
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto) ON DELETE CASCADE, -- Si se elimina un producto, también se eliminan sus relaciones.
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor) ON DELETE CASCADE -- Si se elimina un proveedor, también se eliminan sus relaciones.
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Productos" (sin especificar id_producto, ya que es auto incrementable).
INSERT INTO Productos (nombre_producto, categoria, precio)
VALUES
    ('Laptop', 'Tecnología', 1000.00),
    ('Mouse', 'Accesorios', 25.00);

-- Insertar en la tabla "Proveedores" (sin especificar id_proveedor, ya que es auto incrementable).
INSERT INTO Proveedores (nombre_proveedor)
VALUES
    ('Dell'),
    ('HP'),
    ('Logitech');

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
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/pedidos_de_clientes.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╗ ┌─┐┌─┐┌─┐  ┌┬┐┌─┐  ╔╦╗┌─┐┌┬┐┌─┐┌─┐
--  ╠╩╗├─┤└─┐├┤    ││├┤    ║║├─┤ │ │ │└─┐
--  ╚═╝┴ ┴└─┘└─┘  ─┴┘└─┘  ═╩╝┴ ┴ ┴ └─┘└─┘

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
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE CASCADE, -- Si se elimina un cliente, también se eliminan sus relaciones.
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto) ON DELETE CASCADE -- Si se elimina un producto, también se eliminan sus relaciones.
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Clientes" (sin especificar id_cliente, ya que es auto incrementable).
INSERT INTO Clientes (nombre_cliente, direccion)
VALUES
    ('Juan Pérez', 'Calle 123'),
    ('Ana López', 'Av. Central');

-- Insertar en la tabla "Productos" (sin especificar id_producto, ya que es auto incrementable).
INSERT INTO Productos (nombre_producto, precio)
VALUES
    ('Laptop', 1000.00),
    ('Teclado', 50.00);

-- Insertar en la tabla "Pedidos".
INSERT INTO Pedidos (id_cliente, id_producto, cantidad)
VALUES
    (1, 1, 1), -- Juan Pérez pide 1 Laptop.
    (2, 2, 2); -- Ana López pide 2 Teclados.
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
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/registro_de_empleados.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╗ ┌─┐┌─┐┌─┐  ┌┬┐┌─┐  ╔╦╗┌─┐┌┬┐┌─┐┌─┐
--  ╠╩╗├─┤└─┐├┤    ││├┤    ║║├─┤ │ │ │└─┐
--  ╚═╝┴ ┴└─┘└─┘  ─┴┘└─┘  ═╩╝┴ ┴ ┴ └─┘└─┘

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
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado) ON DELETE CASCADE -- Si se elimina un empleado, también se eliminan sus relaciones.
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Empleados".
INSERT INTO Empleados (nombre, departamento)
VALUES
    ('Carlos R.', 'Ventas'),
    ('Laura M.', 'Finanzas');

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
> Se ha establecido que los números de teléfono deben ser únicos y que cada empleado, sin importar su relación con otros, debe contar con su propio número de teléfono. Además, estos números no podrán ser compartidos entre empleados.

---

#### **Ejercicio 4**: Reservas de Hotel

- Aplicar **1FN**, separando valores multivaluados en la columna "fecha".
- Aplicar **2FN**, asegurando que cada campo dependa completamente de la clave primaria.

<details>
<summary>Tabla</summary>

| id_reserva | cliente  | habitacion | fecha               | precio |
| :--------: | :------- | :--------: | :-----------------: | :----: |
| 5001       | Pedro G. | 101        | 01/02, 02/02, 03/02 | 300    |
| 5002       | María T. | 202        | 10/03, 11/03        | 200    |
</details>
<details>
<summary>Solución 1FN</summary>

| id_reserva | cliente  | habitacion | fecha               | precio |
| :--------: | :------- | :--------: | :-----------------: | :----: |
| 5001       | Pedro G. | 101        | 01/02, 02/02, 03/02 | 300    |
| 5002       | María T. | 202        | 10/03, 11/03        | 200    |
</details>
<details>
<summary>Solución 2FN</summary>

| id_reserva | cliente  | habitacion | fecha               | precio |
| :--------: | :------- | :--------: | :-----------------: | :----: |
| 5001       | Pedro G. | 101        | 01/02, 02/02, 03/02 | 300    |
| 5002       | María T. | 202        | 10/03, 11/03        | 200    |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/reservas_de_hotel.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╗ ┌─┐┌─┐┌─┐  ┌┬┐┌─┐  ╔╦╗┌─┐┌┬┐┌─┐┌─┐
--  ╠╩╗├─┤└─┐├┤    ││├┤    ║║├─┤ │ │ │└─┐
--  ╚═╝┴ ┴└─┘└─┘  ─┴┘└─┘  ═╩╝┴ ┴ ┴ └─┘└─┘

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

| id_inscripcion | estudiante | curso       | profesor    | horario                   |
| :------------: | :--------- | :---------- | :---------- | :------------------------ |
| 3001           | Luis R.    | Matemáticas | Prof. Pérez | Lunes 10AM, Miércoles 2PM |
| 3002           | Ana S.     | Física      | Prof. Gómez | Martes 3PM                |
</details>
<details>
<summary>Solución 2FN</summary>

| id_inscripcion | estudiante | curso       | profesor    | horario                   |
| :------------: | :--------- | :---------- | :---------- | :------------------------ |
| 3001           | Luis R.    | Matemáticas | Prof. Pérez | Lunes 10AM, Miércoles 2PM |
| 3002           | Ana S.     | Física      | Prof. Gómez | Martes 3PM                |
</details>
<details>
<summary>Diagrama</summary>
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/inscripciones_a_cursos.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╗ ┌─┐┌─┐┌─┐  ┌┬┐┌─┐  ╔╦╗┌─┐┌┬┐┌─┐┌─┐
--  ╠╩╗├─┤└─┐├┤    ││├┤    ║║├─┤ │ │ │└─┐
--  ╚═╝┴ ┴└─┘└─┘  ─┴┘└─┘  ═╩╝┴ ┴ ┴ └─┘└─┘

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
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/ventas_de_tienda.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╗ ┌─┐┌─┐┌─┐  ┌┬┐┌─┐  ╔╦╗┌─┐┌┬┐┌─┐┌─┐
--  ╠╩╗├─┤└─┐├┤    ││├┤    ║║├─┤ │ │ │└─┐
--  ╚═╝┴ ┴└─┘└─┘  ─┴┘└─┘  ═╩╝┴ ┴ ┴ └─┘└─┘

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
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/biblioteca_de_libros.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╗ ┌─┐┌─┐┌─┐  ┌┬┐┌─┐  ╔╦╗┌─┐┌┬┐┌─┐┌─┐
--  ╠╩╗├─┤└─┐├┤    ││├┤    ║║├─┤ │ │ │└─┐
--  ╚═╝┴ ┴└─┘└─┘  ─┴┘└─┘  ═╩╝┴ ┴ ┴ └─┘└─┘

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
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/facturacion_de_servicios.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╗ ┌─┐┌─┐┌─┐  ┌┬┐┌─┐  ╔╦╗┌─┐┌┬┐┌─┐┌─┐
--  ╠╩╗├─┤└─┐├┤    ││├┤    ║║├─┤ │ │ │└─┐
--  ╚═╝┴ ┴└─┘└─┘  ─┴┘└─┘  ═╩╝┴ ┴ ┴ └─┘└─┘

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
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/gestion_de_vehiculos.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╗ ┌─┐┌─┐┌─┐  ┌┬┐┌─┐  ╔╦╗┌─┐┌┬┐┌─┐┌─┐
--  ╠╩╗├─┤└─┐├┤    ││├┤    ║║├─┤ │ │ │└─┐
--  ╚═╝┴ ┴└─┘└─┘  ─┴┘└─┘  ═╩╝┴ ┴ ┴ └─┘└─┘

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
<img src="https://raw.githubusercontent.com/FJrodafo/University/main/DAW/BAE/Unidad-2/Tarea-6/Assets/Diagrams/gestion_de_proyectos.drawio.svg">
</details>
<details>
<summary>SQL</summary>

```sql
--  ╔╗ ┌─┐┌─┐┌─┐  ┌┬┐┌─┐  ╔╦╗┌─┐┌┬┐┌─┐┌─┐
--  ╠╩╗├─┤└─┐├┤    ││├┤    ║║├─┤ │ │ │└─┐
--  ╚═╝┴ ┴└─┘└─┘  ─┴┘└─┘  ═╩╝┴ ┴ ┴ └─┘└─┘

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
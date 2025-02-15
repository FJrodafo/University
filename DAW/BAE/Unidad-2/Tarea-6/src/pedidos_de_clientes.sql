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
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
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

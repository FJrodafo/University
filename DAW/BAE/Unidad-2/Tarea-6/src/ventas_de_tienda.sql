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

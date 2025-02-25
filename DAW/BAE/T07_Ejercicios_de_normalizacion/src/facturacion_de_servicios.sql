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

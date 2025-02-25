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

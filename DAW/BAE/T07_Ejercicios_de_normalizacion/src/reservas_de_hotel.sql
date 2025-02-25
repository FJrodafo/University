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

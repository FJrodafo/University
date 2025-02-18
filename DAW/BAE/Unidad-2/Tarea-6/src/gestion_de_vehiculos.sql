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

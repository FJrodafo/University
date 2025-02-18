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
DROP TABLE IF EXISTS Departamentos;
DROP TABLE IF EXISTS Empleados;
DROP TABLE IF EXISTS Telefonos;

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
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
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

-- Insertar en la tabla "Departamentos".
INSERT INTO Departamentos (id_departamento, nombre_departamento)
VALUES
    (1, 'Ventas'),
    (2, 'Finanzas');

-- Insertar en la tabla "Empleados".
INSERT INTO Empleados (id_empleado, id_departamento, nombre_empleado)
VALUES
    (1, 1, 'Carlos R.'),
    (2, 2, 'Laura M.');

-- Insertar en la tabla "Telefonos".
INSERT INTO Telefonos (telefono, id_empleado)
VALUES
    ('12345', 1),  -- Carlos R. tiene el teléfono 12345
    ('67890', 1),  -- Carlos R. tiene el teléfono 67890
    ('54321', 2);  -- Laura M. tiene el teléfono 54321

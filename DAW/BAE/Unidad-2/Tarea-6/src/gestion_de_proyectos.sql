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
    (7001, 'Web App', 5000),
    (7002, 'E-commerce', 10000);

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
    (7001, 1), -- Juan forma parte del proyecto Web App con un presupuesto de 5000 euros.
    (7001, 2), -- Ana forma parte del proyecto Web App con un presupuesto de 5000 euros.
    (7002, 3), -- Pedro forma parte del proyecto E-commerce con un presupuesto de 10000 euros.
    (7002, 4); -- María forma parte del proyecto E-commerce con un presupuesto de 10000 euros.

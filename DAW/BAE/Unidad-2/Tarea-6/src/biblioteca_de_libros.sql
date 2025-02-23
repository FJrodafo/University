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
DROP TABLE IF EXISTS Libros;
DROP TABLE IF EXISTS Autores;
DROP TABLE IF EXISTS Libro_Autor;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Libros".
CREATE TABLE Libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    genero VARCHAR(100) NOT NULL
);

-- Crear tabla "Autores".
CREATE TABLE Autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_autor VARCHAR(255) NOT NULL
);

-- Crear tabla "Libro_Autor".
CREATE TABLE Libro_Autor (
    id_libro INT,
    id_autor INT,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro),
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Libros".
INSERT INTO Libros (id_libro, titulo, genero) 
VALUES 
    (101, 'El Quijote', 'Novela'),
    (102, '1984', 'Ciencia Ficción');

-- Insertar en la tabla "Autores".
INSERT INTO Autores (id_autor, nombre_autor) 
VALUES 
    (1, 'Cervantes'),
    (2, 'Orwell');

-- Insertar en la tabla "Libro_Autor".
INSERT INTO Libro_Autor (id_libro, id_autor) 
VALUES 
    (101, 1),  -- La novela El Quijote tiene como autor a Cervantes.
    (102, 2);  -- El libro de ciencia ficción 1984 tiene como autor a Orwell.

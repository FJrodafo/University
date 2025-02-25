--  ╔╦╗┌─┐┌┬┐┌─┐┌┐ ┌─┐┌─┐┌─┐
--   ║║├─┤ │ ├─┤├┴┐├─┤└─┐├┤ 
--  ═╩╝┴ ┴ ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

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
DROP TABLE IF EXISTS Estudiantes;
DROP TABLE IF EXISTS Cursos;
DROP TABLE IF EXISTS Inscripciones;
DROP TABLE IF EXISTS Horarios;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Estudiantes".
CREATE TABLE Estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estudiante VARCHAR(100) NOT NULL
);

-- Crear tabla "Cursos".
CREATE TABLE Cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    nombre_profesor VARCHAR(100) NOT NULL
);

-- Crear tabla "Inscripciones".
CREATE TABLE Inscripciones (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

-- Crear tabla "Horarios".
CREATE TABLE Horarios (
    dia VARCHAR(20) NOT NULL,
    hora TIME NOT NULL,
    id_inscripcion INT,
    PRIMARY KEY (dia, hora, id_inscripcion),
    FOREIGN KEY (id_inscripcion) REFERENCES Inscripciones(id_inscripcion)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Estudiantes".
INSERT INTO Estudiantes (id_estudiante, nombre_estudiante)
VALUES
    (1, 'Luis R.'),
    (2, 'Ana S.');

-- Insertar en la tabla "Cursos".
INSERT INTO Cursos (id_curso, nombre_curso, nombre_profesor)
VALUES
    (1, 'Matemáticas', 'Prof. Pérez'),
    (2, 'Física', 'Prof. Gómez');

-- Insertar en la tabla "Inscripciones".
INSERT INTO Inscripciones (id_inscripcion, id_estudiante, id_curso)
VALUES
    (3001, 1, 1), -- Luis R. se inscribe en Matemáticas con Prof. Pérez.
    (3002, 2, 2); -- Ana S. se inscribe en Física con Prof. Gómez.

-- Insertar en la tabla "Horarios".
INSERT INTO Horarios (dia, hora, id_inscripcion)
VALUES
    ('Lunes', '10:00:00', 3001),
    ('Miércoles', '14:00:00', 3001),
    ('Martes', '15:00:00', 3002);

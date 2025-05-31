DROP DATABASE IF EXISTS Universidad;
CREATE DATABASE Universidad;
USE Universidad;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Estudiantes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE Profesores (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    departamento VARCHAR(50)
);

CREATE TABLE Cursos (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    id_profesor INT,
    creditos INT,
    FOREIGN KEY (id_profesor) REFERENCES Profesores(id)
);

CREATE TABLE Matriculas (
    id INT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Estudiantes (id, nombre, email, ciudad) VALUES
    (1, 'María López', 'maria@uni.edu', 'Madrid'),
    (2, 'Juan Pérez', 'juan@uni.edu', 'Barcelona'),
    (3, 'Lucía Fernández', 'lucia@uni.edu', 'Valencia'),
    (4, 'Carlos Ruiz', 'carlos@uni.edu', 'Sevilla');

INSERT INTO Profesores (id, nombre, departamento) VALUES
    (1, 'Dra. Ana Torres', 'Matemáticas'),
    (2, 'Dr. Luis Gómez', 'Informática'),
    (3, 'Dra. Marta Díaz', 'Física');

INSERT INTO Cursos (id, nombre, id_profesor, creditos) VALUES
    (1, 'Álgebra Lineal', 1, 6),
    (2, 'Programación I', 2, 5),
    (3, 'Mecánica Clásica', 3, 6),
    (4, 'Estructuras de Datos', 2, 5),
    (5, 'Cálculo I', 1, 6);

INSERT INTO Matriculas (id, id_estudiante, id_curso, fecha) VALUES
    (1, 1, 1, '2021-09-01'),
    (2, 2, 2, '2022-09-01'),
    (3, 3, 3, '2023-09-02'),
    (4, 4, 4, '2024-09-03'),
    (5, 1, 5, '2020-09-04'),
    (6, 2, 4, '2022-09-05'),
    (7, 3, 1, '2023-09-06'),
    (8, 4, 2, '2024-09-06');

DROP DATABASE IF EXISTS Libreria;
CREATE DATABASE Libreria;
USE Libreria;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    nacionalidad VARCHAR(100)
);

CREATE TABLE Libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    genero VARCHAR(100),
    paginas INT,
    precio DECIMAL(6,2),
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES Autores(id)
);

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    ciudad VARCHAR(100)
);

CREATE TABLE Empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT,
    id_cliente INT,
    id_empleado INT,
    fecha DATE,
    FOREIGN KEY (id_libro) REFERENCES Libros(id),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Autores (nombre, nacionalidad) VALUES
    ('Gabriel Garcia Marquez', 'Colombiana'),
    ('J.K. Rowling', 'Britanica'),
    ('Jorge Luis Borges', 'Argentina'),
    ('Miguel de Cervantes', 'Espanola');

INSERT INTO Libros (titulo, genero, paginas, precio, id_autor) VALUES
    ('Cien Anos de Soledad', 'Realismo Magico', 417, 25.50, 1),
    ('Harry Potter y la piedra filosofal', 'Fantasia', 320, 30.00, 2),
    ('Ficciones', 'Filosofia', 250, 22.00, 3),
    ('El Quijote', 'Clasico', 863, 35.00, 4),
    ('Libro sin autor', 'Drama', 200, 18.00, NULL);

INSERT INTO Clientes (nombre, telefono, ciudad) VALUES
    ('Ana Perez', '123456789', 'Madrid'),
    ('Carlos Gomez', '987654321', 'Barcelona'),
    ('Lucia Torres', '456789123', 'Sevilla');

INSERT INTO Empleados (nombre) VALUES
    ('Marta Ruiz'),
    ('Luis Ortega');

INSERT INTO Pedidos (id_libro, id_cliente, id_empleado, fecha) VALUES
    (1, 1, 1, '2023-06-15'),
    (2, 2, 2, '2024-01-10'),
    (3, 1, 2, '2024-03-05'),
    (4, 3, 1, '2022-11-22'),
    (2, 1, 1, '2024-05-12');

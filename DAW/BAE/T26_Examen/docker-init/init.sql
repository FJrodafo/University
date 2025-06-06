DROP DATABASE IF EXISTS Clinica;
CREATE DATABASE Clinica;
USE Clinica;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    ciudad VARCHAR(50)
);

CREATE TABLE Veterinarios (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(50)
);

CREATE TABLE Mascotas (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    especie VARCHAR(30),
    raza VARCHAR(50),
    edad INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
);

CREATE TABLE Visitas (
    id INT PRIMARY KEY,
    id_mascota INT,
    id_veterinario INT,
    fecha DATE,
    motivo VARCHAR(200),
    FOREIGN KEY (id_mascota) REFERENCES Mascotas(id),
    FOREIGN KEY (id_veterinario) REFERENCES Veterinarios(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Clientes (id, nombre, telefono, ciudad) VALUES
    (1, 'Ana Martin', '600123456', 'Madrid'),
    (2, 'Pedro Lopez', '611987654', 'Barcelona'),
    (3, 'Laura Sanchez', '622456789', 'Valencia'),
    (4, 'Sergio Ruiz', '633111222', 'Sevilla');

INSERT INTO Veterinarios (id, nombre, especialidad) VALUES
    (1, 'Dr. Pablo Torres', 'Dermatologia'),
    (2, 'Dra. Elena Gomez', 'Cirugia'),
    (3, 'Dr. Manuel Diaz', 'Medicina General');


INSERT INTO Mascotas (id, nombre, especie, raza, edad, id_cliente) VALUES
    (1, 'Luna', 'Perro', 'Labrador', 5, 1),
    (2, 'Milo', 'Gato', 'Siames', 3, 2),
    (3, 'Rocky', 'Perro', 'Bulldog', 7, 3),
    (4, 'Kiwi', 'Ave', 'Periquito', 2, 4);

INSERT INTO Visitas (id, id_mascota, id_veterinario, fecha, motivo) VALUES
    (1, 1, 3, '2023-05-01', 'Chequeo general'),
    (2, 2, 1, '2023-06-10', 'Perdida de pelo'),
    (3, 3, 2, '2023-07-15', 'Extraccion de diente'),
    (4, 4, 3, '2023-08-05', 'Revision anual'),
    (5, 1, 1, '2024-01-10', 'Alergia cutanea'),
    (6, 2, 3, '2024-02-20', 'Vacunacion'),
    (7, 3, 2, '2024-03-18', 'Cirugia hernia'),
    (8, 4, 1, '2024-04-12', 'Problemas en plumas');

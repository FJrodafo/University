--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Consumidores (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    ciudad TEXT,
    categoria INTEGER
);

CREATE TABLE Suministradores (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    categoria REAL
);

CREATE TABLE Compras (
    id INTEGER PRIMARY KEY,
    total REAL,
    fecha TEXT,
    id_consumidor INTEGER,
    id_suministrador INTEGER,
    FOREIGN KEY (id_consumidor) REFERENCES Consumidores(id),
    FOREIGN KEY (id_suministrador) REFERENCES Suministradores(id)
); 

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Consumidores (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES
    (1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100),
    (2, 'Adela', 'Salas', 'Díaz', 'Granada', 200),
    (3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL),
    (4, 'Adrián', 'Suárez', NULL, 'Jaén', 300),
    (5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200),
    (6, 'María', 'Santana', 'Moreno', 'Cádiz', 100),
    (7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300),
    (8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200),
    (9, 'Guillermo', 'López', 'Gómez', 'Granada', 225),
    (10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

INSERT INTO Suministradores (id, nombre, apellido1, apellido2, categoria) VALUES
    (1, 'Daniel', 'Sáez', 'Vega', 0.15),
    (2, 'Juan', 'Gómez', 'López', 0.13),
    (3, 'Diego','Flores', 'Salas', 0.11),
    (4, 'Marta','Herrera', 'Gil', 0.14),
    (5, 'Antonio','Carretero', 'Ortega', 0.12),
    (6, 'Manuel','Domínguez', 'Hernández', 0.13),
    (7, 'Antonio','Vega', 'Hernández', 0.11),
    (8, 'Alfredo','Ruiz', 'Flores', 0.05);

INSERT INTO Compras (id, total, fecha, id_consumidor, id_suministrador) VALUES
    (1, 150.5, '2020-10-05', 5, 2),
    (2, 270.65, '2019-09-10', 1, 5),
    (3, 65.26, '2020-10-05', 2, 1),
    (4, 110.5, '2019-08-17', 8, 3),
    (5, 948.5, '2020-09-10', 5, 2),
    (6, 2400.6, '2019-07-27', 7, 1),
    (7, 5760, '2018-09-10', 2, 1),
    (8, 1983.43, '2020-10-10', 4, 6),
    (9, 2480.4, '2019-10-10', 8, 3),
    (10, 250.45, '2018-06-27', 8, 2),
    (11, 75.29, '2019-08-17', 3, 7),
    (12, 3045.6, '2020-04-25', 2, 1),
    (13, 545.75, '2022-01-25', 6, 1),
    (14, 145.82, '2020-02-02', 6, 1),
    (15, 370.85, '2022-03-11', 1, 5),
    (16, 2389.23, '2022-03-11', 1, 5);

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Clientes (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    ciudad TEXT,
    puntos_fidelidad INTEGER
);

CREATE TABLE Empleados (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    comision REAL
);

CREATE TABLE Ventas (
    id INTEGER PRIMARY KEY,
    total REAL,
    fecha TEXT,
    id_cliente INTEGER,
    id_empleado INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Clientes (id, nombre, apellido1, apellido2, ciudad, puntos_fidelidad) VALUES
    (1, 'Carlos', 'Martínez', 'García', 'Madrid', 1500),
    (2, 'Ana', 'López', 'Fernández', 'Barcelona', 800),
    (3, 'Miguel', 'Sánchez', 'Díaz', 'Valencia', NULL),
    (4, 'Elena', 'Gómez', NULL, 'Sevilla', 1200),
    (5, 'David', 'Pérez', 'Ruiz', 'Madrid', 750),
    (6, 'Laura', 'Jiménez', 'Moreno', 'Bilbao', 950),
    (7, 'Sofía', 'Hernández', NULL, 'Zaragoza', 1800),
    (8, 'Javier', 'Domingo', 'Santos', 'Málaga', 600),
    (9, 'Patricia', 'Romero', 'González', 'Barcelona', 1100),
    (10, 'Antonio', 'Navarro', 'Torres', 'Valencia', 400);

INSERT INTO Empleados (id, nombre, apellido1, apellido2, comision) VALUES
    (1, 'Daniel', 'Vázquez', 'Gil', 0.11999999999999999555),
    (2, 'María', 'Castro', 'Ortega', 0.10000000000000000555),
    (3, 'Pablo', 'Molina', 'Serrano', 0.080000000000000001665),
    (4, 'Lucía', 'Reyes', 'Martín', 0.11000000000000000055),
    (5, 'Alejandro', 'Suárez', 'Blanco', 0.089999999999999996669),
    (6, 'Isabel', 'Morales', 'Iglesias', 0.10000000000000000555),
    (7, 'Francisco', 'Santana', 'Méndez', 0.080000000000000001665),
    (8, 'Cristina', 'Cabrera', 'Flores', 0.040000000000000000832);

INSERT INTO Ventas (id, total, fecha, id_cliente, id_empleado) VALUES
    (1, 899.99000000000000908, '2023-05-15', 5, 2),
    (2, 1499.4999999999999999, '2022-09-20', 1, 5),
    (3, 450.75000000000000001, '2023-05-15', 2, 1),
    (4, 299.89999999999997727, '2022-08-10', 8, 3),
    (5, 1799.0, '2023-04-22', 5, 2),
    (6, 3299.9899999999997817, '2022-07-05', 7, 1),
    (7, 5998.9999999999999999, '2021-09-12', 2, 1),
    (8, 1299.9500000000000454, '2023-03-18', 4, 6),
    (9, 2499.4999999999999999, '2022-10-15', 8, 3),
    (10, 350.25, '2021-06-30', 8, 2),
    (11, 199.99000000000000908, '2022-08-10', 3, 7),
    (12, 4198.9999999999999998, '2023-02-14', 2, 1),
    (13, 799.49999999999999998, '2023-01-25', 6, 1),
    (14, 249.90000000000000567, '2023-02-02', 6, 1),
    (15, 898.99999999999999997, '2023-03-10', 1, 5),
    (16, 2799.9899999999997817, '2023-03-10', 1, 5);

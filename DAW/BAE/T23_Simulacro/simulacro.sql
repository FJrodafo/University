--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    ciudad VARCHAR(50)
);

CREATE TABLE Productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2)
);

CREATE TABLE Ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    fecha DATE,
    cantidad INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Clientes (id, nombre, apellido, ciudad) VALUES
    (1, 'Ana', 'Pérez', 'La Orotava'),
    (2, 'Luis', 'Gómez', 'Puerto de la Cruz'),
    (3, 'Carla', 'Ruiz', 'Los Realejos');

INSERT INTO Productos (id, nombre, precio) VALUES
    (1, 'Laptop', 1200.00),
    (2, 'Teclado', 50.00),
    (3, 'Monitor', 300.00);

INSERT INTO Ventas (id, id_cliente, id_producto, fecha, cantidad) VALUES
    (1, 1, 1, '2024-05-01', 1),
    (2, 1, 2, '2024-05-12', 2),
    (3, 2, 3, '2024-05-13', 1),
    (4, 3, 2, '2024-05-14', 1);

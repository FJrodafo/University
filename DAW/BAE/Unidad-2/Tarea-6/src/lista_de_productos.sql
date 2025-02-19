--  ╔╦╗┌─┐┌┬┐┌─┐┌┐ ┌─┐┌─┐┌─┐
--   ║║├─┤ │ ├─┤├┴┐├─┤└─┐├┤ 
--  ═╩╝┴ ┴ ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

-- Eliminar la base de datos si ya existe.
DROP DATABASE IF EXISTS lista_de_productos_db;

-- Crear la base de datos.
CREATE DATABASE lista_de_productos_db;

-- Seleccionar la base de datos a usar.
USE lista_de_productos_db;

--  ╔╦╗┬─┐┌─┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--   ║║├┬┘│ │├─┘   ║ ├─┤├┴┐│  ├┤ 
--  ═╩╝┴└─└─┘┴     ╩ ┴ ┴└─┘┴─┘└─┘

-- Eliminar las tablas si ya existen (para evitar errores al crear las tablas).
DROP TABLE IF EXISTS Producto_Proveedor;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Proveedores;
DROP TABLE IF EXISTS Categorias;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla "Categorias".
CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    CONSTRAINT Unica_Categoria UNIQUE (nombre_categoria) -- Aseguramos que no haya duplicados en la columna "nombre_categoria".
);

-- Crear tabla "Productos".
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    nombre_producto VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

-- Crear tabla "Proveedores".
CREATE TABLE Proveedores (
    nif_proveedor VARCHAR(9) PRIMARY KEY,
    nombre_proveedor VARCHAR(100) NOT NULL,
    CONSTRAINT Unico_Proveedor UNIQUE (nombre_proveedor)
);

-- Crear tabla intermedia "Producto_Proveedor".
CREATE TABLE Producto_Proveedor (
    id_producto INT,
    nif_proveedor VARCHAR(9),
    PRIMARY KEY (id_producto, nif_proveedor),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY (nif_proveedor) REFERENCES Proveedores(nif_proveedor)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla "Categorias".
INSERT INTO Categorias (nombre_categoria)
VALUES
    ('Tecnología'),
    ('Accesorios');

-- Insertar en la tabla "Productos".
INSERT INTO Productos (id_categoria, nombre_producto, precio)
VALUES
    (1, 'Laptop', 1000.00),
    (2, 'Mouse', 25.00);

-- Insertar en la tabla "Proveedores".
INSERT INTO Proveedores (nif_proveedor, nombre_proveedor)
VALUES
    ('12345678A', 'Dell'),
    ('23456789B', 'HP'),
    ('34567890C', 'Logitech');

-- Insertar en la tabla intermedia "Producto_Proveedor".
INSERT INTO Producto_Proveedor (id_producto, nif_proveedor)
VALUES
    (1, '12345678A'), -- Laptop de 1000.00 euros suministrada por Dell.
    (1, '23456789B'), -- Laptop de 1000.00 euros suministrada por HP.
    (2, '34567890C'); -- Mouse de 25.00 euros suministrado por Logitech.

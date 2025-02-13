--  ╔╗ ┌─┐┌─┐┌─┐  ┌┬┐┌─┐  ╔╦╗┌─┐┌┬┐┌─┐┌─┐
--  ╠╩╗├─┤└─┐├┤    ││├┤    ║║├─┤ │ │ │└─┐
--  ╚═╝┴ ┴└─┘└─┘  ─┴┘└─┘  ═╩╝┴ ┴ ┴ └─┘└─┘

-- Eliminar la base de datos si ya existe
DROP DATABASE IF EXISTS lista_de_productos_db;

-- Crear la base de datos
CREATE DATABASE lista_de_productos_db;

-- Seleccionar la base de datos a usar
USE lista_de_productos_db;

--  ╔╦╗┬─┐┌─┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--   ║║├┬┘│ │├─┘   ║ ├─┤├┴┐│  ├┤ 
--  ═╩╝┴└─└─┘┴     ╩ ┴ ┴└─┘┴─┘└─┘

-- Eliminar las tablas si ya existen (para evitar errores al crear las tablas)
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Proveedores;

--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

-- Crear tabla Productos
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    CONSTRAINT Unico_Producto UNIQUE (nombre) -- Aseguramos que no haya duplicados en productos (si aplica)
);

-- Crear tabla Proveedores
CREATE TABLE Proveedores (
    id_producto INT,
    proveedor VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_producto, proveedor),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
        ON DELETE CASCADE, -- Elimina proveedores si el producto es eliminado
    CONSTRAINT Unico_Proveedor UNIQUE (id_producto, proveedor) -- Evitar duplicados de proveedor por producto
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

-- Insertar en la tabla Productos
INSERT INTO Productos (id_producto, nombre, categoria, precio)
VALUES
    (1, 'Laptop', 'Tecnología', 1000.00),
    (2, 'Mouse', 'Accesorios', 25.00);

-- Insertar en la tabla Proveedores
INSERT INTO Proveedores (id_producto, proveedor)
VALUES
    (1, 'Dell'),
    (1, 'HP'),
    (2, 'Logitech');

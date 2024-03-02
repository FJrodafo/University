CREATE DATABASE supermercado;

USE supermercado;

-- Tabla de Clientes
CREATE TABLE Clientes (
    dni varchar(9) NOT NULL UNIQUE PRIMARY KEY,
    nombre varchar(25) NOT NULL,
    apellidos varchar(25) NOT NULL,
    direccion varchar(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL CHECK (fecha_nacimiento <= CURRENT_DATE)
);

-- Tabla de Productos
CREATE TABLE Productos (
    codigo int NOT NULL UNIQUE PRIMARY KEY,
    nombre varchar(25) NOT NULL,
    precio decimal(6,2) NOT NULL CHECK (precio > 0),
    nif_proveedor varchar(9) NOT NULL UNIQUE,
    FOREIGN KEY(nif_proveedor) REFERENCES Proveedores(nif)
);

-- Tabla de Relación Clientes_Productos
CREATE TABLE Clientes_Productos (
    id int AUTO_INCREMENT PRIMARY KEY,
    dni_cliente varchar(9) NOT NULL,
    codigo_producto int NOT NULL,
    FOREIGN KEY(dni_cliente) REFERENCES Clientes(dni),
    FOREIGN KEY(codigo_producto) REFERENCES Productos(codigo)
);

-- Tabla de Proveedores
CREATE TABLE Proveedores (
    nif varchar(9) NOT NULL UNIQUE PRIMARY KEY,
    nombre varchar(25) NOT NULL,
    direccion varchar(100) NOT NULL
);

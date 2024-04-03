CREATE DATABASE supermercado;

USE supermercado;

-- Tabla de Clientes
CREATE TABLE Clientes (
    dni varchar(9) NOT NULL UNIQUE PRIMARY KEY,
    nombre varchar(25) NOT NULL,
    apellidos varchar(25) NOT NULL,
    direccion varchar(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL CHECK (fecha_nacimiento < CURRENT_DATE)
);

-- Tabla de Proveedores
CREATE TABLE Proveedores (
    nif varchar(9) NOT NULL UNIQUE PRIMARY KEY,
    nombre varchar(25) NOT NULL,
    direccion varchar(100) NOT NULL
);

-- Tabla de Productos
CREATE TABLE Productos (
    codigo int NOT NULL UNIQUE PRIMARY KEY,
    nombre varchar(25) NOT NULL,
    precio decimal(6,2) NOT NULL CHECK (precio > 0),
    nif_proveedor varchar(9) NOT NULL,
    CONSTRAINT fk_productos_proveedores FOREIGN KEY (nif_proveedor) REFERENCES Proveedores(nif)
);

-- Tabla intermedia Clientes_Productos
CREATE TABLE Clientes_Productos (
    -- id int AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    dni_cliente varchar(9) NOT NULL,
    codigo_producto int NOT NULL,
    PRIMARY KEY (dni_cliente, codigo_producto),
    CONSTRAINT fk_clientes_clientes_productos FOREIGN KEY (dni_cliente) REFERENCES Clientes(dni),
    CONSTRAINT fk_clientes_productos_productos FOREIGN KEY (codigo_producto) REFERENCES Productos(codigo)
);

DROP DATABASE IF EXISTS supermercado;
CREATE DATABASE supermercado;
USE supermercado;

CREATE TABLE clientes (
    dni VARCHAR(9) NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    apellidos VARCHAR(25) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL CHECK (fecha_nacimiento < CURRENT_DATE()),
    CONSTRAINT uq_clientes UNIQUE KEY (dni),
    CONSTRAINT pk_clientes PRIMARY KEY (dni)
);

CREATE TABLE proveedores (
    nif VARCHAR(9) NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    CONSTRAINT uq_proveedores UNIQUE KEY (nif),
    CONSTRAINT pk_proveedores PRIMARY KEY (nif)
);

CREATE TABLE productos (
    codigo INT NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    precio decimal(6,2) NOT NULL CHECK (precio > 0),
    nif_proveedor VARCHAR(9) NOT NULL,
    CONSTRAINT uq_productos UNIQUE KEY (codigo),
    CONSTRAINT pk_productos PRIMARY KEY (codigo),
    CONSTRAINT fk_productos_proveedores FOREIGN KEY (nif_proveedor) REFERENCES proveedores(nif)
);

CREATE TABLE clientes_productos (
    -- id INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    dni_cliente VARCHAR(9) NOT NULL,
    codigo_producto INT NOT NULL,
    CONSTRAINT uq_clientes_productos UNIQUE KEY (dni_cliente, codigo_producto),
    CONSTRAINT pk_clientes_productos PRIMARY KEY (dni_cliente, codigo_producto),
    CONSTRAINT fk_clientes_clientes_productos FOREIGN KEY (dni_cliente) REFERENCES clientes(dni),
    CONSTRAINT fk_clientes_productos_productos FOREIGN KEY (codigo_producto) REFERENCES productos(codigo)
);

INSERT INTO clientes (dni, nombre, apellidos, direccion, fecha_nacimiento)
VALUES
('123456789', 'Juan', 'Pérez', 'Calle Principal 123', '1990-05-15'),
('234567891', 'María', 'Gómez', 'Avenida Central 456', '1985-10-20'),
('345678912', 'Laura', 'Martinez', 'Calle del Sol 789', '1988-03-25'),
('456789123', 'Carlos', 'González', 'Avenida Principal 456', '1975-09-12');

INSERT INTO proveedores (nif, nombre, direccion)
VALUES
('567891234', 'Proveedor A', 'Calle Proveedor 12'),
('678912345', 'Proveedor B', 'Avenida de los Proveedores 23'),
('789123456', 'Proveedor C', 'Calle Proveedor 34'),
('891234567', 'Proveedor D', 'Avenida de las Proveedoras 45');

INSERT INTO productos (codigo, nombre, precio, nif_proveedor)
VALUES
(1, 'Producto A', 10.50, '678912345'),
(2, 'Producto B', 15.75, '891234567'),
(3, 'Producto C', 20.00, '567891234'),
(4, 'Producto D', 12.99, '789123456');

INSERT INTO clientes_productos (dni_cliente, codigo_producto)
VALUES
('456789123', 1),
('456789123', 2),
('345678912', 3),
('123456789', 4);

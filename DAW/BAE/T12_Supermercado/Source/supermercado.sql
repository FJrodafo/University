--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Categorias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT UNIQUE
);

CREATE TABLE Productos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_categoria INTEGER,
    nombre TEXT,
    precio REAL,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id)
);

CREATE TABLE Pedidos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fecha DATE
);

CREATE TABLE Producto_Pedido (
    id_pedido INTEGER,
    id_producto INTEGER,
    cantidad INTEGER,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Categorias (nombre) VALUES 
    ('Alimentos'),
    ('Lácteos'),
    ('Panadería'),
    ('Frutas'),
    ('Carnes'),
    ('Verduras'),
    ('Desayuno'),
    ('Hogar'),
    ('Higiene'),
    ('Limpieza'),
    ('Snacks'),
    ('Cocina'),
    ('Bebidas'),
    ('Conservas');

INSERT INTO Productos (nombre, id_categoria, precio) VALUES 
    ('Arroz', 1, 2.5),
    ('Leche', 2, 1.8),
    ('Pan', 3, 1.2),
    ('Manzanas', 4, 3.0),
    ('Pollo', 5, 5.5),
    ('Huevos', 2, 1.0),
    ('Yogurt', 2, 2.0),
    ('Tomates', 6, 2.2),
    ('Queso', 2, 4.0),
    ('Cereal', 7, 3.5),
    ('Papel Higiénico', 8, 1.5),
    ('Cepillo de Dientes', 9, 2.0),
    ('Detergente', 10, 2.8),
    ('Galletas', 11, 1.7),
    ('Aceite de Oliva', 12, 4.5),
    ('Café', 13, 5.0),
    ('Sopa enlatada', 14, 2.3),
    ('Jabón de Baño', 9, 1.2),
    ('Botellas de Agua', 13, 1.0),
    ('Cerveza', 13, 3.8);

INSERT INTO Pedidos (fecha) VALUES 
    ('2024-01-17'),
    ('2024-01-18'),
    ('2024-01-19'),
    ('2024-01-20');

INSERT INTO Producto_Pedido (id_pedido, id_producto, cantidad) VALUES 
    (1, 1, 5),
    (1, 2, 3),
    (1, 4, 2),
    (1, 5, 1),
    (2, 6, 10),
    (2, 8, 4),
    (2, 10, 2),
    (3, 14, 7),
    (3, 16, 3),
    (4, 18, 6);

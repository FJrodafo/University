--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Productos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    categoria TEXT,
    precio REAL
);

CREATE TABLE Ventas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Productos (nombre, categoria, precio) VALUES 
    ('Arroz', 'Alimentos', 2.5),
    ('Leche', 'Lácteos', 1.8),
    ('Pan', 'Panadería', 1.2),
    ('Manzanas', 'Frutas', 3.0),
    ('Pollo', 'Carnes', 5.5),
    ('Huevos', 'Lácteos', 1.0),
    ('Yogurt', 'Lácteos', 2.0),
    ('Tomates', 'Verduras', 2.2),
    ('Queso', 'Lácteos', 4.0),
    ('Cereal', 'Desayuno', 3.5),
    ('Papel Higiénico', 'Hogar', 1.5),
    ('Cepillo de Dientes', 'Higiene', 2.0),
    ('Detergente', 'Limpieza', 2.8),
    ('Galletas', 'Snacks', 1.7),
    ('Aceite de Oliva', 'Cocina', 4.5),
    ('Café', 'Bebidas', 5.0),
    ('Sopa enlatada', 'Conservas', 2.3),
    ('Jabón de Baño', 'Higiene', 1.2),
    ('Botellas de Agua', 'Bebidas', 1.0),
    ('Cerveza', 'Bebidas', 3.8);

INSERT INTO Ventas (id_producto, cantidad, fecha) VALUES 
    (1, 5, '2024-01-17'),
    (2, 3, '2024-01-17'),
    (4, 2, '2024-01-17'),
    (5, 1, '2024-01-17'),
    (6, 10, '2024-01-18'),
    (8, 4, '2024-01-18'),
    (10, 2, '2024-01-18'),
    (14, 7, '2024-01-19'),
    (16, 3, '2024-01-19'),
    (18, 6, '2024-01-20');

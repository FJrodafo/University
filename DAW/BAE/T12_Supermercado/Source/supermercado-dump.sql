PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Categorias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT UNIQUE
);
INSERT INTO Categorias VALUES(1,'Alimentos');
INSERT INTO Categorias VALUES(2,'Lácteos');
INSERT INTO Categorias VALUES(3,'Panadería');
INSERT INTO Categorias VALUES(4,'Frutas');
INSERT INTO Categorias VALUES(5,'Carnes');
INSERT INTO Categorias VALUES(6,'Verduras');
INSERT INTO Categorias VALUES(7,'Desayuno');
INSERT INTO Categorias VALUES(8,'Hogar');
INSERT INTO Categorias VALUES(9,'Higiene');
INSERT INTO Categorias VALUES(10,'Limpieza');
INSERT INTO Categorias VALUES(11,'Snacks');
INSERT INTO Categorias VALUES(12,'Cocina');
INSERT INTO Categorias VALUES(13,'Bebidas');
INSERT INTO Categorias VALUES(14,'Conservas');
CREATE TABLE Productos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_categoria INTEGER,
    nombre TEXT,
    precio REAL,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id)
);
INSERT INTO Productos VALUES(1,1,'Arroz',2.5);
INSERT INTO Productos VALUES(2,2,'Leche',1.800000000000000044);
INSERT INTO Productos VALUES(3,3,'Pan',1.199999999999999956);
INSERT INTO Productos VALUES(4,4,'Manzanas',3.0);
INSERT INTO Productos VALUES(5,5,'Pollo',5.5);
INSERT INTO Productos VALUES(6,2,'Huevos',1.0);
INSERT INTO Productos VALUES(7,2,'Yogurt',2.0);
INSERT INTO Productos VALUES(8,6,'Tomates',2.200000000000000178);
INSERT INTO Productos VALUES(9,2,'Queso',4.0);
INSERT INTO Productos VALUES(10,7,'Cereal',3.5);
INSERT INTO Productos VALUES(11,8,'Papel Higiénico',1.5);
INSERT INTO Productos VALUES(12,9,'Cepillo de Dientes',2.0);
INSERT INTO Productos VALUES(13,10,'Detergente',2.799999999999999823);
INSERT INTO Productos VALUES(14,11,'Galletas',1.699999999999999956);
INSERT INTO Productos VALUES(15,12,'Aceite de Oliva',4.5);
INSERT INTO Productos VALUES(16,13,'Café',5.0);
INSERT INTO Productos VALUES(17,14,'Sopa enlatada',2.299999999999999822);
INSERT INTO Productos VALUES(18,9,'Jabón de Baño',1.199999999999999956);
INSERT INTO Productos VALUES(19,13,'Botellas de Agua',1.0);
INSERT INTO Productos VALUES(20,13,'Cerveza',3.799999999999999823);
CREATE TABLE Pedidos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fecha DATE
);
INSERT INTO Pedidos VALUES(1,'2024-01-17');
INSERT INTO Pedidos VALUES(2,'2024-01-18');
INSERT INTO Pedidos VALUES(3,'2024-01-19');
INSERT INTO Pedidos VALUES(4,'2024-01-20');
CREATE TABLE Producto_Pedido (
    id_pedido INTEGER,
    id_producto INTEGER,
    cantidad INTEGER,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);
INSERT INTO Producto_Pedido VALUES(1,1,5);
INSERT INTO Producto_Pedido VALUES(1,2,3);
INSERT INTO Producto_Pedido VALUES(1,4,2);
INSERT INTO Producto_Pedido VALUES(1,5,1);
INSERT INTO Producto_Pedido VALUES(2,6,10);
INSERT INTO Producto_Pedido VALUES(2,8,4);
INSERT INTO Producto_Pedido VALUES(2,10,2);
INSERT INTO Producto_Pedido VALUES(3,14,7);
INSERT INTO Producto_Pedido VALUES(3,16,3);
INSERT INTO Producto_Pedido VALUES(4,18,6);
INSERT INTO sqlite_sequence VALUES('Categorias',14);
INSERT INTO sqlite_sequence VALUES('Productos',20);
INSERT INTO sqlite_sequence VALUES('Pedidos',4);
COMMIT;

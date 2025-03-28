PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Productos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    categoria TEXT,
    precio REAL
);
INSERT INTO Productos VALUES(1,'Arroz','Alimentos',2.5);
INSERT INTO Productos VALUES(2,'Leche','Lácteos',1.800000000000000044);
INSERT INTO Productos VALUES(3,'Pan','Panadería',1.199999999999999956);
INSERT INTO Productos VALUES(4,'Manzanas','Frutas',3.0);
INSERT INTO Productos VALUES(5,'Pollo','Carnes',5.5);
INSERT INTO Productos VALUES(6,'Huevos','Lácteos',1.0);
INSERT INTO Productos VALUES(7,'Yogurt','Lácteos',2.0);
INSERT INTO Productos VALUES(8,'Tomates','Verduras',2.200000000000000178);
INSERT INTO Productos VALUES(9,'Queso','Lácteos',4.0);
INSERT INTO Productos VALUES(10,'Cereal','Desayuno',3.5);
INSERT INTO Productos VALUES(11,'Papel Higiénico','Hogar',1.5);
INSERT INTO Productos VALUES(12,'Cepillo de Dientes','Higiene',2.0);
INSERT INTO Productos VALUES(13,'Detergente','Limpieza',2.799999999999999823);
INSERT INTO Productos VALUES(14,'Galletas','Snacks',1.699999999999999956);
INSERT INTO Productos VALUES(15,'Aceite de Oliva','Cocina',4.5);
INSERT INTO Productos VALUES(16,'Café','Bebidas',5.0);
INSERT INTO Productos VALUES(17,'Sopa enlatada','Conservas',2.299999999999999822);
INSERT INTO Productos VALUES(18,'Jabón de Baño','Higiene',1.199999999999999956);
INSERT INTO Productos VALUES(19,'Botellas de Agua','Bebidas',1.0);
INSERT INTO Productos VALUES(20,'Cerveza','Bebidas',3.799999999999999823);
CREATE TABLE Ventas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);
INSERT INTO Ventas VALUES(1,1,5,'2024-01-17');
INSERT INTO Ventas VALUES(2,2,3,'2024-01-17');
INSERT INTO Ventas VALUES(3,4,2,'2024-01-17');
INSERT INTO Ventas VALUES(4,5,1,'2024-01-17');
INSERT INTO Ventas VALUES(5,6,10,'2024-01-18');
INSERT INTO Ventas VALUES(6,8,4,'2024-01-18');
INSERT INTO Ventas VALUES(7,10,2,'2024-01-18');
INSERT INTO Ventas VALUES(8,14,7,'2024-01-19');
INSERT INTO Ventas VALUES(9,16,3,'2024-01-19');
INSERT INTO Ventas VALUES(10,18,6,'2024-01-20');
INSERT INTO sqlite_sequence VALUES('Productos',20);
INSERT INTO sqlite_sequence VALUES('Ventas',10);
COMMIT;

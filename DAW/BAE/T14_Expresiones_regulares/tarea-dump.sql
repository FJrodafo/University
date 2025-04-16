PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    email TEXT UNIQUE
);
INSERT INTO Clientes VALUES(1,'Juan Pérez','juan@example.com');
INSERT INTO Clientes VALUES(2,'María Gómez','maria@example.com');
INSERT INTO Clientes VALUES(3,'Carlos López','carlos@example.com');
INSERT INTO Clientes VALUES(4,'Ana Rodríguez','ana@example.com');
INSERT INTO Clientes VALUES(5,'Luisa Martínez','luisa@example.com');
INSERT INTO Clientes VALUES(6,'Pedro Sánchez','pedro@example.com');
INSERT INTO Clientes VALUES(7,'Laura García','laura@example.com');
INSERT INTO Clientes VALUES(8,'Miguel Martín','miguel@example.com');
INSERT INTO Clientes VALUES(9,'Elena González','elena@example.com');
INSERT INTO Clientes VALUES(10,'David Torres','david@example.com');
INSERT INTO Clientes VALUES(11,'Sofía Ruiz','sofia@example.com');
INSERT INTO Clientes VALUES(12,'Javier López','javier@example.com');
INSERT INTO Clientes VALUES(13,'Carmen Vargas','carmen@example.com');
INSERT INTO Clientes VALUES(14,'Daniel Muñoz','daniel@example.com');
INSERT INTO Clientes VALUES(15,'Isabel Serrano','isabel@example.com');
INSERT INTO Clientes VALUES(16,'Alejandro Muñoz','alejandro@example.com');
INSERT INTO Clientes VALUES(17,'Raquel Herrera','raquel@example.com');
INSERT INTO Clientes VALUES(18,'Francisco Mora','francisco@example.com');
INSERT INTO Clientes VALUES(19,'Marina Díaz','marina@example.com');
INSERT INTO Clientes VALUES(20,'Antonio Jiménez','antonio@example.com');
INSERT INTO Clientes VALUES(21,'Beatriz Romero','beatriz@example.com');
INSERT INTO Clientes VALUES(22,'Carlos Gómez','carlos.gomez@example.com');
INSERT INTO Clientes VALUES(23,'Clara Sánchez','clara.sanchez@example.com');
INSERT INTO Clientes VALUES(24,'Andrés Martínez','andres@example.com');
INSERT INTO Clientes VALUES(25,'Lucía Díaz','lucia@example.com');
INSERT INTO Clientes VALUES(26,'Mario Serrano','mario@example.com');
INSERT INTO Clientes VALUES(27,'Eva Torres','eva.torres@example.com');
INSERT INTO Clientes VALUES(28,'Roberto Ruiz','roberto@example.com');
INSERT INTO Clientes VALUES(29,'Celia García','celia@example.com');
CREATE TABLE Productos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    precio REAL
);
INSERT INTO Productos VALUES(1,'Laptop',1200.0);
INSERT INTO Productos VALUES(2,'Smartphone',699.990000000000009);
INSERT INTO Productos VALUES(3,'TV LED',799.5);
INSERT INTO Productos VALUES(4,'Tablet',299.990000000000009);
INSERT INTO Productos VALUES(5,'Auriculares Bluetooth',79.98999999999999489);
INSERT INTO Productos VALUES(6,'Impresora',199.990000000000009);
INSERT INTO Productos VALUES(7,'Cámara Digital',499.990000000000009);
INSERT INTO Productos VALUES(8,'Reproductor de Audio',149.990000000000009);
INSERT INTO Productos VALUES(9,'Altavoces Inalámbricos',129.990000000000009);
INSERT INTO Productos VALUES(10,'Reloj Inteligente',249.990000000000009);
INSERT INTO Productos VALUES(11,'Teclado Inalámbrico',59.99000000000000198);
INSERT INTO Productos VALUES(12,'Ratón Óptico',29.98999999999999844);
INSERT INTO Productos VALUES(13,'Monitor LED',349.990000000000009);
INSERT INTO Productos VALUES(14,'Mochila para Portátil',49.99000000000000198);
INSERT INTO Productos VALUES(15,'Disco Duro Externo',89.98999999999999489);
INSERT INTO Productos VALUES(16,'Router Wi-Fi',69.98999999999999489);
INSERT INTO Productos VALUES(17,'Lámpara LED',39.99000000000000198);
INSERT INTO Productos VALUES(18,'Batería Externa',19.98999999999999843);
INSERT INTO Productos VALUES(19,'Estuche para Auriculares',14.99000000000000021);
INSERT INTO Productos VALUES(20,'Tarjeta de Memoria',24.98999999999999844);
INSERT INTO Productos VALUES(21,'Cargador Inalámbrico',34.99000000000000198);
INSERT INTO Productos VALUES(22,'Kit de Limpieza para Computadoras',9.99000000000000021);
INSERT INTO Productos VALUES(23,'Funda para Tablet',19.98999999999999843);
INSERT INTO Productos VALUES(24,'Soporte para Teléfono',14.99000000000000021);
INSERT INTO Productos VALUES(25,'Hub USB',29.98999999999999844);
INSERT INTO Productos VALUES(26,'Webcam HD',59.99000000000000198);
INSERT INTO Productos VALUES(27,'Funda para Laptop',29.98999999999999844);
INSERT INTO Productos VALUES(28,'Adaptador HDMI',12.99000000000000021);
CREATE TABLE Pedidos (
    id_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);
INSERT INTO Pedidos VALUES(1,1,1,2,'2024-02-01');
INSERT INTO Pedidos VALUES(2,2,2,1,'2024-02-02');
INSERT INTO Pedidos VALUES(3,3,3,3,'2024-02-03');
INSERT INTO Pedidos VALUES(4,4,4,1,'2024-02-04');
INSERT INTO Pedidos VALUES(5,5,5,2,'2024-02-05');
INSERT INTO Pedidos VALUES(6,6,6,1,'2024-02-06');
INSERT INTO Pedidos VALUES(7,7,7,3,'2024-02-07');
INSERT INTO Pedidos VALUES(8,8,8,2,'2024-02-08');
INSERT INTO Pedidos VALUES(9,9,9,1,'2024-02-09');
INSERT INTO Pedidos VALUES(10,10,10,2,'2024-02-10');
INSERT INTO Pedidos VALUES(11,11,11,1,'2024-02-11');
INSERT INTO Pedidos VALUES(12,12,12,3,'2024-02-12');
INSERT INTO Pedidos VALUES(13,13,13,1,'2024-02-13');
INSERT INTO Pedidos VALUES(14,14,14,2,'2024-02-14');
INSERT INTO Pedidos VALUES(15,15,15,1,'2024-02-15');
INSERT INTO Pedidos VALUES(16,16,16,3,'2024-02-16');
INSERT INTO Pedidos VALUES(17,17,17,2,'2024-02-17');
INSERT INTO Pedidos VALUES(18,18,18,1,'2024-02-18');
INSERT INTO Pedidos VALUES(19,19,19,2,'2024-02-19');
INSERT INTO Pedidos VALUES(20,20,20,1,'2024-02-20');
INSERT INTO Pedidos VALUES(21,21,21,3,'2024-02-21');
INSERT INTO Pedidos VALUES(22,22,22,1,'2024-02-22');
INSERT INTO Pedidos VALUES(23,23,23,2,'2024-02-23');
INSERT INTO Pedidos VALUES(24,24,24,1,'2024-02-24');
INSERT INTO Pedidos VALUES(25,25,25,3,'2024-02-25');
INSERT INTO Pedidos VALUES(26,26,26,2,'2024-02-26');
INSERT INTO Pedidos VALUES(27,27,27,1,'2024-02-27');
INSERT INTO Pedidos VALUES(28,28,28,2,'2024-02-28');
INSERT INTO Pedidos VALUES(29,29,29,1,'2024-02-29');
INSERT INTO Pedidos VALUES(30,30,30,3,'2024-03-01');
INSERT INTO sqlite_sequence VALUES('Clientes',29);
INSERT INTO sqlite_sequence VALUES('Productos',28);
INSERT INTO sqlite_sequence VALUES('Pedidos',30);
COMMIT;

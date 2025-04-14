PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Consumidores (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    ciudad TEXT,
    categoria INTEGER
);
INSERT INTO Consumidores VALUES(1,'Aarón','Rivero','Gómez','Almería',100);
INSERT INTO Consumidores VALUES(2,'Adela','Salas','Díaz','Granada',200);
INSERT INTO Consumidores VALUES(3,'Adolfo','Rubio','Flores','Sevilla',NULL);
INSERT INTO Consumidores VALUES(4,'Adrián','Suárez',NULL,'Jaén',300);
INSERT INTO Consumidores VALUES(5,'Marcos','Loyola','Méndez','Almería',200);
INSERT INTO Consumidores VALUES(6,'María','Santana','Moreno','Cádiz',100);
INSERT INTO Consumidores VALUES(7,'Pilar','Ruiz',NULL,'Sevilla',300);
INSERT INTO Consumidores VALUES(8,'Pepe','Ruiz','Santana','Huelva',200);
INSERT INTO Consumidores VALUES(9,'Guillermo','López','Gómez','Granada',225);
INSERT INTO Consumidores VALUES(10,'Daniel','Santana','Loyola','Sevilla',125);
CREATE TABLE Suministradores (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    categoria REAL
);
INSERT INTO Suministradores VALUES(1,'Daniel','Sáez','Vega',0.1499999999999999945);
INSERT INTO Suministradores VALUES(2,'Juan','Gómez','López',0.1300000000000000044);
INSERT INTO Suministradores VALUES(3,'Diego','Flores','Salas',0.1100000000000000005);
INSERT INTO Suministradores VALUES(4,'Marta','Herrera','Gil',0.1400000000000000134);
INSERT INTO Suministradores VALUES(5,'Antonio','Carretero','Ortega',0.1199999999999999956);
INSERT INTO Suministradores VALUES(6,'Manuel','Domínguez','Hernández',0.1300000000000000044);
INSERT INTO Suministradores VALUES(7,'Antonio','Vega','Hernández',0.1100000000000000005);
INSERT INTO Suministradores VALUES(8,'Alfredo','Ruiz','Flores',0.05000000000000000277);
CREATE TABLE Compras (
    id INTEGER PRIMARY KEY,
    total REAL,
    fecha TEXT,
    id_consumidor INTEGER,
    id_suministrador INTEGER,
    FOREIGN KEY (id_consumidor) REFERENCES Consumidores(id),
    FOREIGN KEY (id_suministrador) REFERENCES Suministradores(id)
);
INSERT INTO Compras VALUES(1,150.5,'2020-10-05',5,2);
INSERT INTO Compras VALUES(2,270.6499999999999773,'2019-09-10',1,5);
INSERT INTO Compras VALUES(3,65.26000000000000511,'2020-10-05',2,1);
INSERT INTO Compras VALUES(4,110.5,'2019-08-17',8,3);
INSERT INTO Compras VALUES(5,948.5,'2020-09-10',5,2);
INSERT INTO Compras VALUES(6,2400.59999999999991,'2019-07-27',7,1);
INSERT INTO Compras VALUES(7,5760.0,'2018-09-10',2,1);
INSERT INTO Compras VALUES(8,1983.430000000000063,'2020-10-10',4,6);
INSERT INTO Compras VALUES(9,2480.40000000000009,'2019-10-10',8,3);
INSERT INTO Compras VALUES(10,250.4499999999999887,'2018-06-27',8,2);
INSERT INTO Compras VALUES(11,75.29000000000000626,'2019-08-17',3,7);
INSERT INTO Compras VALUES(12,3045.59999999999991,'2020-04-25',2,1);
INSERT INTO Compras VALUES(13,545.75,'2022-01-25',6,1);
INSERT INTO Compras VALUES(14,145.8199999999999932,'2020-02-02',6,1);
INSERT INTO Compras VALUES(15,370.8500000000000227,'2022-03-11',1,5);
INSERT INTO Compras VALUES(16,2389.230000000000018,'2022-03-11',1,5);
COMMIT;

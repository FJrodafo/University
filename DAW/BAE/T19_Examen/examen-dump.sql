PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Clientes (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    ciudad TEXT,
    puntos_fidelidad INTEGER
);
INSERT INTO Clientes VALUES(1,'Carlos','Martínez','García','Madrid',1500);
INSERT INTO Clientes VALUES(2,'Ana','López','Fernández','Barcelona',800);
INSERT INTO Clientes VALUES(3,'Miguel','Sánchez','Díaz','Valencia',NULL);
INSERT INTO Clientes VALUES(4,'Elena','Gómez',NULL,'Sevilla',1200);
INSERT INTO Clientes VALUES(5,'David','Pérez','Ruiz','Madrid',750);
INSERT INTO Clientes VALUES(6,'Laura','Jiménez','Moreno','Bilbao',950);
INSERT INTO Clientes VALUES(7,'Sofía','Hernández',NULL,'Zaragoza',1800);
INSERT INTO Clientes VALUES(8,'Javier','Domingo','Santos','Málaga',600);
INSERT INTO Clientes VALUES(9,'Patricia','Romero','González','Barcelona',1100);
INSERT INTO Clientes VALUES(10,'Antonio','Navarro','Torres','Valencia',400);
CREATE TABLE Empleados (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    comision REAL
);
INSERT INTO Empleados VALUES(1,'Daniel','Vázquez','Gil',0.1199999999999999956);
INSERT INTO Empleados VALUES(2,'María','Castro','Ortega',0.1000000000000000055);
INSERT INTO Empleados VALUES(3,'Pablo','Molina','Serrano',0.08000000000000000166);
INSERT INTO Empleados VALUES(4,'Lucía','Reyes','Martín',0.1100000000000000005);
INSERT INTO Empleados VALUES(5,'Alejandro','Suárez','Blanco',0.08999999999999999667);
INSERT INTO Empleados VALUES(6,'Isabel','Morales','Iglesias',0.1000000000000000055);
INSERT INTO Empleados VALUES(7,'Francisco','Santana','Méndez',0.08000000000000000166);
INSERT INTO Empleados VALUES(8,'Cristina','Cabrera','Flores',0.04000000000000000083);
CREATE TABLE Ventas (
    id INTEGER PRIMARY KEY,
    total REAL,
    fecha TEXT,
    id_cliente INTEGER,
    id_empleado INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id)
);
INSERT INTO Ventas VALUES(1,899.990000000000009,'2023-05-15',5,2);
INSERT INTO Ventas VALUES(2,1499.5,'2022-09-20',1,5);
INSERT INTO Ventas VALUES(3,450.75,'2023-05-15',2,1);
INSERT INTO Ventas VALUES(4,299.8999999999999773,'2022-08-10',8,3);
INSERT INTO Ventas VALUES(5,1799.0,'2023-04-22',5,2);
INSERT INTO Ventas VALUES(6,3299.989999999999782,'2022-07-05',7,1);
INSERT INTO Ventas VALUES(7,5999.0,'2021-09-12',2,1);
INSERT INTO Ventas VALUES(8,1299.950000000000045,'2023-03-18',4,6);
INSERT INTO Ventas VALUES(9,2499.5,'2022-10-15',8,3);
INSERT INTO Ventas VALUES(10,350.25,'2021-06-30',8,2);
INSERT INTO Ventas VALUES(11,199.990000000000009,'2022-08-10',3,7);
INSERT INTO Ventas VALUES(12,4199.0,'2023-02-14',2,1);
INSERT INTO Ventas VALUES(13,799.5,'2023-01-25',6,1);
INSERT INTO Ventas VALUES(14,249.9000000000000056,'2023-02-02',6,1);
INSERT INTO Ventas VALUES(15,899.0,'2023-03-10',1,5);
INSERT INTO Ventas VALUES(16,2799.989999999999782,'2023-03-10',1,5);
COMMIT;

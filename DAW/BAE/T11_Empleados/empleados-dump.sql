PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    salario REAL NOT NULL,
    departamento TEXT NOT NULL
);
INSERT INTO Empleados VALUES(1,'Juan',50000.0,'Ventas');
INSERT INTO Empleados VALUES(2,'María',60000.0,'TI');
INSERT INTO Empleados VALUES(3,'Carlos',55000.0,'Ventas');
INSERT INTO Empleados VALUES(4,'Ana',48000.0,'Recursos Humanos');
INSERT INTO Empleados VALUES(5,'Pedro',70000.0,'TI');
INSERT INTO Empleados VALUES(6,'Laura',52000.0,'Ventas');
INSERT INTO Empleados VALUES(7,'Javier',48000.0,'Recursos Humanos');
INSERT INTO Empleados VALUES(8,'Carmen',65000.0,'TI');
INSERT INTO Empleados VALUES(9,'Miguel',51000.0,'Ventas');
INSERT INTO Empleados VALUES(10,'Elena',55000.0,'Recursos Humanos');
INSERT INTO Empleados VALUES(11,'Diego',72000.0,'TI');
INSERT INTO Empleados VALUES(12,'Sofía',49000.0,'Ventas');
INSERT INTO Empleados VALUES(13,'Andrés',60000.0,'Recursos Humanos');
INSERT INTO Empleados VALUES(14,'Isabel',53000.0,'TI');
INSERT INTO Empleados VALUES(15,'Raúl',68000.0,'Ventas');
INSERT INTO Empleados VALUES(16,'Patricia',47000.0,'Recursos Humanos');
INSERT INTO Empleados VALUES(17,'Alejandro',71000.0,'TI');
INSERT INTO Empleados VALUES(18,'Natalia',54000.0,'Ventas');
INSERT INTO Empleados VALUES(19,'Roberto',49000.0,'Recursos Humanos');
INSERT INTO Empleados VALUES(20,'Beatriz',63000.0,'TI');
INSERT INTO sqlite_sequence VALUES('Empleados',20);
COMMIT;

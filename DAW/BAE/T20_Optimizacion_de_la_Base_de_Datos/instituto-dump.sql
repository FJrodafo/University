PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Alumnos (
        numero_inscripcion INTEGER,
        anio_inscripcion INTEGER,
        nombre TEXT,
        documento TEXT,
        domicilio TEXT,
        ciudad TEXT,
        provincia TEXT,
        PRIMARY KEY (numero_inscripcion, anio_inscripcion)
    );
INSERT INTO Alumnos VALUES(1,2025,'Juan Pérez','12345678','Calle Falsa 1','Rosario','Santa Fe');
INSERT INTO Alumnos VALUES(2,2025,'María García','23456789','Calle Falsa 2','Rosario','Santa Fe');
INSERT INTO Alumnos VALUES(3,2025,'Luis Rodríguez','34567890','Calle Falsa 3','Rosario','Santa Fe');
INSERT INTO Alumnos VALUES(4,2025,'Ana López','45678901','Calle Falsa 4','Rosario','Santa Fe');
COMMIT;

PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Ejemplos (
    id INTEGER PRIMARY KEY,
    texto TEXT,
    n_entero INTEGER,
    n_decimal REAL,
    fecha DATE,
    booleano BOOLEAN
);
INSERT INTO Ejemplos VALUES(9,'Ejemplo9',41,55.0,'2025-03-22',0);
INSERT INTO Ejemplos VALUES(29,'Modificado',37,50.0,'2025-03-22',0);
INSERT INTO Ejemplos VALUES(49,'Modificado',38,50.0,'2025-03-22',0);
COMMIT;

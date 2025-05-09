PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Clientes (
        documento CHAR(8) NOT NULL,
        nombre VARCHAR(30) NOT NULL,
        domicilio VARCHAR(30),
        ciudad VARCHAR(20),
        provincia VARCHAR(20),
        telefono VARCHAR(11),
        PRIMARY KEY (documento)
    );
COMMIT;

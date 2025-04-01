PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre TEXT,
    edad INTEGER,
    direccion TEXT
);
INSERT INTO Clientes VALUES(1,'Juan Pérez',30,'Calle A #123');
INSERT INTO Clientes VALUES(2,'María Gómez',25,'Avenida B #456');
INSERT INTO Clientes VALUES(3,'Carlos López',35,'Calle C #789');
INSERT INTO Clientes VALUES(4,'Ana Martínez',28,'Avenida D #101');
INSERT INTO Clientes VALUES(5,'Pedro Rodríguez',40,'Calle E #234');
INSERT INTO Clientes VALUES(6,'Laura Sánchez',32,'Avenida F #567');
INSERT INTO Clientes VALUES(7,'Miguel González',27,'Calle G #890');
INSERT INTO Clientes VALUES(8,'Isabel Díaz',38,'Avenida H #111');
INSERT INTO Clientes VALUES(9,'Francisco Ruiz',33,'Calle I #222');
INSERT INTO Clientes VALUES(10,'Elena Torres',29,'Avenida J #333');
CREATE TABLE Coches (
    id_coche INTEGER PRIMARY KEY,
    modelo TEXT,
    marca TEXT,
    año INTEGER,
    precio REAL
);
INSERT INTO Coches VALUES(1,'Sedán','Toyota',2022,25000.0);
INSERT INTO Coches VALUES(2,'Hatchback','Honda',2021,22000.0);
INSERT INTO Coches VALUES(3,'SUV','Ford',2023,30000.0);
INSERT INTO Coches VALUES(4,'Coupé','Chevrolet',2022,28000.0);
INSERT INTO Coches VALUES(5,'Camioneta','Nissan',2023,32000.0);
INSERT INTO Coches VALUES(6,'Compacto','Volkswagen',2021,20000.0);
INSERT INTO Coches VALUES(7,'Híbrido','Hyundai',2022,27000.0);
INSERT INTO Coches VALUES(8,'Deportivo','Mazda',2023,35000.0);
INSERT INTO Coches VALUES(9,'Pickup','Ram',2022,31000.0);
INSERT INTO Coches VALUES(10,'Eléctrico','Tesla',2021,40000.0);
CREATE TABLE Ventas (
    id_venta INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    id_coche INTEGER,
    fecha_venta DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_coche) REFERENCES Coches(id_coche)
);
INSERT INTO Ventas VALUES(1,1,1,'2023-01-15');
INSERT INTO Ventas VALUES(2,2,2,'2023-02-20');
INSERT INTO Ventas VALUES(3,3,3,'2023-03-25');
INSERT INTO Ventas VALUES(4,4,4,'2023-04-10');
INSERT INTO Ventas VALUES(5,5,5,'2023-05-05');
INSERT INTO Ventas VALUES(6,6,6,'2023-06-15');
INSERT INTO Ventas VALUES(7,7,7,'2023-07-20');
INSERT INTO Ventas VALUES(8,8,8,'2023-08-25');
INSERT INTO Ventas VALUES(9,10,10,'2023-10-05');
COMMIT;

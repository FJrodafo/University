PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Socios (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    ciudad TEXT,
    fecha_alta TEXT,
    categoria TEXT
);
INSERT INTO Socios VALUES(1,'Laura','García','Martínez','Madrid','2020-03-15','A');
INSERT INTO Socios VALUES(2,'Carlos','López','Fernández','Barcelona','2021-05-20','B');
INSERT INTO Socios VALUES(3,'Ana','Sánchez',NULL,'Valencia','2022-01-10','C');
INSERT INTO Socios VALUES(4,'David','Pérez','Gómez','Sevilla','2021-11-30','A');
INSERT INTO Socios VALUES(5,'Elena','Martín','Díaz','Madrid','2023-02-18','B');
INSERT INTO Socios VALUES(6,'Javier','Ruiz','Moreno','Bilbao','2020-07-22','A');
INSERT INTO Socios VALUES(7,'Sofía','Hernández','Jiménez','Zaragoza','2022-09-05','C');
INSERT INTO Socios VALUES(8,'Miguel','Navarro','Torres','Málaga','2021-04-12','B');
INSERT INTO Socios VALUES(9,'Patricia','Romero',NULL,'Barcelona','2023-01-15','A');
INSERT INTO Socios VALUES(10,'Antonio','Domingo','Santos','Valencia','2020-12-08','C');
CREATE TABLE Libros (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    autor TEXT,
    genero TEXT,
    anio_publicacion INTEGER,
    disponible INTEGER 
);
INSERT INTO Libros VALUES(1,'El Quijote','Miguel de Cervantes','Clásico',1605,1);
INSERT INTO Libros VALUES(2,'Cien años de soledad','Gabriel García Márquez','Realismo mágico',1967,0);
INSERT INTO Libros VALUES(3,'1984','George Orwell','Ciencia ficción',1949,1);
INSERT INTO Libros VALUES(4,'Orgullo y prejuicio','Jane Austen','Romance',1813,0);
INSERT INTO Libros VALUES(5,'La sombra del viento','Carlos Ruiz Zafón','Misterio',2001,1);
INSERT INTO Libros VALUES(6,'Rayuela','Julio Cortázar','Experimental',1963,0);
INSERT INTO Libros VALUES(7,'Ficciones','Jorge Luis Borges','Cuentos',1944,1);
INSERT INTO Libros VALUES(8,'Los pilares de la Tierra','Ken Follett','Histórica',1989,0);
INSERT INTO Libros VALUES(9,'El amor en los tiempos del cólera','Gabriel García Márquez','Romance',1985,1);
INSERT INTO Libros VALUES(10,'La casa de los espíritus','Isabel Allende','Realismo mágico',1982,0);
CREATE TABLE Bibliotecarios (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    antiguedad INTEGER 
);
INSERT INTO Bibliotecarios VALUES(1,'Daniel','Vázquez','Gil',5);
INSERT INTO Bibliotecarios VALUES(2,'María','Castro','Ortega',3);
INSERT INTO Bibliotecarios VALUES(3,'Pablo','Molina','Serrano',2);
INSERT INTO Bibliotecarios VALUES(4,'Lucía','Reyes','Martín',7);
INSERT INTO Bibliotecarios VALUES(5,'Alejandro','Suárez','Blanco',1);
INSERT INTO Bibliotecarios VALUES(6,'Isabel','Morales','Iglesias',4);
INSERT INTO Bibliotecarios VALUES(7,'Francisco','Santana','Méndez',6);
INSERT INTO Bibliotecarios VALUES(8,'Cristina','Cabrera','Flores',2);
CREATE TABLE Prestamos (
    id INTEGER PRIMARY KEY,
    fecha_prestamo TEXT,
    fecha_devolucion TEXT,
    id_socio INTEGER,
    id_libro INTEGER,
    id_bibliotecario INTEGER,
    FOREIGN KEY (id_socio) REFERENCES Socios(id),
    FOREIGN KEY (id_libro) REFERENCES Libros(id),
    FOREIGN KEY (id_bibliotecario) REFERENCES Bibliotecarios(id)
);
INSERT INTO Prestamos VALUES(1,'2023-01-10','2023-01-24',1,2,1);
INSERT INTO Prestamos VALUES(2,'2023-02-15','2023-03-01',3,4,6);
INSERT INTO Prestamos VALUES(3,'2023-03-20',NULL,5,6,4);
INSERT INTO Prestamos VALUES(4,'2023-04-05','2023-04-19',2,8,8);
INSERT INTO Prestamos VALUES(5,'2023-05-12',NULL,4,10,1);
INSERT INTO Prestamos VALUES(6,'2023-01-22','2023-02-05',6,2,1);
INSERT INTO Prestamos VALUES(7,'2023-02-18','2023-03-04',7,4,2);
INSERT INTO Prestamos VALUES(8,'2023-03-25',NULL,8,6,2);
INSERT INTO Prestamos VALUES(9,'2023-04-10','2023-04-24',9,8,1);
INSERT INTO Prestamos VALUES(10,'2023-05-15',NULL,10,10,6);
INSERT INTO Prestamos VALUES(11,'2023-01-05','2023-01-19',1,1,5);
INSERT INTO Prestamos VALUES(12,'2023-02-10','2023-02-24',2,3,5);
INSERT INTO Prestamos VALUES(13,'2023-03-15',NULL,3,5,8);
INSERT INTO Prestamos VALUES(14,'2023-04-20','2023-05-04',4,7,1);
INSERT INTO Prestamos VALUES(15,'2023-05-25',NULL,5,9,2);
COMMIT;

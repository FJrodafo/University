PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Alumnos (
    id_alumno INTEGER PRIMARY KEY,
    nombre TEXT,
    edad INTEGER,
    direccion TEXT
);
INSERT INTO Alumnos VALUES(1,'Juan',20,'Calle A');
INSERT INTO Alumnos VALUES(2,'María',21,'Calle B');
INSERT INTO Alumnos VALUES(3,'Pedro',19,'Calle C');
INSERT INTO Alumnos VALUES(4,'Laura',22,'Calle D');
INSERT INTO Alumnos VALUES(5,'Carlos',20,'Calle E');
INSERT INTO Alumnos VALUES(6,'Ana',19,'Calle F');
INSERT INTO Alumnos VALUES(7,'Sofía',21,'Calle G');
INSERT INTO Alumnos VALUES(8,'Diego',20,'Calle H');
INSERT INTO Alumnos VALUES(9,'Lucía',22,'Calle I');
INSERT INTO Alumnos VALUES(10,'Miguel',19,'Calle J');
CREATE TABLE Clases (
    id_clase INTEGER PRIMARY KEY,
    nombre TEXT,
    materia TEXT,
    profesor TEXT
);
INSERT INTO Clases VALUES(1,'Matemáticas 101','Matemáticas','Profesor X');
INSERT INTO Clases VALUES(2,'Historia Antigua','Historia','Profesor Y');
INSERT INTO Clases VALUES(3,'Literatura Moderna','Literatura','Profesor Z');
INSERT INTO Clases VALUES(4,'Biología Avanzada','Biología','Profesor W');
INSERT INTO Clases VALUES(5,'Química Orgánica','Química','Profesor V');
INSERT INTO Clases VALUES(6,'Física Cuántica','Física','Profesor U');
INSERT INTO Clases VALUES(7,'Arte Contemporáneo','Arte','Profesor T');
INSERT INTO Clases VALUES(8,'Inglés Avanzado','Idiomas','Profesor S');
INSERT INTO Clases VALUES(9,'Economía Internacional','Economía','Profesor R');
INSERT INTO Clases VALUES(10,'Derecho Penal','Derecho','Profesor Q');
CREATE TABLE Inscripciones (
    id_inscripcion INTEGER PRIMARY KEY,
    id_alumno INTEGER,
    id_clase INTEGER,
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
    FOREIGN KEY (id_clase) REFERENCES Clases(id_clase)
);
INSERT INTO Inscripciones VALUES(1,1,1);
INSERT INTO Inscripciones VALUES(2,1,2);
INSERT INTO Inscripciones VALUES(3,2,3);
INSERT INTO Inscripciones VALUES(4,2,4);
INSERT INTO Inscripciones VALUES(5,3,5);
INSERT INTO Inscripciones VALUES(6,3,6);
INSERT INTO Inscripciones VALUES(7,4,7);
INSERT INTO Inscripciones VALUES(8,4,8);
INSERT INTO Inscripciones VALUES(9,5,9);
INSERT INTO Inscripciones VALUES(10,6,10);
COMMIT;

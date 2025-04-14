## Alumnos

```sql
--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Alumnos (
    id_alumno INTEGER PRIMARY KEY,
    nombre TEXT,
    edad INTEGER,
    direccion TEXT
);

CREATE TABLE Clases (
    id_clase INTEGER PRIMARY KEY,
    nombre TEXT,
    materia TEXT,
    profesor TEXT
);

CREATE TABLE Inscripciones (
    id_inscripcion INTEGER PRIMARY KEY,
    id_alumno INTEGER,
    id_clase INTEGER,
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
    FOREIGN KEY (id_clase) REFERENCES Clases(id_clase)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Alumnos (nombre, edad, direccion) VALUES
    ('Juan', 20, 'Calle A'),
    ('María', 21, 'Calle B'),
    ('Pedro', 19, 'Calle C'),
    ('Laura', 22, 'Calle D'),
    ('Carlos', 20, 'Calle E'),
    ('Ana', 19, 'Calle F'),
    ('Sofía', 21, 'Calle G'),
    ('Diego', 20, 'Calle H'),
    ('Lucía', 22, 'Calle I'),
    ('Miguel', 19, 'Calle J');

INSERT INTO Clases (nombre, materia, profesor) VALUES
    ('Matemáticas 101', 'Matemáticas', 'Profesor X'),
    ('Historia Antigua', 'Historia', 'Profesor Y'),
    ('Literatura Moderna', 'Literatura', 'Profesor Z'),
    ('Biología Avanzada', 'Biología', 'Profesor W'),
    ('Química Orgánica', 'Química', 'Profesor V'),
    ('Física Cuántica', 'Física', 'Profesor U'),
    ('Arte Contemporáneo', 'Arte', 'Profesor T'),
    ('Inglés Avanzado', 'Idiomas', 'Profesor S'),
    ('Economía Internacional', 'Economía', 'Profesor R'),
    ('Derecho Penal', 'Derecho', 'Profesor Q');

INSERT INTO Inscripciones (id_alumno, id_clase) VALUES
    (1, 1), 
    (1, 2), 
    (2, 3), 
    (2, 4), 
    (3, 5), 
    (3, 6), 
    (4, 7), 
    (4, 8), 
    (5, 9), 
    (6, 10); 
```

1. Obtener el nombre del alumno y el nombre de la clase en la que está inscrito.

    ```sql
    
    ```
2. Obtener el nombre del alumno y la materia de las clases en las que está inscrito.

    ```sql
    
    ```
3. Obtener el nombre del alumno, la edad y el nombre del profesor de las clases en las que está inscrito.

    ```sql
    
    ```
4. Obtener el nombre del alumno y la dirección de las clases en las que está inscrito.

    ```sql
    
    ```
5. Obtener el nombre del alumno y el nombre de la clase junto con el profesor.

    ```sql
    
    ```
6. Obtener el nombre del alumno, la materia y el nombre del profesor de las clases en las que está inscrito.

    ```sql
    
    ```
7. Obtener el nombre del alumno, la edad y la materia de las clases en las que está inscrito.

    ```sql
    
    ```
8. Obtener el nombre del alumno, la dirección y el profesor de las clases en las que está inscrito.

    ```sql
    
    ```
9. Obtener el nombre del alumno y la materia de las clases en las que está inscrito, ordenado por el nombre del alumno.

    ```sql
    
    ```
10. Contar cuántos alumnos están inscritos en cada clase.

    ```sql
    
    ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
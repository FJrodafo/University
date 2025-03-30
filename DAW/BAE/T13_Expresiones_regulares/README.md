## Expresiones regulares

```sql
--  ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐
--  ║  ├┬┘├┤ ├─┤ │ ├┤    ║ ├─┤├┴┐│  ├┤ 
--  ╚═╝┴└─└─┘┴ ┴ ┴ └─┘   ╩ ┴ ┴└─┘┴─┘└─┘

CREATE TABLE Autores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT
);

CREATE TABLE Libros (
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    autor_id INTEGER,
    editorial TEXT,
    precio REAL,
    FOREIGN KEY (autor_id) REFERENCES Autores(id)
);

--  ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║│││└─┐├┤ ├┬┘ │   ╚╗╔╝├─┤│  │ │├┤ └─┐
--  ╩┘└┘└─┘└─┘┴└─ ┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

INSERT INTO Autores (nombre) VALUES
    ('J.K. Rowling'),
    ('Stephen King'),
    ('George Orwell'),
    ('Jane Austen'),
    ('Agatha Christie');

INSERT INTO Libros (titulo, autor_id, editorial, precio) VALUES
    ('The Great Gatsby', 6, 'Charles Scribner''s Sons', 20.99),
    ('To Kill a Mockingbird', 7, 'J.B. Lippincott & Co.', 15.95),
    ('The Catcher in the Rye', 8, 'Little, Brown and Company', 18.75),
    ('One Hundred Years of Solitude', 9, 'Harper & Row', 22.50),
    ('Brave New World', 3, 'Chatto & Windus', 17.99),
    ('The Hobbit', 10, 'George Allen & Unwin', 24.99),
    ('The Lord of the Rings', 10, 'George Allen & Unwin', 35.50),
    ('The Chronicles of Narnia', 11, 'Geoffrey Bles', 28.99),
    ('The Odyssey', 12, 'Homer', 14.95),
    ('The Iliad', 12, 'Homer', 14.95),
    ('Moby-Dick', 13, 'Harper & Brothers', 19.99),
    ('The Road', 14, 'Alfred A. Knopf', 16.75),
    ('The Grapes of Wrath', 15, 'The Viking Press', 21.50),
    ('Wuthering Heights', 16, 'Emily Brontë', 12.99),
    ('The Old Man and the Sea', 17, 'Charles Scribner''s Sons', 18.95),
    ('The Count of Monte Cristo', 18, 'Pétion', 27.99),
    ('The Picture of Dorian Gray', 19, 'Ward, Lock, and Company', 14.50),
    ('The Adventures of Sherlock Holmes', 20, 'George Newnes', 16.99),
    ('Frankenstein', 21, 'Lackington, Hughes, Harding, Mavor, & Jones', 13.25),
    ('Alice''s Adventures in Wonderland', 22, 'Macmillan', 11.50),
    ('The Prince', 23, 'Niccolò Machiavelli', 10.99),
    ('Don Quixote', 24, 'Francisco de Robles', 26.75),
    ('The Divine Comedy', 25, 'Dante Alighieri', 20.50),
    ('Anna Karenina', 26, 'The Russian Messenger', 23.99),
    ('Les Misérables', 27, 'A. Lacroix, Verboeckhoven & Cie.', 29.75),
    ('The Jungle Book', 28, 'Macmillan Publishers', 14.99),
    ('The Wind in the Willows', 29, 'Methuen & Co.', 17.50),
    ('War and Peace', 26, 'The Russian Messenger', 33.25),
    ('Crime and Punishment', 30, 'The Russian Messenger', 19.99);
```

1. Selección de libros cuyo título comienza con "H".

    ```sql
    SELECT titulo FROM Libros WHERE titulo REGEXP '^H';
    ```
2. Libros escritos por autores cuyos nombres terminan con "ing".

    ```sql
    SELECT L.titulo, A.nombre FROM Libros L JOIN Autores A ON L.autor_id = A.id WHERE A.nombre REGEXP 'ing$';
    ```
3. Libros con títulos que contienen la palabra "and" en cualquier posición.

    ```sql
    SELECT titulo FROM Libros WHERE titulo REGEXP 'and';
    ```
4. Libros cuyo título comienza con una vocal.

    ```sql
    SELECT titulo FROM Libros WHERE titulo REGEXP '^[AEIOUaeiou]';
    ```
5. Libros cuyo autor tiene al menos una vocal repetida.

    ```sql
    SELECT L.titulo, A.nombre FROM Libros L JOIN Autores A ON L.autor_id = A.id WHERE A.nombre REGEXP '.*[AEIOUaeiou]';
    ```
6. Libros con precios que tienen dos dígitos decimales exactos.

    ```sql
    SELECT titulo, precio FROM Libros WHERE precio REGEXP '\.\d{2}$';
    ```
7. Libros cuyos títulos tienen al menos tres palabras.

    ```sql
    
    ```
8. Obtener todos los autores cuyo nombre empieza con la letra "A":

    ```sql
    
    ```
9. Seleccionar los libros cuyo título contiene la palabra "SQL":

    ```sql
    
    ```
10. Obtener todos los autores cuyo nombre termina con "ez":

    ```sql
    
    ```
11. Obtener todos los autores cuyo nombre tiene al menos 5 caracteres:

    ```sql
    
    ```
12. Seleccionar los libros cuya editorial es diferente de "EditorialX":

    ```sql
    
    ```
13. Obtener todos los autores cuyo nombre contiene al menos una vocal:

    ```sql
    
    ```
14. Seleccionar los libros cuyo título comienza con una letra mayúscula:

    ```sql
    
    ```
15. Obtener todos los autores cuyo nombre no contiene la letra "r":

    ```sql
    
    ```
16. Seleccionar los libros cuya editorial empieza con la letra "P":

    ```sql
    
    ```
17. Obtener todos los autores cuyo nombre tiene exactamente 6 caracteres:

    ```sql
    
    ```
18. Seleccionar los libros cuyo título contiene al menos un número:

    ```sql
    
    ```
19. Obtener todos los autores cuyo nombre inicia con una vocal:

    ```sql
    
    ```
20. Obtener todos los autores cuyo nombre no contiene espacios en blanco:

    ```sql
    
    ```
21. Seleccionar los libros cuyo título termina con una vocal:

    ```sql
    
    ```
22. Obtener todos los autores cuyo nombre contiene la secuencia "er":

    ```sql
    
    ```
23. Seleccionar los libros cuyo título empieza con la palabra "The":

    ```sql
    
    ```
24. Obtener todos los autores cuyo nombre tiene al menos una letra mayúscula:

    ```sql
    
    ```
25. Seleccionar los libros cuyo precio es un número decimal con exactamente dos decimales:

    ```sql
    
    ```
26. Obtener todos los autores cuyo nombre no contiene números:

    ```sql
    
    ```
27. Seleccionar los libros cuyo título contiene al menos tres vocales:

    ```sql
    
    ```
28. Obtener todos los autores cuyo nombre inicia con una consonante:

    ```sql
    
    ```
29. Seleccionar los libros cuyo título no contiene la palabra "Science":

    ```sql
    
    ```
30. Obtener todos los autores cuyo nombre tiene al menos una letra repetida consecutivamente:

    ```sql
    
    ```
31. Obtener todos los autores cuyo nombre empieza con "M" o termina con "n":

    ```sql
    
    ```
32. Obtener todos los autores cuyo nombre no contiene caracteres especiales:

    ```sql
    
    ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
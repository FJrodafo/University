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
    -- ^  → Inicio de la cadena.
    -- H  → Indica que buscamos una "H".
    -- ^H → Indica que buscamos una "H" al comienzo de la cadena.
    SELECT titulo FROM Libros WHERE titulo REGEXP '^H';
    ```
2. Libros escritos por autores cuyos nombres terminan con "ing".

    ```sql
    -- ing  → Indica que buscamos literalmente "ing".
    -- $    → Fin de la cadena.
    -- ing$ → Indica que buscamos literalmente "ing" al final de la cadena.
    SELECT L.titulo, A.nombre FROM Libros L JOIN Autores A ON L.autor_id = A.id WHERE A.nombre REGEXP 'ing$';
    ```
3. Libros con títulos que contienen la palabra "and" en cualquier posición.

    ```sql
    -- and → Indica que buscamos literalmente "and" en cualquier parte del texto.
    SELECT titulo FROM Libros WHERE titulo REGEXP 'and';
    ```
4. Libros cuyo título comienza con una vocal.

    ```sql
    -- ^             → Inicio de la cadena.
    -- [AEIOUaeiou]  → Indica que buscamos una vocal.
    -- ^[AEIOUaeiou] → Indica que buscamos una vocal al comienzo de la cadena.
    SELECT titulo FROM Libros WHERE titulo REGEXP '^[AEIOUaeiou]';
    ```
5. Libros cuyo autor tiene al menos una vocal repetida.

    ```sql
    -- .              → Representa cualquier carácter (letra, número, espacio, etc).
    -- *              → Permite que ese carácter aparezca 0 o más veces.
    -- [AEIOUaeiou]   → Indica que buscamos una vocal en cualquier parte del texto.
    -- .*[AEIOUaeiou] → Encuentra cualquier cadena que tenga al menos una vocal, sin importar qué haya antes.
    SELECT L.titulo, A.nombre FROM Libros L JOIN Autores A ON L.autor_id = A.id WHERE A.nombre REGEXP '.*[AEIOUaeiou]';
    ```
6. Libros con precios que tienen dos dígitos decimales exactos.

    ```sql
    SELECT titulo, precio FROM Libros WHERE precio LIKE '%.__';
    ```

    ```sql
    -- \.       → Punto literal.
    -- \d{2}    → Dos dígitos numéricos.
    -- $        → Fin de la cadena.
    -- \.\d{2}$ → Indica que buscamos dos dígitos numéricos precedidos de un punto al final de la cadena.
    SELECT titulo, precio FROM Libros WHERE precio REGEXP '\.\d{2}$';
    ```
7. Libros cuyos títulos tienen al menos tres palabras.

    ```sql
    -- ^                 → Inicio de la cadena.
    -- \w+               → Coincide con una palabra, una secuencia de letras, números o guiones bajos.
    -- \s+               → Coincide con uno o más espacios, tabulaciones o saltos de línea.
    -- (\w+\s+){2,}      → {2,} significa "al menos 2 repeticiones" de "palabra + espacio".
    -- \w+               → Coincide con una última palabra.
    -- $                 → Fin de la cadena.
    -- ^(\w+\s+){2,}\w+$ → Indica que buscamos dos palabras seguidas de un espacio y finalizamos con una tercera palabra.
    SELECT titulo FROM Libros WHERE titulo REGEXP '^(\w+\s+){2,}\w+$';
    ```
8. Obtener todos los autores cuyo nombre empieza con la letra "A":

    ```sql
    -- ^  → Inicio de la cadena.
    -- A  → Indica que buscamos una "A".
    -- ^A → Indica que buscamos una "A" al comienzo de la cadena.
    SELECT nombre FROM Autores WHERE nombre REGEXP '^A';
    ```
9. Seleccionar los libros cuyo título contiene la palabra "SQL":

    ```sql
    -- SQL → Indica que buscamos literalmente "SQL" en cualquier parte del texto.
    SELECT titulo FROM Libros WHERE titulo REGEXP 'SQL';
    ```
10. Obtener todos los autores cuyo nombre termina con "ez":

    ```sql
    -- ez  → Indica que buscamos literalmente "ez".
    -- $   → Fin de la cadena.
    -- ez$ → Indica que buscamos literalmente "ez" al final de la cadena.
    SELECT nombre FROM Autores WHERE nombre REGEXP 'ez$';
    ```
11. Obtener todos los autores cuyo nombre tiene al menos 5 caracteres:

    ```sql
    SELECT nombre FROM Autores WHERE LENGTH(nombre) >= 5;
    ```

    ```sql
    -- ^       → Inicio de la cadena.
    -- .       → Representa cualquier carácter (letra, número, espacio, etc).
    -- {5,}    → Indica que debe haber al menos 5 caracteres.
    -- $       → Fin de la cadena.
    -- ^.{5,}$ → Indica que buscamos al menos 5 caracteres de cualquier tipo.
    SELECT nombre FROM Autores WHERE nombre REGEXP '^.{5,}$';
    ```
12. Seleccionar los libros cuya editorial es diferente de "EditorialX":

    ```sql
    SELECT titulo FROM Libros WHERE editorial <> 'EditorialX';
    ```

    ```sql
    -- ^            → Inicio de la cadena.
    -- EditorialX   → Indica que buscamos literalmente "EditorialX".
    -- $            → Fin de la cadena.
    -- ^EditorialX$ → Indica que el valor debe coincidir exactamente con "EditorialX" (desde el inicio ^ hasta el final $).
    SELECT titulo FROM Libros WHERE editorial NOT REGEXP '^EditorialX$';
    ```
13. Obtener todos los autores cuyo nombre contiene al menos una vocal:

    ```sql
    SELECT nombre FROM Autores 
     WHERE nombre LIKE '%a%' 
        OR nombre LIKE '%e%' 
        OR nombre LIKE '%i%' 
        OR nombre LIKE '%o%' 
        OR nombre LIKE '%u%' 
        OR nombre LIKE '%A%' 
        OR nombre LIKE '%E%' 
        OR nombre LIKE '%I%' 
        OR nombre LIKE '%O%' 
        OR nombre LIKE '%U%';
    ```

    ```sql
    -- [AEIOUaeiou] → Indica que buscamos que haya al menos una vocal, ya sea mayúscula o minúscula. (No se necesita ^ o $ porque no importa la posición, solo que exista.)
    SELECT nombre FROM Autores WHERE nombre REGEXP '[AEIOUaeiou]';
    ```
14. Seleccionar los libros cuyo título comienza con una letra mayúscula:

    ```sql
    -- ^      → Inicio de la cadena.
    -- [A-Z]  → Indica cualquier letra mayúscula del alfabeto inglés.
    -- ^[A-Z] → Indica que buscamos que la palabra comience con una letra mayúscula.
    SELECT titulo FROM Libros WHERE titulo REGEXP '^[A-Z]';
    ```
15. Obtener todos los autores cuyo nombre no contiene la letra "r":

    ```sql
    SELECT nombre FROM Autores WHERE nombre NOT LIKE '%r%';
    ```

    ```sql
    -- r → Indica que buscamos literalmente "r".
    SELECT nombre FROM Autores WHERE nombre NOT REGEXP 'r';
    ```
16. Seleccionar los libros cuya editorial empieza con la letra "P":

    ```sql
    SELECT titulo, editorial FROM Libros WHERE editorial LIKE 'P%';
    ```

    ```sql
    -- ^  → Inicio de la cadena.
    -- P  → Indica que buscamos literalmente "P".
    -- ^P → Indica que buscamos literalmente "P" al comienzo de la cadena.
    SELECT titulo, editorial FROM Libros WHERE editorial REGEXP '^P';
    ```
17. Obtener todos los autores cuyo nombre tiene exactamente 12 caracteres:

    ```sql
    SELECT nombre FROM Autores WHERE LENGTH(nombre) = 12;
    ```

    ```sql
    -- ^       → Inicio de la cadena.
    -- .       → Representa cualquier carácter (letra, número, espacio, etc).
    -- {12}    → Indica que debe haber exactamente 12 caracteres.
    -- $       → Fin de la cadena.
    -- ^.{12}$ → Indica que buscamos exactamente 12 caracteres de cualquier tipo.
    SELECT nombre FROM Autores WHERE nombre REGEXP '^.{12}$';
    ```
18. Seleccionar los libros cuyo título contiene al menos un número:

    ```sql
    SELECT titulo FROM Libros 
     WHERE titulo LIKE '%0%'
        OR titulo LIKE '%1%'
        OR titulo LIKE '%2%'
        OR titulo LIKE '%3%'
        OR titulo LIKE '%4%'
        OR titulo LIKE '%5%'
        OR titulo LIKE '%6%'
        OR titulo LIKE '%7%'
        OR titulo LIKE '%8%'
        OR titulo LIKE '%9%';
    ```

    ```sql
    -- [0-9] → Indica que buscamos que haya al menos un número. (No se necesita ^ o $ porque no importa la posición, solo que exista.)
    SELECT titulo FROM Libros WHERE titulo REGEXP '[0-9]';
    ```
19. Obtener todos los autores cuyo nombre inicia con una vocal:

    ```sql
    SELECT nombre FROM Autores 
     WHERE nombre LIKE 'a%' 
        OR nombre LIKE 'e%' 
        OR nombre LIKE 'i%' 
        OR nombre LIKE 'o%' 
        OR nombre LIKE 'u%' 
        OR nombre LIKE 'A%' 
        OR nombre LIKE 'E%' 
        OR nombre LIKE 'I%' 
        OR nombre LIKE 'O%' 
        OR nombre LIKE 'U%';
    ```

    ```sql
    -- ^             → Inicio de la cadena.
    -- [AEIOUaeiou]  → Indica que buscamos que haya al menos una vocal, ya sea mayúscula o minúscula.
    -- ^[AEIOUaeiou] → Indica que buscamos que haya al menos una vocal, ya sea mayúscula o minúscula, al comienzo de la cadena.
    SELECT nombre FROM Autores WHERE nombre REGEXP '^[AEIOUaeiou]';
    ```
20. Obtener todos los autores cuyo nombre no contiene espacios en blanco:

    ```sql
    SELECT nombre FROM Autores WHERE nombre NOT LIKE '% %';
    ```

    ```sql
    -- \s → Indica espacio en blanco. (No se necesita ^ o $ porque no importa la posición, solo que exista.)
    SELECT nombre FROM Autores WHERE nombre NOT REGEXP '\s';
    ```
21. Seleccionar los libros cuyo título termina con una vocal:

    ```sql
    SELECT titulo FROM Libros 
     WHERE titulo LIKE '%a' 
        OR titulo LIKE '%e' 
        OR titulo LIKE '%i' 
        OR titulo LIKE '%o' 
        OR titulo LIKE '%u' 
        OR titulo LIKE '%A' 
        OR titulo LIKE '%E' 
        OR titulo LIKE '%I' 
        OR titulo LIKE '%O' 
        OR titulo LIKE '%U';
    ```

    ```sql
    -- [AEIOUaeiou]  → Indica que buscamos que haya al menos una vocal, ya sea mayúscula o minúscula.
    -- $             → Fin de la cadena.
    -- [AEIOUaeiou]$ → Indica que buscamos que haya al menos una vocal, ya sea mayúscula o minúscula, al final de la cadena.
    SELECT titulo FROM Libros WHERE titulo REGEXP '[AEIOUaeiou]$';
    ```
22. Obtener todos los autores cuyo nombre contiene la secuencia "er":

    ```sql
    SELECT nombre FROM Autores WHERE nombre LIKE '%er%';
    ```

    ```sql
    -- er → Indica que buscamos literalmente "er". (No se necesita ^ o $ porque no importa la posición, solo que exista.)
    SELECT nombre FROM Autores WHERE nombre REGEXP 'er';
    ```
23. Seleccionar los libros cuyo título empieza con la palabra "The":

    ```sql
    SELECT titulo FROM Libros WHERE titulo LIKE 'The %';
    ```

    ```sql
    -- ^      → Inicio de la cadena.
    -- The    → Indica que buscamos literalmente "The".
    -- \s     → Indica espacio en blanco.
    -- ^The\s → Indica que buscamos que la cadena comience con "The" seguido de un espacio en blanco (lo que implica que es una palabra completa).
    SELECT titulo FROM Libros WHERE titulo REGEXP '^The\s';
    ```
24. Obtener todos los autores cuyo nombre tiene al menos una letra mayúscula:

    ```sql
    -- [A-Z] → Indica que buscamos que haya al menos una letra mayúscula. (No se necesita ^ o $ porque no importa la posición, solo que exista.)
    SELECT nombre FROM Autores WHERE nombre REGEXP '[A-Z]';
    ```
25. Seleccionar los libros cuyo precio es un número decimal con exactamente dos decimales:

    ```sql
    SELECT titulo, precio FROM Libros WHERE precio LIKE '%.__';
    ```

    ```sql
    -- \.       → Punto literal.
    -- \d{2}    → Dos dígitos numéricos.
    -- $        → Fin de la cadena.
    -- \.\d{2}$ → Indica que buscamos dos dígitos numéricos precedidos de un punto al final de la cadena.
    SELECT titulo, precio FROM Libros WHERE precio REGEXP '\.\d{2}$';
    ```
26. Obtener todos los autores cuyo nombre no contiene números:

    ```sql
    SELECT nombre FROM Autores 
     WHERE nombre NOT LIKE '%0%'
        OR nombre NOT LIKE '%1%'
        OR nombre NOT LIKE '%2%'
        OR nombre NOT LIKE '%3%'
        OR nombre NOT LIKE '%4%'
        OR nombre NOT LIKE '%5%'
        OR nombre NOT LIKE '%6%'
        OR nombre NOT LIKE '%7%'
        OR nombre NOT LIKE '%8%'
        OR nombre NOT LIKE '%9%';
    ```

    ```sql
    -- [0-9] → Indica que buscamos que haya al menos un número. (No se necesita ^ o $ porque no importa la posición, solo que exista.)
    SELECT nombre FROM Autores WHERE nombre NOT REGEXP '[0-9]';
    ```
27. Seleccionar los libros cuyo título contiene al menos nueve vocales:

    ```sql
    -- .                      → Representa cualquier carácter (letra, número, espacio, etc).
    -- *                      → Permite que ese carácter aparezca 0 o más veces.
    -- [AEIOUaeiou]           → Indica que buscamos una vocal en cualquier parte del texto.
    -- {9,}                   → Indica que debe haber al menos 9 caracteres o repeticiones de la encapsulación previa ().
    -- (.*[AEIOUaeiou].*){9,} → Indica que buscamos al menos 9 ocurrencias de una vocal.
    SELECT titulo FROM Libros WHERE titulo REGEXP '(.*[AEIOUaeiou].*){9,}';
    ```
28. Obtener todos los autores cuyo nombre inicia con una consonante:

    ```sql
    -- ^             → Inicio de la cadena.
    -- [AEIOUaeiou]  → Indica que buscamos que haya al menos una vocal, ya sea mayúscula o minúscula.
    -- ^[AEIOUaeiou] → Indica que buscamos que haya al menos una vocal, ya sea mayúscula o minúscula, al comienzo de la cadena.
    SELECT nombre FROM Autores WHERE nombre NOT REGEXP '^[AEIOUaeiou]';
    ```
29. Seleccionar los libros cuyo título no contiene la palabra "The":

    ```sql
    -- The → Indica que buscamos literalmente "The". (No se necesita ^ o $ porque no importa la posición, solo que exista.)
    SELECT titulo FROM Libros WHERE titulo NOT REGEXP 'The';
    ```
30. Obtener todos los autores cuyo nombre tiene al menos una letra repetida consecutivamente:

    ```sql
    -- (.) → Captura cualquier carácter y lo guarda en un grupo.
    -- \\1 → Hace referencia al primer grupo capturado (es decir, repite el mismo carácter inmediatamente después).
    SELECT nombre FROM Autores WHERE nombre REGEXP '(.)\\1';
    ```
31. Obtener todos los autores cuyo nombre empieza con "J" o termina con "n":

    ```sql
    -- ^J → el nombre empieza con la letra J
    -- n$ → el nombre termina con la letra n
    -- El operador | indica una alternativa lógica (OR) entre las dos condiciones.
    SELECT nombre FROM Autores WHERE nombre REGEXP '^J|n$';
    ```
32. Obtener todos los autores cuyo nombre no contiene caracteres especiales:

    ```sql
    -- El símbolo ^ dentro de los corchetes [^...] significa "cualquier cosa que no sea" las letras o el espacio. Así, cualquier nombre que contenga caracteres no permitidos (como puntos, comas, números, etc.) será excluido.
    SELECT nombre FROM Autores WHERE nombre NOT REGEXP '[^a-zA-Z ]';
    ```
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Autores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT
);
INSERT INTO Autores VALUES(1,'J.K. Rowling');
INSERT INTO Autores VALUES(2,'Stephen King');
INSERT INTO Autores VALUES(3,'George Orwell');
INSERT INTO Autores VALUES(4,'Jane Austen');
INSERT INTO Autores VALUES(5,'Agatha Christie');
CREATE TABLE Libros (
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    autor_id INTEGER,
    editorial TEXT,
    precio REAL,
    FOREIGN KEY (autor_id) REFERENCES Autores(id)
);
INSERT INTO Libros VALUES(1,'The Great Gatsby',6,'Charles Scribner''s Sons',20.98999999999999843);
INSERT INTO Libros VALUES(2,'To Kill a Mockingbird',7,'J.B. Lippincott & Co.',15.94999999999999929);
INSERT INTO Libros VALUES(3,'The Catcher in the Rye',8,'Little, Brown and Company',18.75);
INSERT INTO Libros VALUES(4,'One Hundred Years of Solitude',9,'Harper & Row',22.5);
INSERT INTO Libros VALUES(5,'Brave New World',3,'Chatto & Windus',17.98999999999999843);
INSERT INTO Libros VALUES(6,'The Hobbit',10,'George Allen & Unwin',24.98999999999999844);
INSERT INTO Libros VALUES(7,'The Lord of the Rings',10,'George Allen & Unwin',35.5);
INSERT INTO Libros VALUES(8,'The Chronicles of Narnia',11,'Geoffrey Bles',28.98999999999999844);
INSERT INTO Libros VALUES(9,'The Odyssey',12,'Homer',14.94999999999999929);
INSERT INTO Libros VALUES(10,'The Iliad',12,'Homer',14.94999999999999929);
INSERT INTO Libros VALUES(11,'Moby-Dick',13,'Harper & Brothers',19.98999999999999843);
INSERT INTO Libros VALUES(12,'The Road',14,'Alfred A. Knopf',16.75);
INSERT INTO Libros VALUES(13,'The Grapes of Wrath',15,'The Viking Press',21.5);
INSERT INTO Libros VALUES(14,'Wuthering Heights',16,'Emily Brontë',12.99000000000000021);
INSERT INTO Libros VALUES(15,'The Old Man and the Sea',17,'Charles Scribner''s Sons',18.94999999999999929);
INSERT INTO Libros VALUES(16,'The Count of Monte Cristo',18,'Pétion',27.98999999999999844);
INSERT INTO Libros VALUES(17,'The Picture of Dorian Gray',19,'Ward, Lock, and Company',14.5);
INSERT INTO Libros VALUES(18,'The Adventures of Sherlock Holmes',20,'George Newnes',16.98999999999999843);
INSERT INTO Libros VALUES(19,'Frankenstein',21,'Lackington, Hughes, Harding, Mavor, & Jones',13.25);
INSERT INTO Libros VALUES(20,'Alice''s Adventures in Wonderland',22,'Macmillan',11.5);
INSERT INTO Libros VALUES(21,'The Prince',23,'Niccolò Machiavelli',10.99000000000000021);
INSERT INTO Libros VALUES(22,'Don Quixote',24,'Francisco de Robles',26.75);
INSERT INTO Libros VALUES(23,'The Divine Comedy',25,'Dante Alighieri',20.5);
INSERT INTO Libros VALUES(24,'Anna Karenina',26,'The Russian Messenger',23.98999999999999844);
INSERT INTO Libros VALUES(25,'Les Misérables',27,'A. Lacroix, Verboeckhoven & Cie.',29.75);
INSERT INTO Libros VALUES(26,'The Jungle Book',28,'Macmillan Publishers',14.99000000000000021);
INSERT INTO Libros VALUES(27,'The Wind in the Willows',29,'Methuen & Co.',17.5);
INSERT INTO Libros VALUES(28,'War and Peace',26,'The Russian Messenger',33.25);
INSERT INTO Libros VALUES(29,'Crime and Punishment',30,'The Russian Messenger',19.98999999999999843);
INSERT INTO sqlite_sequence VALUES('Autores',5);
INSERT INTO sqlite_sequence VALUES('Libros',29);
COMMIT;

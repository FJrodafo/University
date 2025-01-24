DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    fecha_nacimiento DATE,
    UNIQUE (nombre, apellidos, fecha_nacimiento)
);

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    UNIQUE (titulo)
);

CREATE TABLE autores_libros (
    autorid INT,
    libroid INT,
    PRIMARY KEY (autorid, libroid),
    FOREIGN KEY (autorid) REFERENCES autores(id),
    FOREIGN KEY (libroid) REFERENCES libros(id)
);

CREATE TABLE libros_categorias (
    libroid INT,
    categoriaid INT,
    PRIMARY KEY (libroid, categoriaid),
    FOREIGN KEY (libroid) REFERENCES libros(id),
    FOREIGN KEY (categoriaid) REFERENCES categorias(id)
);

CREATE TABLE volumenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libroid INT,
    estado VARCHAR(100),
    fechadeadquisicion DATE,
    FOREIGN KEY (libroid) REFERENCES libros(id)
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    telefono VARCHAR(20),
    UNIQUE (nombre, apellidos, telefono)
);

CREATE TABLE prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    volumenid INT,
    usuarioid INT,
    fechaprestamo DATE,
    fechadevolucion DATE,
    FOREIGN KEY (volumenid) REFERENCES volumenes(id),
    FOREIGN KEY (usuarioid) REFERENCES usuarios(id)
);

INSERT INTO autores (nombre, apellidos, fecha_nacimiento) VALUES
('Gabriel', 'García Márquez', '1927-03-06'),
('Antoine', 'de Saint-Exupéry', '1900-06-29'),
('George', 'Orwell', '1903-06-25'),
('J.K.', 'Rowling', '1965-07-31'),
('Leo', 'Tolstoy', '1828-09-09'),
('Mark', 'Twain', '1835-11-30'),
('Jane', 'Austen', '1775-12-16'),
('Franz', 'Kafka', '1883-07-03');

INSERT INTO libros (titulo) VALUES 
('Cien años de soledad'), 
('El Principito'), 
('1984'),
('Harry Potter and the Philosopher\'s Stone'),
('War and Peace'),
('The Adventures of Tom Sawyer'),
('Pride and Prejudice'),
('The Metamorphosis'),
('The Tales of Beedle the Bard'),
('Anna Karenina'),
('The Death of Ivan Ilyich'),
('El amor en tiempos del cólera'), 
('Crónica de una muerte anunciada');

INSERT INTO autores_libros (autorid, libroid) VALUES 
(1, 1), 
(2, 2), 
(3, 3),
(6, 4), 
(2, 4),
(1, 12), 
(1, 13);

INSERT INTO usuarios (nombre, apellidos, telefono) VALUES
('Juan', 'Perez', '1234567890'),
('Ana Luisa', 'Gómez', '0987654321'),
('Mario', 'Rossi', '5678901234'),
('Ana María', 'Dorta', '0123456789'),
('Ricardo', 'de Ana Zurita', '1122334455');

INSERT INTO categorias (nombre) VALUES ('Novela'), ('Ficción'), ('Clásico'), ('Biografía');
INSERT INTO libros_categorias (libroid, categoriaid) VALUES (1, 1), (2, 2), (3, 3), (1,2);

INSERT INTO volumenes (libroid, estado, fechadeadquisicion) VALUES
(1, 'disponible','2019-03-15'), 
(1, 'disponible','2018-06-10'),
(2, 'dañado','2021-07-22'),
(3, 'disponible','2019-08-19'), 
(3, 'disponible','2020-05-21'),
(4, 'disponible', '2022-03-08'), 
(5, 'disponible', '2023-07-02'), 
(6, 'dañado','2019-01-04'),
(7, 'en reparación', '2021-11-20'),
(8, 'dañado', '2018-07-09'),
(11, 'disponible', '2019-05-18'),
(12, 'disponible', '2022-08-02'),
(2, 'disponible','2021-07-22'),
(12, 'disponible', '2023-03-29');

INSERT INTO prestamos (volumenid, usuarioid, fechaprestamo, fechadevolucion) VALUES
(1, 1, '2023-05-01', '2023-05-15'),
(2, 2, '2023-05-02', '2023-05-16'),
(5, 1, '2023-06-13', '2023-09-17'),
(1, 3, '2024-01-20', null),
(2, 2, '2024-02-25', null),
(3, 1, '2024-03-28', null),
(4, 3, '2024-04-01', null),
(5, 1, '2024-05-09', null),
(6, 3, '2024-05-21', '2024-05-30'),
(7, 2, '2023-09-21', '2023-09-25'),
(4, 1, '2023-11-03', '2024-01-13'),
(9, 3, '2023-12-04', '2024-02-14'),
(10, 2, '2024-05-01', '2024-05-12'),
(13, 1, '2023-05-11', '2023-07-18');

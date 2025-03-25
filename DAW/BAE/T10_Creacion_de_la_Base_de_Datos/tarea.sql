-- Crear tabla "Propietarios"
CREATE TABLE Propietarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    dni TEXT UNIQUE NOT NULL
);

-- Crear tabla "Vehiculos"
CREATE TABLE Vehiculos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    marca TEXT NOT NULL,
    modelo TEXT NOT NULL,
    anio INTEGER NOT NULL,
    id_propietario INTEGER,
    FOREIGN KEY (id_propietario) REFERENCES Propietarios(id)
);

-- Insertar datos en la tabla "Propietarios"
INSERT INTO Propietarios (nombre, apellido, dni)
VALUES
('Juan', 'Perez', '12345678A'),
('Maria', 'Lopez', '87654321B'),
('Carlos', 'Ruiz', '11111111C'),
('Laura', 'Gomez', '22222222D'),
('Pedro', 'Martinez', '33333333E'),
('Ana', 'Fernandez', '44444444F'),
('Diego', 'Sanchez', '55555555G'),
('Sofia', 'Torres', '66666666H'),
('Javier', 'Leon', '77777777I'),
('Lucia', 'Castillo', '88888888J'),
('Luis', 'Gonzalez', '99999999K'),
('Marta', 'Diaz', '10101010L'),
('Victor', 'Vargas', '11111112M'),
('Elena', 'Castro', '12121212N'),
('Roberto', 'Blanco', '13131313O'),
('Natalia', 'Paredes', '14141414P'),
('Fernando', 'Herrera', '15151515Q'),
('Clara', 'Soto', '16161616R'),
('Sergio', 'Mendoza', '17171717S'),
('Patricia', 'Navarro', '18181818T');

-- Insertar datos en la tabla "Vehiculos"
INSERT INTO Vehiculos (marca, modelo, anio, id_propietario)
VALUES
('Ford', 'Fiesta', 2019, 1),
('Toyota', 'Corolla', 2018, 2),
('Nissan', 'Sentra', 2020, 3),
('Chevrolet', 'Spark', 2017, 4),
('Honda', 'Civic', 2016, 5),
('Ford', 'Mustang', 2021, 6),
('Toyota', 'RAV4', 2019, 7),
('Volkswagen', 'Golf', 2020, 8),
('Honda', 'CR-V', 2018, 9),
('Nissan', 'Altima', 2017, 10),
('Chevrolet', 'Malibu', 2019, 11),
('Toyota', 'Camry', 2020, 12),
('Honda', 'Accord', 2018, 13),
('Ford', 'Explorer', 2021, 14),
('Nissan', 'Rogue', 2017, 15),
('Volkswagen', 'Jetta', 2019, 16),
('Chevrolet', 'Equinox', 2018, 17),
('Toyota', 'Highlander', 2020, 18),
('Honda', 'Odyssey', 2016, 19),
('Nissan', 'Murano', 2019, 20);

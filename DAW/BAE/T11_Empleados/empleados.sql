-- Crear tabla "Empleados"
CREATE TABLE Empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    salario REAL NOT NULL,
    departamento TEXT NOT NULL
);

-- Insertar datos en la tabla "Empleados"
INSERT INTO Empleados (nombre, salario, departamento) VALUES
    ('Juan', 50000, 'Ventas'),
    ('María', 60000, 'TI'),
    ('Carlos', 55000, 'Ventas'),
    ('Ana', 48000, 'Recursos Humanos'),
    ('Pedro', 70000, 'TI'),
    ('Laura', 52000, 'Ventas'),
    ('Javier', 48000, 'Recursos Humanos'),
    ('Carmen', 65000, 'TI'),
    ('Miguel', 51000, 'Ventas'),
    ('Elena', 55000, 'Recursos Humanos'),
    ('Diego', 72000, 'TI'),
    ('Sofía', 49000, 'Ventas'),
    ('Andrés', 60000, 'Recursos Humanos'),
    ('Isabel', 53000, 'TI'),
    ('Raúl', 68000, 'Ventas'),
    ('Patricia', 47000, 'Recursos Humanos'),
    ('Alejandro', 71000, 'TI'),
    ('Natalia', 54000, 'Ventas'),
    ('Roberto', 49000, 'Recursos Humanos'),
    ('Beatriz', 63000, 'TI');

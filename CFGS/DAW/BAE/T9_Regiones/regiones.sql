-- Crear la base de datos
CREATE DATABASE regiones;

-- Utilizar la base de datos recién creada
USE regiones;

-- Crear la tabla paises
CREATE TABLE paises (
    nombre VARCHAR(255) PRIMARY KEY
);

-- Crear la tabla provincias
CREATE TABLE provincias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) UNIQUE,
    pais_nombre VARCHAR(255),
    CONSTRAINT fk_paises_provincias FOREIGN KEY (pais_nombre) REFERENCES paises(nombre)
);

-- Crear la tabla municipios
CREATE TABLE municipios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    provincia_id INT,
    CONSTRAINT fk_municipios_provincias FOREIGN KEY (provincia_id) REFERENCES provincias(id),
    CONSTRAINT unique_nombre_provincia_id UNIQUE (nombre, provincia_id)
);

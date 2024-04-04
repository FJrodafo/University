CREATE DATABASE regiones;

USE regiones;

CREATE TABLE paises (
    nombre VARCHAR(255) PRIMARY KEY
);

CREATE TABLE provincias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) UNIQUE,
    pais_nombre VARCHAR(255),
    CONSTRAINT fk_paises_provincias FOREIGN KEY (pais_nombre) REFERENCES paises(nombre)
);

CREATE TABLE municipios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    provincia_id INT,
    CONSTRAINT fk_municipios_provincias FOREIGN KEY (provincia_id) REFERENCES provincias(id),
    CONSTRAINT unique_nombre_provincia_id UNIQUE (nombre, provincia_id)
);

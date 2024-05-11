DROP DATABASE IF EXISTS regiones;
CREATE DATABASE regiones;
USE regiones;

CREATE TABLE paises (
    nombre VARCHAR(255),
    CONSTRAINT pk_paises PRIMARY KEY (nombre)
);

CREATE TABLE provincias (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(255),
    pais_nombre VARCHAR(255),
    CONSTRAINT uq_provincias UNIQUE KEY (nombre),
    CONSTRAINT pk_provincias PRIMARY KEY (id),
    CONSTRAINT fk_paises_provincias FOREIGN KEY (pais_nombre) REFERENCES paises(nombre)
);

CREATE TABLE municipios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    provincia_id INT,
    CONSTRAINT uq_municipios UNIQUE KEY (nombre, provincia_id),
    CONSTRAINT pk_municipios PRIMARY KEY (id),
    CONSTRAINT fk_municipios_provincias FOREIGN KEY (provincia_id) REFERENCES provincias(id)
);

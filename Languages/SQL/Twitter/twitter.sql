DROP DATABASE IF EXISTS twitter;
CREATE DATABASE twitter;

USE twitter;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,
    user_handle VARCHAR(20) NOT NULL UNIQUE,
    email_address VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phonenumber CHAR(15) UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    PRIMARY KEY(user_id)
);

INSERT INTO users(user_handle, email_address, first_name, last_name, phonenumber)
VALUES
('FJrodafo', 'FJrodafo@gmail.com', 'Francisco José', 'Rodríguez Afonso', '123456789'),
('Mgarmes', 'Mgarmes@gmail.com', 'Marta', 'García Mesa', '234567890'),
('Kroddor', 'Kroddor@gmail.com', 'Kevin', 'Rodríguez Dorta', '345678901'),
('Cfloher', 'Cfloher@gmail.com', 'Chloe', 'Florencia Herrera', '456789012');

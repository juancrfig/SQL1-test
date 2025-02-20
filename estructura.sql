-- Creacion de la base de datos

DROP DATABASE IF EXISTS pizza_fiesta;
CREATE DATABASE pizza_fiesta CHARACTER SET utf8mb4;

USE pizza_fiesta;


-- Creacion de tabla "cliente"

CREATE TABLE cliente (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	telefono INTEGER NOT NULL UNIQUE,
	direccion VARCHAR(100) NOT NULL UNIQUE
);

-- Creación de tabla "pizza"

CREATE TABLE pizza (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL UNIQUE,
	precio FLOAT NOT NULL CHECK( precio > 0),
	size ENUM('pequeña', 'mediana', 'grande') NOT NULL,
	ingredientes VARCHAR(1000)
);

-- Creación de tabla "ingrediente"

CREATE TABLE ingrediente (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL UNIQUE,
);

-- Creacion de tabla producto 

CREATE TABLE producto ( 
        id INTEGER PRIMARY KEY AUTO_INCREMENT, 
);







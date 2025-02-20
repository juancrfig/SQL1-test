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
	precio FLOAT NOT NULL CHECK( precio > 0 ),
	size ENUM('pequeña', 'mediana', 'grande') NOT NULL,
	ingrediente1 INTEGER NOT NULL DEFAULT 1 UNIQUE,
	ingrediente2 INTEGER NOT NULL DEFAULT 2 UNIQUE,
	ingrediente3 INTEGER NOT NULL UNIQUE,
	ingrediente4 INTEGER UNIQUE,
	FOREIGN KEY (ingrediente1) REFERENCES ingrediente(id),
	FOREIGN KEY (ingrediente2) REFERENCES ingrediente(id),
	FOREIGN KEY (ingrediente3) REFERENCES ingrediente(id),
	FOREIGN KEY (ingrediente4) REFERENCES ingrediente(id)
);

-- Creación de tabla "ingrediente"

CREATE TABLE ingrediente (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL UNIQUE
);

-- Creación de tabla "bebida"

CREATE TABLE bebida (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL UNIQUE,
	precio FLOAT NOT NULL CHECK ( precio > 0 ),
	size ENUM('personal', 'grande') DEFAULT 'personal' NOT NULL
);


-- Creación de tabla "combo"

CREATE TABLE combo (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL UNIQUE,
	precio FLOAT NOT NULL CHECK( precio > 0),
	id_pizza INTEGER,
	id_bebida INTEGER,
	FOREIGN KEY (id_pizza) REFERENCES pizza(id),
	FOREIGN KEY (id_bebida) REFERENCES bebida(id)
);

-- Creación de tabla "pedido"

CREATE TABLE pedido (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	id_cliente INTEGER,
	hora_recogida DATETIME,
	FOREIGN KEY (id_cliente) REFERENCES cliente(id),
	pizza_id INTEGER,
	FOREIGN KEY (pizza_id) REFERENCES pizza(id),
	bebida_id INTEGER,
	FOREIGN KEY (bebida_id) REFERENCES bebida(id),
	combo_id INTEGER,
	FOREIGN KEY (combo_id) REFERENCES combo(id) 
);






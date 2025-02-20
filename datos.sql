-- CONSULTAS


-- Consulta 1: Registrar un nuevo cliente.
INSERT INTO cliente (nombre, telefono direccion) VALUES
('Juanes Figueroa', 123456789, 'Avenida Independencia');


-- Consulta 2: Agregar un nuevo producto (pizza) al menú.
INSERT INTO pizza (nombre, precio, size, ingrediente1, ingrediente2, ingrediente3, ingrediente4) 
VALUES ('Pizza de Champiñones', 15, 'mediana', 1, 2, 3, 5);


-- Consulta 3: Registrar una bebida en el menú.
INSERT INTO bebida (nombre, precio, size) VALUES
('Coca Cola', 1.5, 'personal');


-- Consulta 4: Agregar un ingrediente a la base de datos.
INSERT INTO ingrediente (nombre) VALUES
('queso muzarella'),
('salsa napolitana'),
('champiñones'),
('peperonni'),
('pollo'),
('carne');


-- Consulta 5: Crear un pedido para un cliente
INSERT INTO pedido (id_cliente, hora_recogida, pizza_id, bebida_id) VALUES
(2, '2025-06-19 21:00:00', 1, 1);

-- Consulta 6: Añadir productos a un pedido en específico
-- Vamos a añadir un combo al pedido que creamos anteriormente

-- Aquí añadimos el combo que vamos a agregar al pedido
INSERT INTO combo (nombre, precio, id_pizza, id_bebida) VALUES ('Combo 1', 20, 1, 1);

-- Añadimos el combo al pedido creado en la consulta 5, vamos a usar el id de cliente 2
-- como punto de referencia
UPDATE pedido SET combo_id = 1 WHERE id_cliente = 2;


-- Consulta 7: Añadir ingredientes adicionales a una pizza en un pedido.
UPDATE pizza SET ingrediente3 = 6 WHERE id = (SELECT pizza_id FROM pedido WHERE id = 1);


-- Consulta 8: Consultar el detalle de un pedido (productos y sus ingredientes)
SELECT id AS id_pedido, 
	(SELECT nombre FROM pizza WHERE id = pedido.pizza_id ) AS pizza, 
	(SELECT nombre FROM bebida WHERE id = pedido.bebida_id) AS bebida, 
 	(SELECT nombre FROM combo WHERE id = pedido.combo_id) AS combo 
FROM pedido;


-- Consulta 9: Actualizar el precio de una pizza en el menú.
UPDATE pizza SET precio = 150 WHERE id = 1;


-- Consulta 10: Actualizar la dirección de un cliente.
UPDATE cliente SET direccion = 'Avenida Córdoba 1628' WHERE id = 2;


-- Consulta 11: Eliminar un producto del menú (bebida).
-- Vamos a insertar primero la bebida que vamos a borrar a continuación
INSERT INTO bebida (nombre, precio, size) VALUES ('Pepsi', 1.5, 'personal');

DELETE FROM bebida WHERE nombre = 'Pepsi';


-- Consulta 12: Eliminar un ingrediente de la base de datos.
-- Vamos a insertar primero el ingrediente que vamos a borrar a continuación
INSERT INTO ingrediente (nombre) VALUES ('salchicha');

DELETE FROM ingrediente WHERE nombre = 'salchicha';


-- Consulta 13: Consultar todos los pedidos de un cliente.
SELECT * FROM pedido WHERE id_cliente = 2;


-- Consulta 14: Listar todos los productos disponibles en el menú (pizzas y bebidas)
SELECT * FROM pizza;
SELECT * FROM bebida;


-- Consulta 15: Listar todos los ingredientes disponibles para personalizar una pizza.
SELECT * FROM ingrediente;

CREATE DATABASE pedidos;
GO

USE pedidos;
GO

CREATE TABLE cliente(
	cliente_id INT NOT NULL
	CONSTRAINT pk_cliente
	PRIMARY KEY (cliente_id),
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR(20) NOT NULL,
	apellido_materno VARCHAR(20) NULL
);
GO

CREATE TABLE pedido(
	numero_pedido INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_pedido
	PRIMARY KEY(numero_pedido),
	fecha_pedido DATE NOT NULL,
	cliente_id INT NOT NULL --Foreign Key
	CONSTRAINT fk_pedido_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente(cliente_id)
);

CREATE TABLE detalles_pedido(
	precio FLOAT NOT NULL,
	numero_pedido INT NOT NULL,
	CONSTRAINT fk_detalles_pedido_pedido
	FOREIGN KEY (numero_pedido)
	REFERENCES pedido (numero_pedido)
);
GO


CREATE TABLE proyecto(
	numero_producto INT NOT NULL
	CONSTRAINT pk_proyecto
	PRIMARY KEY(numero_producto),
	nombre_producto VARCHAR(20) NOT NULL,
	precio_producto VARCHAR(20) NOT NULL
);
GO

ALTER TABLE detalles_pedido
ADD numero_producto INT NOT NULL
CONSTRAINT fk_detalles_pedido_proyecto
FOREIGN KEY (numero_producto)
REFERENCES proyecto (numero_producto),
CONSTRAINT pk_detalles_pedido
PRIMARY KEY (numero_pedido, numero_producto)
GO
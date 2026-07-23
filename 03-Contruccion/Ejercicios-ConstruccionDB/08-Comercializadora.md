## Ejercicio 08-Comercializacion

```
CREATE DATABASE comercializadora;


USE comercializadora;
GO


-- TABLA PRODUCTO

CREATE TABLE producto (
	producto_id CHAR (5) NOT NULL,
	fabricante_id CHAR (3) NOT NULL,
	descripcion VARCHAR (40) NOT NULL,
	precio DECIMAL (10,2) NOT NULL,
	existencia INT NOT NULL,
	CONSTRAINT pk_producto
	PRIMARY KEY (producto_id, fabricante_id),
	CONSTRAINT uq_producto_descripcion
	UNIQUE (descripcion),
	CONSTRAINT ck_producto_precio
	CHECK (precio>0.0),
	CONSTRAINT ck_producto_exixtencia
	CHECK (existencia BETWEEN 1 AND 100)
);
GO

/*==========================CREAR TABLA REPRESENTANTE=============================*/

CREATE TABLE representante(
	representante_id INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_representante
	PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR(15) NOT NULL,
	apellido_materno VARCHAR(15) NULL,
	fecha_contrato DATE NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	puesto VARCHAR(15) NOT NULL,
	cuota DECIMAL(10,2) NOT NULL
	CONSTRAINT ck_representante_cuota
	CHECK(cuota>0.0),
	venta DECIMAL(10,2)
	CONSTRAINT ck_representante_venta
	CHECK(venta>0.0),
	representante_id_jefe INT -- Foreign key recursiva o jerarquica
	CONSTRAINT fk_representante_representante
	FOREIGN KEY (representante_id_jefe)
	REFERENCES representante(representante_id),
	oficina_id INT NOT NULL, -- Foreign key de oficina
	created_at DATETIME2 NOT NULL
	CONSTRAINT df_representante_created_at
	DEFAULT SYSDATETIME(),
	update_at DATETIME2 NOT NULL
	CONSTRAINT df_representante_update_at
	DEFAULT SYSDATETIME()
 );
 GO


 /*==========================CREAR TABLA OFICINA=============================*/

  CREATE TABLE oficina(
	oficina_id INT NOT NULL,
	cuidad VARCHAR(30) NOT NULL,
	region VARCHAR(20) NOT NULL,
	objetivo DECIMAL(10,2) NOT NULL,
	venta DECIMAL(10,2) NOT NULL,
	create_at DATETIME2 NOT NULL,
	CONSTRAINT df_oficina_created_at
	DEFAULT SYSDATETIME(),
	updated_at DATETIME2 NOT NULL,
	CONSTRAINT df_oficina_update_at
	DEFAULT SYSDATETIME(),
	representante_id INT NOT NULL,-- Foreign Key de representantes
	CONSTRAINT pk_oficina
	PRIMARY KEY (oficina_id),
	CONSTRAINT uq_oficina_cuidad
	UNIQUE (cuidad),
	CONSTRAINT ck_oficina_region
	CHECK(region IN ('Este','Oeste')),
	CONSTRAINT ck_oficina_objetivo
	CHECK (objetivo>0.0),
	CONSTRAINT ck_oficina_venta
	CHECK(venta>0.0),
	CONSTRAINT fk_oficina_representante
	FOREIGN KEY (representante_id)
	REFERENCES representante(representante_id)
  );
  GO

   /*==========================AGREGAR LOS CAMPOS DE AUDITORIA A PRDUCTOS=============================*/

   ALTER TABLE producto
   ADD created_at DATETIME2 NOT NULL,
   updated_at DATETIME2 NOT NULL;
   GO

  ALTER TABLE producto
   ADD CONSTRAINT df_producto_created_at
   DEFAULT SYSDATETIME() FOR created_at;
   GO

   ALTER TABLE producto
   ADD CONSTRAINT df_producto_update_at
   DEFAULT SYSDATETIME() FOR update_at;
   GO

   /*==========================AGREGAR LA FOREIGN KEY A REPRESENTANTE DE OFICINA =============================*/

   ALTER TABLE representante
   ADD CONSTRAINT fk_representante_oficina
   FOREIGN KEY (oficina_id)
   REFERENCES oficina(oficina_id);
   GO

   /*==========================CREAR TABLA CLIENTE=============================*/

   CREATE TABLE cliente (
		cliente_id INT NOT NULL IDENTITY
		CONSTRAINT pk_cliente
		PRIMARY KEY,
		empresa VARCHAR(30) NOT NULL
		CONSTRAINT uq_cliente_empresa
		UNIQUE,
		limite_credito DECIMAL(10,2) NOT NULL
		CONSTRAINT ck_cliente_limite_credito
		CHECK(limite_credito BETWEEN 1000 AND 10000),
		created_at DATETIME2 NOT NULL
		CONSTRAINT df_cliente_created_at
		DEFAULT SYSDATETIME(),
		update_at DATETIME2 NOT NULL
		CONSTRAINT df_cliente_update_at
		DEFAULT SYSDATETIME(),
		representante_id INT NOT NULL -- FOREIGN KEY DE REPRESENTANTE
		CONSTRAINT fk_cliente_representante
		FOREIGN KEY(representante_id)
		REFERENCES representante(representante_id)
   );
   GO
    /*==========================CREAR TABLA PEDIDO=============================*/

	CREATE TABLE pedido(
		pedido_id INT NOT NULL IDENTITY(1,1)
		CONSTRAINT pk_pedido
		PRIMARY KEY,
		fecha_pedido DATE NOT NULL
		CONSTRAINT df_pedido_fecha_pedido
		DEFAULT GETDATE(),
		created_at DATETIME2 NOT NULL
		CONSTRAINT df_predido_created_at
		DEFAULT SYSDATETIME(),
		update_at DATETIME2 NOT NULL
		CONSTRAINT df_pedido_update_at
		DEFAULT SYSDATETIME(),
		cliente_id INT NOT NULL
		CONSTRAINT fk_pedido_cliente
		FOREIGN KEY (cliente_id)
		REFERENCES cliente(cliente_id),
		representante_id INT NOT NULL
		CONSTRAINT fk_pedido_representante
		FOREIGN KEY (representante_id)
		REFERENCES representante(representante_id)
	);
	GO

	 /*==========================CREAR TABLA DATELLE PEIDO=============================*/
CREATE TABLE detalle_pedido(
	pedido_id INT NOT NULL,
	producto_id CHAR(5) NOT NULL,
	fabricante_id CHAR(3) NOT NULL,
	cantidad INT NOT NULL,
	CONSTRAINT ck_detalle_pedido_cantidad
	CHECK(cantidad>0.0),
	precio_venta DECIMAL(10,2) NOT NULL,
	CONSTRAINT ck_detalle_pedido_precio_venta
	CHECK(precio_venta > 0.0),
	created_at  DATETIME2 NOT NULL
	CONSTRAINT df_detalle_pedido_created_at
	DEFAULT SYSDATETIME(),
	update_at DATETIME2 NOT NULL
	CONSTRAINT df_detalle_pedido_update_at
	DEFAULT SYSDATETIME(),
	CONSTRAINT pk_detalle_venta
	PRIMARY KEY (pedido_id,producto_id,fabricante_id),
	CONSTRAINT fk_detalle_pedido_pedido
	FOREIGN KEY (pedido_id)
	REFERENCES pedido(pedido_id),
	CONSTRAINT fk_detalle_pedido_producto
	FOREIGN KEY (producto_id, fabricante_id)
	REFERENCES producto(producto_id,fabricante_id)
);
GO

```
## Diagrama  

![Diagrama 8](/img/Construccion/08-Comercializacion.png)
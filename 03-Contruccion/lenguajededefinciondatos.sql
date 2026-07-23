-- Construccion de base de datos con SQL-LDD (Create,Alter,Drop)

-- Crear una base de datos

CREATE DATABASE universidad;
GO

-- Usar la base de datos
Use universidad;
GO

-- Crear una tabla

CREATE TABLE alumno (
	alumno_id INT, 
	nombre VARCHAR(50),
	apellido_paterno VARCHAR(25),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(50)
);
GO

INSERT INTO alumno
VALUES(1,'Arcadia','Vaca','Del Corral','1986-04-07','correo@correo.com');


INSERT INTO alumno
VALUES(1,'Kevin','Cabeza','De Borrego','1942-05-10','correo@correo.com');

SELECT*
FROM alumno;

-- Restricciones 
/*	
	Las restricciones son reglas que garantizan la integridad de los datos

	Las mas utilizadas son:

	- PRIMARY KEY
	- FOREIGN KEY
	- NOT NULL
	- UNIQUE
	- CHECK
	- DEFAULT
*/

DROP TABLE alumno;
GO

-- PRIMARY KEY

CREATE TABLE alumno(
	alumno_id INT PRIMARY KEY,
	nombre VARCHAR(100),
	correo VARCHAR(100),
);
GO

INSERT INTO alumno
VALUES(1,'Luis','correo@luis.com');

INSERT INTO alumno
VALUES(2,'Roberta','correo@luis.com');

DROP TABLE alumno;
GO

CREATE TABLE alumno(
	alumno_id INT NOT NULL,
	nombre VARCHAR(100),
	correo VARCHAR(100),
	CONSTRAINT pk_alumno
	PRIMARY KEY (alumno_id)
);
GO


INSERT INTO alumno
VALUES(1,'Luis','correo@luis.com');

INSERT INTO alumno
VALUES(1,'Roberta','correo@luis.com');

DROP TABLE alumno;
GO

-- PRIMARY KEY CON IDENTITY

CREATE TABLE alumno(
	alumno_id INT IDENTITY(1,1) PRIMARY KEY,
	nombre VARCHAR(100),
	correo VARCHAR(100),
);
GO

INSERT INTO alumno
VALUES('Luis','correo@luis.com');

INSERT INTO alumno
VALUES('Roberta','correo@luis.com');

SELECT*
FROM alumno;

DROP TABLE alumno;

CREATE TABLE alumno(
	alumno_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(100),
	correo VARCHAR(50),
	CONSTRAINT pk_alumno
	PRIMARY KEY (alumno_id)
);
GO

-- NOT NULL

CREATE TABLE profesor(
	profesor_id INT NOT NULL IDENTITY(1,1),
	numero_nomina VARCHAR(20) NOT NULL,
	nombre VARCHAR(15) NOT NULL,
	apellido_materno VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR(20) NULL,
	fecha_ingreso DATE, 
	CONSTRAINT pk_profesor
	PRIMARY KEY (profesor_id)
);
GO

INSERT INTO profesor
VALUES('56565626','Luis','Hernandez',NULL,'2027-05-07');

SELECT *
FROM profesor;

INSERT INTO profesor (numero_nomina, nombre, apellido_materno)
VALUES ('4544655','Ricarda','Sonrics')

-- RESTRICCION UNIQUE

CREATE TABLE categoria(
	categoria_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL UNIQUE,
	activo BIT NOT NULL
);
GO

INSERT INTO categoria
VALUES(UPPER('carnes frias'),1);

INSERT INTO categoria
VALUES(UPPER('carnes frias'),1);

DROP TABLE categoria
GO

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_categoria
	PRIMARY KEY(categoria_id)
	nombre VARCHAR(20) NOT NULL,
	CONSTRAINT uq_categoria_nombre
	UNIQUE, 
	activo BIT NOT NULL
);
GO

DROP TABLE categoria;
GO

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL, 
	activo BIT NOT NULL
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id)
	CONSTRAINT uq_categoria_nombre
	UNIQUE(nombre)
);
GO

-- RESTRICCION DEFAULT

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL, 
	activo BIT NOT NULL DEFAULT 1,
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id),
	CONSTRAINT uq_categoria_nombre
	UNIQUE(nombre)
);
GO

INSERT INTO categoria(nombre,activo)
VALUES('Carnes Frias',DEFAULT);

INSERT INTO categoria(nombre)
VALUES('Carnes Frias')

SELECT*
FROM categoria

--TODO: CREAR LAS TABLAS DE LAS OTRAS 2 FORMAS 
--TODO: CHECK 

create database empresa_patito;
go

use empresa_patito;
go 

--- primera froma de contruccion (no utilizar en el futuro)
create table producto (
	producto_id int identity (1,1) primary key,
	nombre varchar (20) not null unique,
	descripcion varchar (80),
	precio decimal (10,2) not null check (precio>0.0),
	existencia int not null check (existencia>0 and existencia<=100),
	activo bit not null default 1,
	tipo char (1) not null check (tipo = 'r' or tipo = 'p')
);
go 

drop table producto 

--- segunda forma de construccion (restriccion por columna)

create table producto (
	producto_id int identity (1,1)
	constraint pk_producto
	primary key,
	nombre varchar (20) not null 
	constraint uq_producto_nombre
	unique,
	descripcion varchar (80),
	precio decimal (10,2) not null 
	constraint ck_producto_precio
	check (precio>0.0),
	existencia int not null
	constraint ck_producto_existencia
	check (existencia between 1 and 100),
	activo bit not null 
	constraint df_producto_activo
	default 1,
	tipo char (1) not null 
	constraint ck_producto_tipo
	check (tipo in ('r', 'p'))
);
go

drop table producto

---  tercer forma de creacion  (definicion al final)

create table producto (
	producto_id int identity (1,1),
	nombre varchar (20) not null,
	descripcion varchar (80),
	precio decimal (10,2) not null ,
	existencia int not null,
	activo bit not null 
	constraint df_producto_activo
	default 1,
	tipo char (1) not null 
	constraint pk_producto
	primary key (producto_id),
	constraint uq_producto_nombre
	unique (nombre),
	constraint ck_producto_precio
	check (precio>0.0),
	constraint ck_producto_existencia
	check (existencia between 1 and 100),
	constraint ck_producto_tipo
	check (tipo in ('r', 'p'))
);
go

insert into producto 
values ('pit' , 'corriente', 12.50,99,default ,'p');

insert into producto 
values ('pit' , 'corriente', 12.50,99,default ,'r');

insert into producto (nombre , precio,existencia, tipo)
values ('pit' , 'corriente', 12.50,99 ,'p');


select *
from producto;

---- restriccion foreing key (integridad referencial)

create table provedor (
	provedor_id int not null identity (1,1),
	empresa varchar (20) not null ,
	limite_credito numeric (10,2) not null,
	activo bit not null
	constraint df_provedor_activo
	default 1,
	created_at datetime2 not null
	constraint df_provedor_created_at
	default sysdatetime (),
	update_at datetime2 not null
	constraint df_provedor_update_at
	default sysdatetime (),
	constraint pk_provedor
	primary key (provedor_id),
	constraint uq_provedor_empresa
	unique (empresa),
	constraint ck_provedor_limite_credito
	check (limite_credito between 100 and 10000)
);
go

create table contacto_provedor(
	contacto_id int identity (1,1)
	constraint pk_contacto_provedor
	primary key,
	nombre varchar (30) not null,
	apellido_paterno varchar (15) not null,
	apellido_materno varchar (15) null ,
	telefono varchar (18) not null,
	provedor_id int not null ,
	constraint fk_contacto_provedor_provedor
	foreign key (provedor_id)
	references provedor (provedor_id)
);
go

INSERT INTO proveedor (empresa, limite_credito)
VALUES ('Coca-cola',7800),
	   ('Pecsi',7485),
	   ('Bimbo',10000);

INSERT INTO contacto_provedor(nombre,apellido_paterno,apellido materno, telefono provedor_id)
VALUES('Karen','Cabeza', 'Grande','1458666',1);

INSERT INTO contacto_provedor(nombre,apellido_paterno,apellido materno, telefono provedor_id)
VALUES('Arcadia','Puerco','Rosa','4545');

TRUNCATE TABLE contacto_provedor; --Elimina todos los registros de la tabla y reinicia los IDENTITY y que no tenga referencias

DROP TABLE contacto_provedor;
DROP TABLE provedor;

-- ON DELETE y ON ACTION

CREATE TABLE provedor (
	provedor_id int not null,
	empresa varchar (20) not null ,
	limite_credito numeric (10,2) not null,
	activo bit not null
	constraint df_provedor_activo
	default 1,
	created_at datetime2 not null
	constraint df_provedor_created_at
	default sysdatetime (),
	update_at datetime2 not null
	constraint df_provedor_update_at
	default sysdatetime (),
	constraint pk_provedor
	primary key (provedor_id),
	constraint uq_provedor_empresa
	unique (empresa),
	constraint ck_provedor_limite_credito
	check (limite_credito between 100 and 10000)
);
go


create table contacto_provedor(
	contacto_id int identity (1,1)
	constraint pk_contacto_provedor
	primary key,
	nombre varchar (30) not null,
	apellido_paterno varchar (15) not null,
	apellido_materno varchar (15) null ,
	telefono varchar (18) not null,
	provedor_id int,
	constraint fk_contacto_provedor_provedor
	foreign key (provedor_id)
	references provedor (provedor_id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);
go

INSERT INTO proveedor (empresa, limite_credito)
VALUES ('Coca-cola',7800),
	   ('Pecsi',7485),
	   ('Bimbo',10000);

SELECT*
FROM provedor;

INSERT INTO contacto_provedor(nombre,apellido_paterno,apellido materno, telefono provedor_id)
VALUES('Karen','Cabeza', 'Grande','1458666',1);

INSERT INTO contacto_provedor(nombre,apellido_paterno,apellido materno, telefono provedor_id)
VALUES('Arcadia','Puerco','Rosa','4545');

SELECT*
FROM contacto_provedor;

-- Eliminar el padre con no action

DELETE FROM contacto_provedor
WHERE provedor_id = 1;


DELETE FROM provedor
WHERE provedor_id = 1;

-- TODO: Se debe realizar el ON UPDATE  NO ACTION Y LAS DEMAS INTEGRIDADES REFERENCIALES 




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

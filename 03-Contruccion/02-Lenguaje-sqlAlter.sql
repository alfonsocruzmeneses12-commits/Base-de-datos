CREATE DATABASE BDejemplo;
GO

USE BDejemplo;
GO 

-- ALTER TABLE

CREATE TABLE alumno(
    alumno_id INT  NOT NULL IDENTITY(1,1),
    nombre VARCHAR(20) NOT NULL,
    apellido_paterno VARCHAR(25) NOT NULL,
    apellido_materno VARCHAR(15) NULL
    );
GO

-- Agreagr columna

ALTER TABLE alumno
    ADD telefono VARCHAR(20) ;

GO


-- Agregar varias columnas

ALTER TABLE alumno
    ADD curp CHAR(18),
    rfc CHAR(15) NOT NULL ;
GO

-- Modificar un campo
ALTER TABLE alumno
ALTER COLUMN 
telefono VARCHAR(30);
GO

-- Restricciones
-- Primary Key
ALTER TABLE alumno
ADD CONSTRAINT pk_alumno
PRIMARY KEY (alumno_id);
GO

-- Foreign key
CREATE TABLE carrera(
    carrera_id INT NOT NULL,
    nombre VARCHAR(30) NOT NULL
);
GO

ALTER TABLE carrera
ADD CONSTRAINT pk_carrera
PRIMARY KEY (carrera_id);

ALTER TABLE alumno
ADD carrera_id INT NOT NULL;
GO

ALTER TABLE alumno
ADD CONSTRAINT fk_alumno_carrera
FOREIGN KEY (carrera_id)
REFERENCES carrera(carrera_id)
ON DELETE CASCADE
ON UPDATE NO ACTION;
GO 

-- CHECK 

ALTER TABLE alumno
ADD edad INT NOT NULL;

-- Restricciones Check

ALTER TABLE alumno
ADD CONSTRAINT ck_alumno_edad
CHECK(edad = 0);

ALTER TABLE alumno
ADD CONSTRAINT ck_alumno_telefono
CHECK(telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');

INSERT INTO carrera
VALUES('Tecnologias de informacion');

INSERT INTO alumno
VALUES('Monico Toribio', 'Cervantes', 'Chimbo','561-736-1280','CUMA061208HHGNRLA5','CUMA061208HE6', 1, 18);

SELECT *
FROM alumno;

DELETE FROM alumno

-- CREACION DE DEFAULT

ALTER TABLE alumno
ADD activo BIT NOT NULL
GO

ALTER TABLE alumno
ADD CONSTRAINT df_alumno_activo
DEFAULT 1
FOR activo;
GO

ALTER TABLE carrera 
ADD CONSTRAINT uq_carrera_nombre
UNIQUE (nombre);

-- Eliminar restricciones
-- Eliminar FK

ALTER TABLE alumno
DROP CONSTRAINT fk_alumno_carrera;

-- Eliminar PK

ALTER TABLE alumno
DROP CONSTRAINT pk_alumno;
GO

ALTER TABLE carrera
DROP CONSTRAINT pk_carrera;

-- Eliminar Check

ALTER TABLE alumno
DROP CONSTRAINT ck_alumno_edad;
GO

ALTER TABLE alumno
DROP CONSTRAINT ck_alumno_telefono;
GO

-- Eliminar UNIQUE

ALTER TABLE carrera
DROP CONSTRAINT uq_carrera_nombre;
GO

-- Eliminar Columna
ALTER TABLE alumno
DROP COLUMN carrera_id;
GO 

-- DROP (Elimina Objetos de la bd completos tales como (table,views, stored, produceres, trigger,bd))

DROP TABLE alumno;
DROP TABLE carrera;

-- Eliminar Base de Datos
USE master
GO

IF OBJECT_ID('dbejemplo') IS NOT NULL
BEGIN 
 DROP DATABASE BDejemplo;
END







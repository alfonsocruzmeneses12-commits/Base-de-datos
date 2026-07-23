## Ejercicio 3 Escuela
```
CREATE DATABASE escuela;
GO

USE escuela;
GO

-- ======CREACION DE TABLA PROFESOR=====


CREATE TABLE profesor(
	numero_profesor INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_profesor
	PRIMARY KEY (numero_profesor),
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR(20) NOT NULL,
	apellido_materno VARCHAR(20) NOT NULL,
);


-- ======CREACION DE TABLA CURSO======

CREATE TABLE curso(
	numero_curso INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_curso
	PRIMARY KEY (numero_curso),
	nombre_curso VARCHAR(10) NOT NULL
	CONSTRAINT uq_nombre_curso
	UNIQUE (nombre_curso),
	credito INT NOT NULL,
	numero_profesor INT NOT NULL
	CONSTRAINT fk_curso_profesor
	FOREIGN KEY(numero_profesor)
	REFERENCES profesor(numero_profesor)
);


-- ======CREACION DE TABLA DE ESPECIALIDAD======

CREATE TABLE especialidad(
	numero_especialidad INT NOT NULL,
	numero_profesor INT NOT NULL,
	CONSTRAINT pk_especialidad
	PRIMARY KEY (numero_especialidad,numero_profesor),
	CONSTRAINT fk_especialidad_profesor
	FOREIGN KEY (numero_profesor)
	REFERENCES profesor(numero_profesor)
);

ALTER TABLE especialidad
ADD nombre VARCHAR (30) NOT NULL
GO

```
![Diagrama 3](/img/Construccion/02-Escuela.png)

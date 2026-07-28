CREATE DATABASE proyecto;
GO

USE proyecto;
GO

-- ==========CREAR TABLA EMPLEADO =============

CREATE TABLE empleado(
	snn INT NOT NULl
	CONSTRAINT pk_empleado
	PRIMARY KEY (snn),
	nombre VARCHAR (20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	fecha_nacimineto DATE NOT NULL,
	salario FLOAT NOT NULL,
	sexo VARCHAR(20) NOT NULL,
	direccion VARCHAR(20) NULL,
	gerente_snn INT NOT NULL,
	CONSTRAINT fk_empleado_empleado
	FOREIGN KEY (gerente_snn)
	REFERENCES empleado(snn)
);
GO

CREATE TABLE departamento(
	numero_departamento INT NOT  NULL
	CONSTRAINT pk_departamento
	PRIMARY KEY (numero_departamento),
	nombre VARCHAR(20) NOT NULL
	CONSTRAINT uq_departamento_nombre
	UNIQUE (nombre),
	gerente_ssn INT NOT NULL,
	CONSTRAINT fK_departamento_empleado
	FOREIGN KEY (gerente_ssn)
	REFERENCES empleado(snn),
	fecha_inicio DATE NOT NULL
);
GO

CREATE TABLE proyecto(
	numero_proyecto INT NOT NULL
	CONSTRAINT pk_proyecto
	PRIMARY KEY (numero_proyecto),
	nombre_proyecto VARCHAR(20) NOT NULL
	CONSTRAINT uq_proyecto_nombre_proyecto
	UNIQUE(nombre_proyecto),
	numero_departamento INT NOT NULL
	CONSTRAINT fk_proyecto_departamento
	FOREIGN KEY(numero_departamento)
	REFERENCES departamento(numero_departamento)
);
GO

CREATE TABLE dependiente(
	empleado_snn INT NOT NULL,
	nombre_depen VARCHAR(20) NOT NULL,
	sexo VARCHAR (10) NOT NULL,
	relacion VARCHAR(10) NOT NULL
	CONSTRAINT pk_dependiente
	PRIMARY KEY (empleado_snn, nombre_depen),
	CONSTRAINT fk_dependiente_empleado
	FOREIGN KEY (empleado_snn)
	REFERENCES empleado(snn)
);
GO

CREATE TABLE trabaja_en(
	empleado_snn INT NOT NULL,
	proyecto_numero INT NOT NULL,
	horas FLOAT NOT NULL,
	CONSTRAINT pk_trabaja_en
	PRIMARY KEY (empleado_snn,proyecto_numero),
	CONSTRAINT fk_trabaja_en_empleado
	FOREIGN KEY (empleado_snn)
	REFERENCES empleado(snn),
	CONSTRAINT fk_trabaja_en_proyecto
	FOREIGN KEY (proyecto_numero)
	REFERENCES proyecto (numero_proyecto)
);
GO

CREATE TABLE ubicacion_departamento (
	departamento_numero INT NOT NULL,
	ubicacion VARCHAR (30) NOT NULL,
	CONSTRAINT pk_ubicacion_departamento
	PRIMARY KEY (ubicacion),
	CONSTRAINT fk_ubicacion_departamento_departamento
	FOREIGN KEY (departamento_numero)
	REFERENCES departamento(numero_departamento)
);
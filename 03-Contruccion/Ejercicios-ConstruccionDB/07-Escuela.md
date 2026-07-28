## Ejercicio 7 escula
```
CREATE DATABASE escuela_completa;
GO

USE escuela_completa;
GO

CREATE TABLE alumno(
	matricula INT NOT NULL
	CONSTRAINT pk_alumno
	PRIMARY KEY (matricula),
	nombre_alumno VARCHAR (30) NOT NULL,
	apellido_paterno VARCHAR(20) NOT NULL,
	apellido_materno VARCHAR (20) NULL,
	correo VARCHAR (30) NOT NULL
); 
GO

CREATE TABLE telefono (
	clave_telefono INT NOT NULL,
	matricula INT NOT NULL
	CONSTRAINT pk_telefono
	PRIMARY KEY (clave_telefono, matricula),
	CONSTRAINT fk_telefono_alumno
	FOREIGN KEY (matricula)
	REFERENCES alumno(matricula),
	telefono INT NOT NULL,
);
GO

CREATE TABLE credencial (
	numero_credencial INT NOT NULL
	CONSTRAINT pk_credencial
	PRIMARY KEY (numero_credencial),
	fecha_expediente DATE NOT NULL,
	vigencia INT NOT NULL,
	matricula INT NOT NULL
	CONSTRAINT fk_credencial_alumno
	FOREIGN KEY (matricula)
	REFERENCES alumno (matricula)
);
GO

CREATE TABLE cursa (
	matricula_alumno INT NOT NULL,
	calificacion FLOAT NOT NULL,
	fecha_inscripcion DATE NOT NULL,
	CONSTRAINT fk_cursa_alumno
	FOREIGN KEY (matricula_alumno)
	REFERENCES alumno(matricula)
);
GO

CREATE TABLE materia (
	clave_materia INT NOT NULL,
	CONSTRAINT pk_materia
	PRIMARY KEY (clave_materia),
	nombre_materia VARCHAR (50) NOT NULL,
	creditos FLOAT NOT NULL,
);
GO


ALTER TABLE cursa
ADD clave_materia INT NOT NULL
CONSTRAINT pk_cursa
PRIMARY KEY (matricula_alumno,clave_materia),
CONSTRAINT fk_cursa_materia
FOREIGN KEY (clave_materia)
REFERENCES materia(clave_materia)
GO

CREATE TABLE profesor (
	numero_profesor INT NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellido_paterno VARCHAR(30) NOT NULL,
	apellido_materno VARCHAR (30) NULL,
	CONSTRAINT pk_profesor
	PRIMARY KEY (numero_profesor)
);
GO

CREATE TABLE departamento(
	numero_departamento INT NOT NULL,
	CONSTRAINT pk_departamento
	PRIMARY KEY (numero_departamento),
	edificio INT NOT NULL,
	nombre_departamento VARCHAR (30) NOT NULL
);
GO

ALTER TABLE profesor
ADD numero_departamento INT NOT NULL
CONSTRAINT fk_profesor_departamento
FOREIGN KEY (numero_departamento)
REFERENCES departamento(numero_departamento)
GO

CREATE TABLE dependiente(
	numero_profesor INT NOT NULL,
	nombre_dependiente VARCHAR(30) NOT NULL,
	parentesco VARCHAR(20) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	CONSTRAINT pk_dependiente
	PRIMARY KEY (numero_profesor,nombre_dependiente),
	CONSTRAINT fk_dependiente_profesor
	FOREIGN KEY (numero_profesor)
	REFERENCES profesor(numero_profesor)
);
GO

CREATE TABLE participa(
	rol VARCHAR(20) NOT NULL,
);

CREATE TABLE proyecto(
	numero_proyecto INT NOT NULL
	CONSTRAINT pk_proyecto
	PRIMARY KEY (numero_proyecto),
	nombre VARCHAR(30) NOT NULL,
	presupuesto FLOAT NOT NULL
);


ALTER TABLE participa
ADD numero_proyecto INT NOT  NULL,
numero_profesor INT NOT NULL,
CONSTRAINT pk_participa
PRIMARY KEY (numero_proyecto,numero_profesor),
CONSTRAINT fk_participa_proyecto
FOREIGN KEY (numero_proyecto)
REFERENCES proyecto (numero_proyecto),
CONSTRAINT fk_participa_profesor
FOREIGN KEY (numero_profesor)
REFERENCES profesor(numero_profesor)

ALTER TABLE materia
ADD numero_profesor INT NOT NULL
CONSTRAINT fk_materia_profesor
FOREIGN KEY (numero_profesor)
REFERENCES profesor(numero_profesor)
```
## Diagrama  

![Diagrama 7](/img/Construccion/07-Escuela.png)
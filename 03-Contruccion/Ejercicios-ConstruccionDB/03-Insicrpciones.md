## Ejercicio 03-Inscripcion

```
CREATE DATABASE inscripcion;
GO

USE inscripcion;
GO

CREATE TABLE alumno(
	matricula_id INT NOT NULL
	CONSTRAINT pk_alumno
	PRIMARY KEY (matricula_id),
	semestre INT NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR(20) NOT NULL,
	apellido_materno VARCHAR(20) NOT NULL
);
GO

CREATE TABLE inscribe(
	calificacion_final INT  NOT NULL
	CONSTRAINT ck_calificacion_final
	CHECK(calificacion_final>0),
	fecha_inscripcion DATE NOT NULL
);
GO

CREATE TABLE curso (
	clave_materia INT NOT NULL
	CONSTRAINT pk_curso
	PRIMARY KEY (clave_materia),
	nombre_materia VARCHAr(20) NOT NULL,
	creditos INT NOT NULL
);
GO

ALTER TABLE inscribe
ADD matricula_id INT NOT NULL -- Foreign key
CONSTRAINT fk_inscribe_alumno
FOREIGN KEY (matricula_id)
REFERENCES alumno(matricula_id),
clave_materia INT NOT NULL -- Foreing key
CONSTRAINT fk_inscribe_curso
FOREIGN KEY(clave_materia)
REFERENCES curso(clave_materia)
```
![Diagrama 2](/img/Construccion/03-Inscripcion.png)

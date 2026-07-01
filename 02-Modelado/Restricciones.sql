CREATE DATABASE BDcontrains;
GO

USE BDcontrains;
Go

CREATE TABLE paciente(
NumPaciente INT NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Apellido1 VARCHAR(20) NOT NULL,
Apellido2 VARCHAR(20) NOT NULL,
FechaNaci DATE NOT NULL,
CONSTRAINT pk_paciente
PRIMARY KEY (NumPaciente)
);
GO

CREATE TABLE Expediente(
Numexp INT NOT NULL,
FechaApertura DATE NOT NULL,
TipoSangre CHAR(3) NOT NULL,
NumPaciente INT NOT NULL,
CONSTRAINT pk_Expediente
PRIMARY KEY (Numexp),
CONSTRAINT unique_NumPaciente
UNIQUE (NumPaciente),
CONSTRAINT fk_Expediente_paciente
FOREIGN KEY (NumPaciente)
REFERENCES paciente (NumPaciente)
);
GO
INSERT INTO paciente
VALUES(1, 'Kevin', 'Kosner', 'Lopez','2007-02-18');

INSERT INTO paciente
VALUES(2, 'Daniel', 'Martines' , 'Mendoza','2005-01-30');

INSERT INTO paciente
VALUES(3, 'Luis Fernando', 'Nieto', '','2007-07-04');

SELECT *
FROM paciente;

INSERT INTO Expediente
VALUES(1,GETDATE(), '+0',1);

INSERT INTO Expediente
VALUES(2,GETDATE(), '+A',2);

INSERT INTO Expediente
VALUES(3,GETDATE(), '+B',3);

SELECT 
E.NumExp,
E.FechaApertura,
E.TipoSangre,
CONCAT(p.Nombre,' ',p.Apellido1,' ',p.Apellido2) AS [Nombre Completo]
FROM Expediente AS E
INNER JOIN paciente AS p
ON E.NumPaciente = p.NumPaciente;

GO

CREATE TABLE profesor(
Numprof INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
Apellido1 VARCHAR(30) NOT NULL,
Apellido2 VARCHAR(30),
);

GO

CREATE TABLE curso(
Numcurso INT NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Creditos INT NOT NULL,
NumProf INT NOT NULL,
CONSTRAINT pk_curso
PRIMARY KEY (Numcurso),
CONSTRAINT unique_nombre
UNIQUE(Nombre),
CONSTRAINT check_creditos
CHECK(Creditos > 0),
FOREIGN KEY(Numprof)
REFERENCES profesor (Numprof)
);

GO

CREATE TABLE especialidad(
Numesp INT NOT NULL,
Numprof INT NOT NULL,
NombreEsp VARCHAR(30) NOT NULL,
CONSTRAINT pk_especialidad
PRIMARY KEY(Numesp,Numprof),
CONSTRAINT unique_nombreesp
UNIQUE(NombreEsp),
CONSTRAINT fk_especialidad_profesor
FOREIGN KEY (Numprof)
REFERENCES profesor (Numprof)
);

INSERT INTO profesor
	VALUES('jose Luis', 'Herrera',
	'Gallardo'),
	('Luis', 'Nieto', 'Sanchez');

	
	INSERT INTO profesor
	VALUES('jose Angel', 'Perez',
	'Hernandez')

	GO

	Select * from profesor 

	INSERT INTO curso
	VALUES (1,'Base de Datos', 50,1);

	
	INSERT INTO curso
	VALUES (2,'Programacion', 50,1);

	
	INSERT INTO curso
	VALUES (3,'Topicos', 30,2);

	SELECT * FROM curso

 
 	INSERT INTO especialidad
	VALUES (1,1, 'aws'),
	       (2,1,'SQL SERVER'),
		   (3,2,'Redes'),
		   (4,2,'Scrum'),
		   (5,2,'Linux');

SELECT * FROM especialidad
ORDER BY NombreEsp DESC;

SELECT 
p.nombre,
p.Apellido1,
p.Apellido2,
c.Nombre,
c.Creditos,
e.NombreEsp

FROM profesor AS p
INNER JOIN curso AS c
ON p.Numprof = c.Numprof
INNER JOIN especialidad AS e 
ON p.Numprof = e.Numprof;

--Cardinalidad de M:N

GO

CREATE TABLE alumno(
Idalumno INT NOT NULL PRIMARY KEY,
Matricula VARCHAR(10) NOT NULL,
Nombre NVARCHAR(30) NOT NULL,
Apellido1 NVARCHAR(20) NOT NULL,
Apellido2 NVARCHAR(20) NULL,
Semestre INT NOT NULL,
CONSTRAINT unique_matricula
UNIQUE(Matricula),
CONSTRAINT check_semstre
CHECK(Semestre > 0 AND Semestre <= 10)
);

GO

CREATE TABLE materia(
  Idmateria INT NOT NULL,
  NombreMat NVARCHAR(20) NOT NULL,
  Creditos INT NOT NULL,
  CONSTRAINT pk_materia
  PRIMARY KEY (Idmateria),
  CONSTRAINT unique_nombremat
  UNIQUE(NombreMat),
  CONSTRAINT chk_creditos
  CHECK(Creditos BETWEEN 1 AND 60)
);

GO

CREATE TABLE inscribe(
Idmateria INT NOT NULL,
Idalumno INT NOT NULL,
Fechainscripcion DATE NOT NULL,
Calificacion DECIMAL (10,2) NOT NULL,
CONSTRAINT pk_inscribe 
PRIMARY KEY (Idmateria, Idalumno),
CONSTRAINT fk_inscribe_materia
FOREIGN KEY (Idmateria)
REFERENCES materia(Idmateria),
CONSTRAINT fk_inscribe_alumno
FOREIGN KEY(Idalumno)
REFERENCES alumno(Idalumno)
);

GO


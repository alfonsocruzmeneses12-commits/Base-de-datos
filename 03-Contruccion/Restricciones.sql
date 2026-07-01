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
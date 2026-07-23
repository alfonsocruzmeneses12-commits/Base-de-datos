## Ejercico 01 Hospital

```
CREATE DATABASE hospital;
GO

USE hospital;
GO


-- =======CREACION DE TABLA PACIENTE =====

CREATE TABLE paciente(
    numero_paciente INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_paciente
    PRIMARY KEY (numero_paciente),
    nombre_paciente VARCHAR(20) NOT NULL,
    apellido_paterno VARCHAR(20) NOT NULL,
    apellido_materno VARCHAR(20) NOT NULL,
    fecha_nacimientoo DATE  NOT NULL 
);
GO

-- =====CREACION DE TABLA EXPEDIENTE

CREATE TABLE expediente(
    numero_expediente INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_expediente
    PRIMARY KEY (numero_expediente),
    fecha_apertura CHAR(3) NOT NULL,
    tipo_sangre CHAR(3) NOT  NULL,
    numero_paciente INT NOT NULL -- FOREIGN KEY
    CONSTRAINT fk_expediente_paciente
    FOREIGN KEY (numero_paciente)
    REFERENCES paciente(numero_paciente),
    CONSTRAINT uq_numero_paciente
    UNIQUE (numero_paciente)
);

```
![Diagrama 1](/img/Construccion/01-Hospital.png)

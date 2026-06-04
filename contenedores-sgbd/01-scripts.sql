CREATE DATABASE pruebabd;

CREATE TABLE tbl1 (
id INT,
nombre VARCHAR(30)
);

INSERT INTO tbl1
Values (1, 'Pepito'),
       (2, 'Luis'),
       (3, 'Luar');
       
SELECT *
FROM tbl1;

//Ejemplo MariaDB
CREATE DATABASE prueba_atributos;
USE prueba_atributos;
CREATE TABLE empleado(
id int not null PRIMARY KEY,
nombre varchar(50) NOT NULL,
apellido1 varchar(15) NULL,
apellido2 varchar(15) NULL,
fecha_Ingreso DATE NOT NULL
);
INSERT INTO empleado
VALUES (1, 'Reberiano', 'Robles', 'De la Torre','1993-04-06');

SELECT 
*,year(fecha_ingreso), MONTH(fecha_ingreso), DAY(fecha_ingreso)
FROM empleado;

ALTER TABLE empleado
ADD COLUMN  fecha_naci DATE NOT NULL;

UPDATE empleado
SET fecha_naci = '1983-04-06'
where id = 1;

SELECT 
   nombre, 
   apellido1,
   apellido2,
   fecha_ingreso,
   fecha_naci,
   timestampdiff(year, fecha_naci, CURDATE())AS edad
FROM empleado
CREATE TABLE ALUMNO(
id_alumno int not null primary key,
nombre varchar(30) not null,
apellido_1 varchar (15) not null,
apellido_2 varchar (15) null,
telefono varchar (13),
calle varchar (50) not null,
numero_interior int,
numero_exterior int,
fecha_naci date not null,
);
insert into ALUMNO
values(1 , 'kevin', 'kosner', null, '+525617361280', 'INFIERNO', 666, NULL, '2007-02-18');

INSERT INTO ALUMNO (id_alumno,nombre,apellido_1,calle,fecha_naci)
VALUES (2,'JOSE LUIS', 'GALLARDO', 'ANGEL', '1983-04-06');


INSERT INTO ALUMNO (id_alumno,nombre,apellido_1,apellido_2,calle,fecha_naci)
VALUES (3,'Jimena', 'VALDEZ', 'DELGADILLO','5 DE MAYO', '2007-06-12');

SELECT *,DATEDIFF(YEAR,fecha_naci,GETDATE()) AS edad
FROM ALUMNO


CREATE TABLE categoria_2(
categoria_id int NOT NULL PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
);
CREATE TABLE productos2(
producto_id INT NOT NULL PRIMARY KEY,
nombre varchar(30) NOT NULL,
precio MONEY NOT NULL,
existencia INT NOT NULL,
categoria_id INT NULL,
CONSTRAINT fk_producto2_categoria_2
FOREIGN KEY (categoria_id)
REFERENCES categoria_2(categoria_id)
);
SELECT * FROM categoria_2;

SELECT *
FROM categoria_2;

SELECT *
FROM productos2
WHERE categoria_id = 1;
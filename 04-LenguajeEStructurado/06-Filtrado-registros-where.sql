/*========================================

SQL-DQL en SQL

Archivo: 06-Filtrado-registro-where.sql
Descripcion: Recuperar unicamente las filas que cumplen determoinadas condicciones mediante la clausula wherem
==========================================*/

/*

SINTAXIS GENERAL:

SELECT
	columna_1,
	columna_2,
	columna_n
FORM tabla
WHERE condicion;

ORDEN SINTACTICO (CONSULTAS)

SELECT
FROM
JOIN/ ON
WHERE
GROUP BY
HAVING
ORDER BY

ORDEN DE EJECUCUON

FROM/JOIN
WHERE 
GROUP BY
SELECT 
DISTINCT
ORDER BY
TOP

*/

-- Seleccionar los datos de los clientes donde su numero de cliente sea 25

SELECT 
	c.id_cliente AS [numero_cliente],
	UPPER(CONCAT(c.nombre,' ',
	c.apellido_paterno, ' ',
	c.apellido_materno, ' ')) AS [nombre_completo],
	c.correo
FROM clientes AS c
WHERE c.id_cliente = 25;

-- Seleccionar los datos de las categorias que sean Computo

-- Seleccionar los datos del cliente1

-- Seleccionar los datos de los clientes que no pertenecen al departamento 1

SELECT 
	c.id_categoria,
	c.nombre
FROM  categorias AS c
WHERE c.nombre = 'CÓMPUTO';

-- Seleccionar los productos cuyo precio sea superior a $490

-- Seleccionar los productos con existencia critica inferior a 10 unidades

-- Seleccioaar los empleados con salario de 30000 y mas

-- Seleccionar todas las ventas realizadas el 24 de Diciembre de 2025
-- MANEJO DE FECHAS
-- las fechas deben ir entre comillas y seguir el formato AAAA-MM-DD

SELECT
	v.id_venta,
	v.fecha,
	YEAR(v.fecha) AS [AÑO],
	MONTH(v.fecha) AS [Mes],
	DAY(v.fecha) AS [Dia],
	FORMAT(v.fecha,'MMMM') AS [Mes en Ingles],
	UPPER(FORMAT(v.fecha,'MMMM','es-Es')) AS [Mes en Español],
	FORMAT(v.fecha,'MMM') AS [Mes en Abrebiado],
	FORMAT(v.fecha,'MMM','es-Es') AS [Mes en Abrevido en español],
	FORMAT(v.fecha,'dddd') AS [Dia en ingles],
	FORMAT(v.fecha,'dddd','es-Es') AS [Dia en Español],
	v.id_cliente,
	v.id_empleado
FROM ventas AS v
WHERE fecha = '2025-12-24';


--comparaciones con expresiones calculadas
--Where tambien puede evaluar un calculo

--Mostrar productos cuyo valor del inventairio sea mayor a $50,000

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio*p.existencia) AS valor_inventario
FROM productos as p
WHERE (p.precio * p.existencia)>50000
ORDER BY valor_inventario DESC;
GO

--Operador Logico AND
-- mostrar productos con precio entre $200 y $300 que ademas tenga menos de  50 unidades

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio*p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio >= 200
AND
p.precio <= 300
AND
p.existencia < 50;
GO

-- Clausula BETWEN

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio*p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio BETWEEN 200 AND 300
AND 
p.existencia < 50;
GO

-- mostrar los empleados del departamento 1 cuyo salario sea superior $25000
SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_departamento
FROM empleados AS e
WHERE e.id_departamento = 1
	AND 
	e.salario > 25000;
GO

--Mostrar los productos con exisitencia inferior a 10 o superior a  190
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE p.existencia < 10
	OR p.existencia >190;
GO

-- Mostrar productos que no tengan precio mayor a 400

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE p.precio <= 400;
GO

-- Seleccionar los empleados que pertenzcan al departamento 1,
-- al departamento 2 y con salario mayor a $25000

SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_departamento
FROM empleados AS e
WHERE (e.id_departamento = 1
	OR	
	e.id_departamento = 2)
	AND e.salario > 25000;
GO

-- Operador BEWTEEN
-- BEWTEEN permite comprobar si un valor se encuentra dentro de un rango
-- inclusivo

/*============================================================
	SINTAXIS 

	WHERE columna BETWEEN limite_inferior AND limite_superior


=============================================================*/

-- Mostrar los empleados con salario entre $15,000.00 y $20,000.00, incluyendo ambos limites

SELECT
	e.id_empleado,
	e.nombre,
	e.salario
FROM empleados AS e
WHERE e.salario BETWEEN 15000.0 AND 20000.0
ORDER BY 3 DESC;
GO


SELECT
	e.id_empleado,
	e.nombre,
	e.salario
FROM empleados AS e
WHERE e.salario >= 15000.0 AND e.salario <= 20000.0
ORDER BY 3 DESC;
GO

-- Seleccionar los productos donde el precio este entre $100 y $200
SELECT
	p.nombre,
	p.id_producto,
	p.precio
FROM productos AS p
WHERE p.precio BETWEEN 100.0 AND 200;
GO

-- Seleccionar las ventas realizadas del 1 de enero de 2025 al 
-- 10 de enero de 2025

SELECT
	v.id_venta AS numero_venta,
	v.id_cliente AS cliente,
	v.id_empleado AS vendedor,
	v.fecha AS fecha_venta,
	UPPER(FORMAT(v.fecha,'MMMM','es-Es')) AS [mes_venta],
	UPPER(FORMAT(v.fecha,'dddd','es-Es')) AS [dia_venta],
	DATEPART(YEAR,v.fecha) AS [año_venta]
FROM ventas AS v
WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10'
ORDER BY fecha_venta ASC;
GO

-- NOT BETWEEN
-- Recupera valores que se encuentran fuera de un rango

--Seleccionar los productos que no se encuentren en el rango de precios de 100 y 400


SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE p.precio NOT BETWEEN  100 AND 400;
GO

-- Operador IN 
-- Permite comprobar una columna con una lista de valores

/*=============================================================
WHERE columna IN (valor_1,valor_2,valor_n)

Es equivalente a varias condiciones cenectadas con OR

============================================================ */

--Mostrar los productos pertenecientes a las categorias 1,7,12
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.id_categoria
FROM productos AS p
WHERE p.id_categoria = 1
	OR
	p.id_categoria = 7
	OR p.id_categoria = 12
ORDER BY id_categoria;

-- SELECCIONAR LOS DEPARTAMENTOS DE VENTAS, TI Y DIRECCION

SELECT
	d.id_departamento,
	d.nombre
FROM departamentos AS d
WHERE d.nombre IN ('Ventas','Direccion','TI'); 

-- NOT IN
-- Excluye los valores incluidos en la lista 

--Mostrar los datos de los empleados que no pertenezcan ni al departamento 1 ni al 2 

SELECT
	e.id_empleado,
	e.nombre,
	e.id_departamento
FROM empleado AS e
WHERE e.id_departamento NOT IN (1,2);
/*========================================

SQL-DQL en SQL

Archivo: 04-practice.sql
Descripcion: Realiza los ejemplos del comando SELECT

==========================================*/

-- Verificar la existencia de DATA en las tablas

SELECT COUNT (*) FROM[dbo].[categorias];
SELECT COUNT (*) FROM[dbo].[ciudades];
SELECT COUNT (*) FROM[dbo].[clientes];
SELECT COUNT (*) FROM[dbo].[departamentos];
SELECT COUNT (*) FROM[dbo].[detalle_ventas];
SELECT COUNT (*) FROM[dbo].[empleados];
SELECT COUNT (*) FROM[dbo].[estados];
SELECT COUNT (*) FROM[dbo].[productos];
SELECT COUNT (*) FROM[dbo].[proveedores];
SELECT COUNT (*) FROM[dbo].[ventas];

SELECT * FROM[dbo].[ciudades];
SELECT * FROM[dbo].[clientes];
SELECT * FROM[dbo].[departamentos];
SELECT * FROM[dbo].[detalle_ventas];
SELECT * FROM[dbo].[empleados];
SELECT * FROM[dbo].[estados];
SELECT * FROM[dbo].[productos];
SELECT * FROM[dbo].[ventas];
SELECT * FROM[dbo].[categorias];
SELECT * FROM[dbo].[proveedores];
/*========================================

Instruccion SELECT, es la instruccion mas utlizadaden SQL.
Su objetivo es consultar la informacion de una o varias tablas

Sintaxis 

SELECT 
	columna_1;
	columna_2;
	columna_3;
	columna_n
FROM nombre_tabla;

==========================================*/

-- Mostrar todos los estados

SELECT*
FROM estados; -- no es recomendable usarla cuando hay muchos datos 
GO

SELECT 
	nombre
FROM estados;
GO 

-- Mostrar los  nombres de los departamentos 
SELECT nombre
FROM departamentos;
GO

-- Mostrar el nombre del proveedor, el telefono y su contacto

SELECT
	empresa,
	telefono,
	contacto
FROM proveedores;
GO

--Alias de columnas

--Muestre los nombres de los estados 

SELECT 
	nombre 'Nombre del Estado'
FROM estados;
GO

SELECT 
	nombre AS 'Nombre del Estado'
FROM estados;
GO

SELECT 
	nombre NombredelEstado
FROM estados;
GO

SELECT 
	nombre AS Nombre_del_estado
FROM estados;
GO

SELECT 
	nombre [Nombre del Estado]
FROM estados;
GO

SELECT 
	nombre AS [Nombre del Estado]
FROM estados;
GO

SELECT COUNT(*) AS [tota de Ventas Detalle]
FROM detalle_ventas;
GO

-- Mostrar el codigo, nombre y precio pero con nombres
-- mas adecuados para le usuario

SELECT 
	codigo AS codigo_producto,
	nombre AS producto,
	precio AS precio_unitario
FROM productos;

-- Orden Logico de una consulta SELECT
-- Orden de comno escribimos la consulta
--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING
--ORDER BY
-- ORDEN DE EJECUCION DE SQL SERVER
FROM 
WHERE
GROUP BY
HAVING
SELECT
ORDER BY

-- TODO: VER CAMPOS CALCULADOS |
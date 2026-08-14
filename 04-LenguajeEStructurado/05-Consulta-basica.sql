/*========================================

SQL-DQL en SQL

Archivo: 05-consultas-basicas.sql
Descripcion: Introduccion a la ejecucion de las primeras consultas de recuperacion de datos 

==========================================*/

USE comercial_db
GO

-- Utilizando el operador asterisco (*), no muy recomendada
-- *, todas las columnas

SELECT *
FROM productos;
GO
-- Seleccionar columnas  necesarias  (Proyeccion)

SELECT
	nombre
FROM estados;
GO

SELECT
	codigo,
	nombre,
	precio
FROM productos;
GO

SELECT
	*
FROM clientes;
GO

SELECT
	nombre,
	apellido_paterno,
	telefono,
	correo
FROM clientes;
GO

-- Alias de columna
-- Es un nombre temporal asignado a una columna dentro del
-- resultado de una consulta

SELECT
	codigo,
	nombre,
	precio
FROM productos;
GO


SELECT
	codigo AS codigo_producto,
	nombre AS nombre_producto,
	precio AS precio_unitario
FROM productos;
GO

SELECT
	codigo AS [codigo_producto],
	nombre AS [nombre_producto],
	precio AS [precio_unitario]
FROM productos;
GO

SELECT
	codigo AS 'codigo_producto',
	nombre AS 'nombre_producto',
	precio AS 'precio_unitario'
FROM productos;
GO

-- Otra forma de poner alias (No recomendada)
SELECT
	codigo codigo_producto,
	nombre nombre_producto,
	precio precio_unitario
FROM productos;
GO

-- Alias tabla
SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p;
GO

SELECT
	productos.codigo,
	productos.nombre,
	productos.precio
FROM productos ;
GO

SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p;
GO


SELECT 
	categorias.id_categoria AS [nombre_categoria],
	categorias.nombre AS [nombre_categoria],
	id_producto AS [numero_producto],
	productos.nombre AS [nombre_producto],
	precio,
	existencia
FROM categorias 
INNER JOIN 
productos
ON categorias.id_categoria = productos.id_categoria;
GO

SELECT 
	c.id_categoria AS [nombre_categoria],
	c.nombre AS [nombre_categoria],
	id_producto AS [numero_producto],
	p.nombre AS [nombre_producto],
	precio,
	existencia
FROM categorias AS c
INNER JOIN 
productos AS p
ON c.id_categoria = p.id_categoria;
GO

-- Columnas calculadas
-- Seleccionar los datos de los productos y le valor del inventario

SELECT
	p.codigo AS #,
	p.nombre AS [nombre_producto],
	p.precio AS [precio_prdocuto],
	p.existencia as [existencia_producto],
	(precio* existencia) AS 'valor inventario'
FROM productos AS p;
GO

-- seleccionar los datos de la ventas, numero de ventas ,cantidad vendidad
-- precio,descuento y calcualar el importe bruto, importe con descuento
-- (importe bruto por descuento entre 100) y
-- el importe neto 

SELECT
	dv.id_venta AS [#venta],
	dv.cantidad AS [cantidad_vendida],
	dv.precio AS [precio_venta],
	dv.descuento AS [descuento],
	(dv.cantidad * dv.precio) AS [importe_bruto],
	(dv.cantidad * dv.precio * descuento /100.0) AS importe_desceunto,
	dv.cantidad * dv.precio * (1- descuento /100.0)  AS importe_neto
FROM detalle_ventas AS dv;

-- Uso de DISTINTCT

-- Elimina del resultado las filas que tengan valores reptidos en todas las columnas seleccionadas

/*========================================

SELECT DISTINCT columna
FROM tabla;

==========================================*/

-- Ejemplo sin distintc
-- Selecciona los sexos de los clientes

SELECT sexo 
FROM clientes;
GO

-- Ejemplo con DISTINCT
SELECT DISTINCT
	sexo
FROM clientes;
GO

-- Seleccionar los distintos descuentos que se le han aplicados a las ventas

SELECT DISTINCT
	dv.descuento
FROM detalle_ventas AS dv;
GO

-- Seleccionar los distintos departamentos a los que pertenece los empleados

SELECT DISTINCT
	e.id_departamento AS [departamento]
FROM empleados AS e;
GO

-- DISTINCT PARA VARIAS COLUMNAS
-- cuando se utiliza con varias columnas, se evalua la condicion completa 

SELECT 
	p.id_categoria,
	p.id_proveedor
FROM productos AS p;

-- USO DE TOP
-- Limita la cantidad de filas devueltsas por una consulta 

/*========================================

SELECT TOP(cantidad)
	columna_1,
	columna_2,
	columna_n
FROM tabla;

==========================================*/

-- Seleccionar los cinco primeros productos encontrados en la tabla productos

SELECT TOP(15)
	id_producto,
	codigo
FROM productos AS p


-- seleccionar los primeros  5 productos que aparezcan en la consulta mostrando
-- el codigo, nombre, precio, existencia y el valor del inventario
-- de la tabla de prodcutos

SELECT	TOP(5)
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p;
GO

-- TOP CON PORCENTAJE
-- SQL Server permite eliminar el resultado mediante un porcentaje

/*
SELECT TOP (porcentaje) PERCENT
	columnas
FROM tabla;

*/

-- Seleccionar el 10 porciento de los registros de la tabla productos
-- mostrando el numero de producto, codigo y nombre

SELECT TOP(10) PERCENT 
	p.id_producto,
	p.codigo,
	p.nombre
FROM productos AS  p;
GO

-- Seleccionar los 3 primeros descuentos distintivos 

SELECT DISTINCT TOP (3)
	descuento
FROM detalle_ventas AS dv;
GO


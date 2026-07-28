# Diccionario de Datos - Ejercicio 4

## 1. Información General 
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Control de Pedidos y Productos |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| SGBD | SQL Server | 

## 2. Descripción del Sistema
Controla los pedidos de compras que realizan los clientes sobre los distintos productos en inventario.

## 3. Catálogo de Restricciones
| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |

## 4. Diccionario de Datos 

**Tabla:** Cliente
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Identificador | INT | - | PK, NN | ID único del cliente |
| Nombre | VARCHAR | 100 | NN | Nombre o Razón Social del cliente |

---

**Tabla:** Pedido
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numero_pedido | INT | - | PK, NN | Folio único del pedido |
| Fecha_Pedido | DATE | - | NN | Fecha de solicitud |
| Id_cliente | INT | - | FK, NN | Cliente que genera el pedido |

---

**Tabla:** Detalle_de_Pedido
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numero_pedido | INT | - | PK, FK, NN | Folio del pedido relacionado |
| Numero_Producto | INT | - | PK, FK, NN | Código del producto solicitado |
| Cantidad | INT | - | NN | Cantidad de artículos |
| Precio | DECIMAL | 10,2 | NN | Precio unitario histórico |

---

**Tabla:** Producto
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num_Producto | INT | - | PK, NN | Identificador de catálogo del producto |
| Precio_de_Producto | DECIMAL | 10,2 | NN | Precio de lista actual |

## 5. Relaciones 
| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Cliente -> Pedido | 1:N | Un cliente puede hacer varios pedidos |
| Pedido -> Detalle_de_Pedido | 1:M | Un pedido tiene uno o más conceptos de artículos |
| Producto -> Detalle_de_Pedido | 1:N | Un producto aparece en múltiples detalles de pedido |

## 6. Matriz de Claves Foráneas
| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| Pedido | Id_cliente | Cliente (Identificador) |
| Detalle_de_Pedido | Numero_pedido | Pedido (Numero_pedido) |
| Detalle_de_Pedido | Numero_Producto | Producto (Num_Producto) |
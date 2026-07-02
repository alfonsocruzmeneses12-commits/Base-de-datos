# Diccionario de Datos - Ejercicio 1

## 1. Información General 
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Control de Expedientes Médicos |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| SGBD | SQL Server | 

## 2. Descripción del Sistema
Administra la información básica de los pacientes y la apertura de sus expedientes clínicos individuales.

## 3. Catálogo de Restricciones
| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |

## 4. Diccionario de Datos 

**Tabla:** Paciente
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumPaciente | INT | - | PK, NN | Identificador único del paciente |
| Nombre | VARCHAR | 20 | NN | Nombre(s) del paciente |
| Apellido1 | VARCHAR | 20 | NN | Primer apellido |
| Apellido2 | VARCHAR | 20 | NN | Segundo apellido |
| FechaNaci | DATE | - | NN | Fecha de nacimiento |

---

**Tabla:** Expediente
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumExp | INT | - | PK, NN | Número único de expediente |
| FechaApertura | DATE | - | NN | Fecha en que se abrió el expediente |
| TipoSangre | CHAR | 3 | NN | Tipo de sangre (ej. O+, A-) |
| Id_paciente | INT | - | FK, NN | Referencia al paciente asignado |

## 5. Relaciones 
| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Paciente -> Expediente | 1:1 | Un paciente posee un único expediente clínico |

## 6. Matriz de Claves Foráneas
| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| Expediente | Id_paciente | Paciente (NumPaciente) |
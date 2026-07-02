# Diccionario de Datos - Ejercicio 3

## 1. Información General 
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Inscripción de Asignaturas |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| SGBD | SQL Server | 

## 2. Descripción del Sistema
Permite realizar el seguimiento de las materias en las que se inscriben los alumnos y registrar sus calificaciones finales.

## 3. Catálogo de Restricciones
| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| CK | Check |

## 4. Diccionario de Datos 

**Tabla:** Alumno
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdAlumno | INT | - | PK, NN | Identificador único del alumno |
| Matricula | VARCHAR | 10 | NN | Matrícula oficial |
| Nombre | VARCHAR | 30 | NN | Nombre del estudiante |
| Apellido2 | VARCHAR | 20 | NULL | Segundo apellido |
| Semestre | INT | - | NN, CK | Semestre en curso (CK: > 0) |

---

**Tabla:** Materia
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdMateria | INT | - | PK, NN | Identificador único de la materia |
| NombreMat | VARCHAR | 20 | NN | Nombre de la materia |
| Creditos | INT | - | NN, CK | Créditos (CK: > 0) |

---

**Tabla:** Inscribe
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| IdMateria | INT | - | PK, FK, NN | Código de la materia inscrita |
| IdAlumno | INT | - | PK, FK, NN | Código del alumno inscrito |
| FechaInscripcion | DATE | - | NN | Fecha de alta de la materia |
| CalFinal | DECIMAL | 4,2 | NULL | Calificación final obtenida |

## 5. Relaciones 
| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Alumno -> Inscribe | 1:N | Un alumno puede inscribir muchas materias |
| Materia -> Inscribe | 1:N | Una materia puede ser inscrita por muchos alumnos |

## 6. Matriz de Claves Foráneas
| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| Inscribe | IdMateria | Materia (IdMateria) |
| Inscribe | IdAlumno | Alumno (IdAlumno) |
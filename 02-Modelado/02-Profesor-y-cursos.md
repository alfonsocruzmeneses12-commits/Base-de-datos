# Diccionario de Datos - Ejercicio 2

## 1. Información General 
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Control de Especialidades Docentes |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| SGBD | SQL Server | 

## 2. Descripción del Sistema
Gestiona los cursos impartidos por profesores, así como las especialidades asignadas a cada docente.

## 3. Catálogo de Restricciones
| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |

## 4. Diccionario de Datos 

**Tabla:** Profesor
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProf | INT | - | PK, NN | Código identificador del profesor (corregido de la imagen) |
| Nombre | VARCHAR | 30 | NN | Nombre completo del docente |
| Apellido1 | VARCHAR | 20 | NN | Primer apellido |
| Apellido2 | VARCHAR | 20 | NULL | Segundo apellido |

---

**Tabla:** Curso
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumCurso | INT | - | PK, NN | Identificador único del curso |
| NombreCurso | VARCHAR | 20 | NN | Nombre de la asignatura o taller |
| Creditos | INT | - | NN | Créditos académicos que otorga |
| NumProf | INT | - | FK, NN | Profesor que imparte el curso |

---

**Tabla:** Especialidad
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumEsp | INT | - | PK, FK, NN | Identificador de la especialidad |
| NumProf | INT | - | NN | Profesor asociado a la especialidad |
| Nombre | VARCHAR | 30 | NN | Nombre del área de especialidad |

## 5. Relaciones 
| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Profesor -> Curso | 1:1 / 1:N | Un profesor puede tener asignado un curso (según diagrama) |
| Profesor -> Especialidad | 1:1 | Relación de especialización del docente |

## 6. Matriz de Claves Foráneas
| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| Curso | NumProf | Profesor (NumProf) |
| Especialidad | NumEsp | Profesor (NumProf) |
# Diccionario de Datos - Ejercicio 7

## 1. Información General 
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Gestión Escolar y de Investigación |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| SGBD | SQL Server | 

## 2. Descripción del Sistema
Administración integral que interconecta la gestión de credenciales estudiantiles, teléfonos, cursos asignados, profesores de departamentos y su rol en proyectos específicos.

## 3. Catálogo de Restricciones
| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |

## 4. Diccionario de Datos 

**Tabla:** Alumno
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 15 | PK, NN | Código oficial identificador del alumno |
| Nom_Alumno | VARCHAR | 50 | NN | Nombre de pila |
| Ap_1_Alumno | VARCHAR | 50 | NN | Apellido paterno |
| Ap_2_Alumno | VARCHAR | 50 | NULL | Apellido materno |
| Fecha_Naci | DATE | - | NN | Fecha de nacimiento |
| Correo | VARCHAR | 100 | UQ, NN | Correo electrónico de contacto |

---

**Tabla:** Telefono
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Clave_Tel | INT | - | PK, NN | Consecutivo de identificación del teléfono |
| Matricula | VARCHAR | 15 | FK, NN | Alumno propietario de la línea |
| Telefono | VARCHAR | 15 | NN | Número telefónico |

---

**Tabla:** Credencial
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num_Credencial | INT | - | PK, NN | Folio único de credencial física |
| Fecha_Expediente | DATE | - | NN | Fecha de expedición |
| Vigencia | DATE | - | NN | Fecha de vencimiento |
| Matricula | VARCHAR | 15 | FK, UQ, NN | Alumno asociado a la credencial |

---

**Tabla:** Materia
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Clave_Materia | VARCHAR | 10 | PK, NN | Identificador de asignatura |
| Nombre_Materia | VARCHAR | 100 | NN | Título de la materia |
| Creditos | INT | - | NN | Carga crediticia |

---

**Tabla:** Cursa
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 15 | PK, FK, NN | Alumno que toma el curso |
| Clave_Materia | VARCHAR | 10 | PK, FK, NN | Materia que se está cursando |
| Fecha_Inscri | DATE | - | NN | Fecha de inscripción al ciclo |
| Cali_Final | DECIMAL | 4,2 | NULL | Calificación final |

---

**Tabla:** Profesor
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num_Prof | INT | - | PK, NN | Matrícula de empleado docente |
| Nombre | VARCHAR | 50 | NN | Nombre del profesor |
| Ap_1 | VARCHAR | 50 | NN | Apellido paterno |
| Ap_2 | VARCHAR | 50 | NULL | Apellido materno |
| Num_Departamento | INT | - | FK, NN | Departamento al que pertenece |

---

**Tabla:** Dependent
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num_Prof | INT | - | PK, FK, NN | Profesor responsable del dependiente |
| Nombre_Depen | VARCHAR | 50 | PK, NN | Nombre del dependiente |
| Fecha_Naci | DATE | - | NN | Cumpleaños del dependiente |
| Parentesco | VARCHAR | 30 | NN | Lazo (Hijo, Cónyuge, etc.) |

---

**Tabla:** Departamento
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num_Departamento | INT | - | PK, NN | ID del departamento académico |
| Nombre_Departa | VARCHAR | 50 | NN | Nombre oficial |
| Edificio | VARCHAR | 30 | NN | Inmueble donde se ubica |

---

**Tabla:** Proyecto
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num_Proy | INT | - | PK, NN | Folio del proyecto de investigación |
| Nombre | VARCHAR | 100 | NN | Título explicativo |
| Presupuesto | DECIMAL | 12,2 | NN | Fondos asignados |

---

**Tabla:** Participa
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num_Prof | INT | - | PK, FK, NN | Profesor que colabora |
| Num_Proy | INT | - | PK, FK, NN | Proyecto de destino |
| Rol | VARCHAR | 50 | NN | Cargo en la investigación (ej. Director) |

## 5. Relaciones 
| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Alumno -> Telefono | 1:N | Un estudiante registra múltiples números de contacto |
| Alumno -> Credencial | 1:1 | Un estudiante cuenta con una sola identificación |
| Alumno -> Cursa | 1:N | Un alumno se inscribe en varias materias |
| Materia -> Cursa | 1:N | Una materia se cursa en múltiples instancias por alumnos |
| Profesor -> Dependent | 1:N | Un docente puede vincular a varios familiares |
| Departamento -> Profesor | 1:N | Un departamento adscribe a muchos profesores |
| Profesor -> Participa | 1:N | Un académico coopera en diferentes proyectos |
| Proyecto -> Participa | 1:N | Un proyecto recibe la participación de varios docentes |

## 6. Matriz de Claves Foráneas
| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| Telefono | Matricula | Alumno (Matricula) |
| Credencial | Matricula | Alumno (Matricula) |
| Cursa | Matricula | Alumno (Matricula) |
| Cursa | Clave_Materia | Materia (Clave_Materia) |
| Profesor | Num_Departamento | Departamento (Num_Departamento) |
| Dependent | Num_Prof | Profesor (Num_Prof) |
| Participa | Num_Prof | Profesor (Num_Prof) |
| Participa | Num_Proy | Proyecto (Num_Proy) |
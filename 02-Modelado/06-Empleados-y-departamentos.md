# Diccionario de Datos - Ejercicio 6

## 1. Información General 
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Control de Nómina y Proyectos de Empresa |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| SGBD | SQL Server | 

## 2. Descripción del Sistema
Mapea la administración laboral de empleados pertenecientes a departamentos, su historial de horas de trabajo en proyectos y sus familiares dependientes.

## 3. Catálogo de Restricciones
| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |

## 4. Diccionario de Datos 

**Tabla:** Empleado
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| SSN | CHAR | 9 | PK, NN | Número de Seguridad Social del empleado |
| Nombre | VARCHAR | 50 | NN | Nombre de pila |
| Apellido | VARCHAR | 50 | NN | Apellidos completos |
| Fecha_Nac | DATE | - | NN | Fecha de nacimiento |
| Salario | DECIMAL | 10,2 | NN | Sueldo base |
| Sexo | CHAR | 1 | NN | Sexo biológico |
| Gerente_ssn | CHAR | 9 | FK, NULL | SSN del supervisor directo |
| Num_Depto | INT | - | FK, NN | Departamento de adscripción |

---

**Tabla:** Departamento
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num_Depto | INT | - | PK, NN | Código único del departamento |
| Nombre_Gerente_ssn | CHAR | 9 | FK, NN | SSN del empleado que funge como gerente |
| Fecha_Inicio_Gerente | DATE | - | NN | Fecha de alta del cargo de gerencia |

---

**Tabla:** Ubicacion_Depto
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Depto_Num | INT | - | PK, FK, NN | Código de departamento relacionado |
| Ubicacion | VARCHAR | 50 | PK, NN | Ubicación física (sala, edificio, ciudad) |

---

**Tabla:** Proyecto
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num_Proy | INT | - | PK, NN | Código asignado al proyecto |
| Nombre_Proy | VARCHAR | 50 | NN | Nombre descriptor |
| Control_Depto_Num | INT | - | FK, NN | Departamento encargado del proyecto |
| Localizacion_Proy | VARCHAR | 50 | NN | Zona donde se ejecuta |

---

**Tabla:** Trabajo_en
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Emp_ssn | CHAR | 9 | PK, FK, NN | SSN del trabajador operando |
| Proy_Num | INT | - | PK, FK, NN | Código del proyecto de destino |
| Horas | DECIMAL | 5,2 | NN | Cantidad de horas invertidas |

---

**Tabla:** Dependiente
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Emp_ssn | CHAR | 9 | PK, FK, NN | SSN del titular responsable |
| Nombre_Dep | VARCHAR | 50 | PK, NN | Nombre completo del dependiente |
| Sexo | CHAR | 1 | NN | Sexo del dependiente |
| Relacion | VARCHAR | 30 | NN | Parentesco familiar |

## 5. Relaciones 
| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Departamento -> Empleado | 1:N | Un departamento coordina muchos empleados |
| Empleado -> Departamento | 1:1 | Un empleado ejerce gerencia sobre un departamento |
| Empleado -> Empleado (Auto) | 1:N | Un empleado supervisa a otros empleados |
| Departamento -> Ubicacion_Depto | 1:N | Los departamentos pueden poseer varios inmuebles |
| Departamento -> Proyecto | 1:N | Un departamento maneja varios proyectos |
| Empleado -> Trabajo_en | 1:N | Los empleados cargan horas a diferentes proyectos |
| Proyecto -> Trabajo_en | 1:N | Un proyecto aglutina horas de varios colaboradores |
| Empleado -> Dependiente | 1:N | Un empleado tiene registrados diversos dependientes |

## 6. Matriz de Claves Foráneas
| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| Empleado | Gerente_ssn | Empleado (SSN) |
| Empleado | Num_Depto | Departamento (Num_Depto) |
| Departamento | Nombre_Gerente_ssn | Empleado (SSN) |
| Ubicacion_Depto | Depto_Num | Departamento (Num_Depto) |
| Proyecto | Control_Depto_Num | Departamento (Num_Depto) |
| Trabajo_en | Emp_ssn | Empleado (SSN) |
| Trabajo_en | Proy_Num | Proyecto (Num_Proy) |
| Dependiente | Emp_ssn | Empleado (SSN) |
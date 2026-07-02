# Diccionario de Datos - Ejercicio 5

## 1. Información General 
| Elemento | Valor |
| :--- | :--- |
| Proyecto | Enterprise Resource Management (ERM) |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| SGBD | SQL Server | 

## 2. Descripción del Sistema
Manages corporate resources including multi-department structures, employee assignments, project lines, and dependent tracking.

## 3. Catálogo de Restricciones
| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |

## 4. Diccionario de Datos 

**Tabla:** Employee
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| SSN | CHAR | 9 | PK, NN | Social Security Number |
| Firstname | VARCHAR | 50 | NN | Employee's given name |
| Address | VARCHAR | 100 | NN | Living address |
| Birthdate | DATE | - | NN | Employee's birthdate (corrected) |
| Salary | DECIMAL | 10,2 | NN | Monthly earnings |
| Sex | CHAR | 1 | NN | Gender identity indicator |
| Department_Number | INT | - | FK, NN | Assigned organizational department |

---

**Tabla:** Department
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, NN | Unique department identifier |
| Name | VARCHAR | 50 | NN | Operational department title |
| Manager_SSN | CHAR | 9 | FK, NN | Department manager assignment |
| Start_Date | DATE | - | NN | Date manager started role |

---

**Tabla:** Locations
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num_Loc | INT | - | PK, NN | Location item index |
| Department_Number | INT | - | PK, FK, NN | Associated department code |
| Location | VARCHAR | 50 | NN | Specific regional site name |

---

**Tabla:** Projects
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, NN | Core project record index |
| Name | VARCHAR | 50 | NN | Public project label |
| Location | VARCHAR | 50 | NN | Main project development area |
| Controlling_Dept | INT | - | FK, NN | Department supervising the project |

---

**Tabla:** Works_on
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Employee_SSN | CHAR | 9 | PK, FK, NN | Participating employee |
| Project_Number | INT | - | PK, FK, NN | Allocated project code |
| Hours | DECIMAL | 5,2 | NN | Logged execution hours |

---

**Tabla:** Dependent
| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Employee_SSN | CHAR | 9 | PK, FK, NN | Sponsoring employee code |
| Dependent_Name | VARCHAR | 50 | PK, NN | Dependent identifier |
| Sex | CHAR | 1 | NN | Dependent biological sex |
| Relationship | VARCHAR | 30 | NN | Kind of relationship (e.g., Spouse) |
| Birthdate | DATE | - | NN | Birthday of dependent |

## 5. Relaciones 
| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Department -> Employee | 1:N | A department houses multiple employees |
| Employee -> Department | 1:1 | An employee manages exactly one department |
| Department -> Locations | 1:N | Departments can expand across several sites |
| Department -> Projects | 1:N | Departments monitor an array of active tasks |
| Employee -> Works_on | 1:N | Members work on diverse project lines |
| Projects -> Works_on | 1:N | Individual targets require multi-employee efforts |
| Employee -> Dependent | 1:N | Workers report multiple legal dependents |

## 6. Matriz de Claves Foráneas
| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| Employee | Department_Number | Department (Number) |
| Department | Manager_SSN | Employee (SSN) |
| Locations | Department_Number | Department (Number) |
| Projects | Controlling_Dept | Department (Number) |
| Works_on | Employee_SSN | Employee (SSN) |
| Works_on | Project_Number | Projects (Number) |
| Dependent | Employee_SSN | Employee (SSN) |
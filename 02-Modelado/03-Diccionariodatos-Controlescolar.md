# Diccionario de Datos de base de datos

1. Informacion General

| Elemento| Valor |
| :--- | :--- |
| Proyecto | Sistema de Control Escolar |
| Version | 1.0 |
| Fecha | Junio 2026 |
| Elaboro | Alfonso Cruz Meneses |
| SGBD | SQLServer |

2. Descripcion del Sistema de Base de Datos 

El sistema administra : 

- Carreras
- Alumnos 
- Profesores 
- Materias
- Grupos
- Inscripciones

Permite controlar la oferta educativa y la inscriprcion de los estudiantes 

3. Catalogo de Restricciones Utilizadas

| Codigo | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ| Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |

4. Diccionario de Datos

**Tabla** Carrera

**Descripcion:** _Almacena las carreras ofertadas por la Universidad_

| Campos| Tipo | Longitud | Restriccion | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_Carrera | INT  | - | PK, AI, NN | Identificador uno de la carrera |
| nombre| VARCHAR | 100 | UQ, NN | Nombre de la carrera |
| duracion_cuatrimestre| INT | - | NN, CK(>0) | Duracion del cuatrimestre |

---

**Tabla** Alumno

**Descripcion:** _Almacena la informacion de los estudiantes_

| Campos| Tipo | Longitud | Restriccion | Descripcion |
| :--- | :--- | :--- | :--- | :--- |
| id_Alumno | INT  | - | PK, AI, NN | Identificador uno del Alumno|
| matricula | VARCHAR  | 10 | UQ, NN | Matricula institucional|
| nombre | VARCHAR | 50 | NN | Nombre del estudiante |
| apellido_paterno | VARCHAR | 50 | NN | Apellido Paterno |
| apellido_materno | VARCHAR | 50 | NULL | Apellido Materno |
| correo | VARCHAR | 100 | UQ , NN| Correo Institucional |
| fecha_nacimiento | DATE | - | NN | Fecha de Nacimiento|
| id_carrera | INT | - | FK,NN | Carrera  la que pertenece |

---

5. Relaciones

| Relacion | Cardinalidad | Descripcion |
|:----------|:---------:|----------:|
|Carrera -> Alumno|1:N|Una carrera tiene muchos Alumnos|
|Carrera -> Materia|1:N|Una carrera tiene muchas materias|
|Profesor -> Grupo |1:N|Un profesor puede impartir a varios grupos |
|Materia -> Grupo |1:N|Una materia puede abrirse a varios grupos|
|Alumno -> Inscrpcion |1:N|Un Alumno puede tener varias inscripciones|
|Grupo -> Inscripcion |1:N|Un grupo puede tener muchos alumnos|

---


6. Matriz de Claves Foraneas

| Tabla | Campo FK |Referencia |
|:----------|:---------:|----------:|
|Alumno| id_carrera|Carrera (id_carrera)|
|Materia|id_carrera|Carrera (id_carrera)|
|Grupo| id_profesor|Profesor (id_profesor)|
|Grupo| id_materia|Materia (id_materia)|
|Inscripcion| id_alumno |Alumno(id_alumno)|
|Inscripcion| id_grupo|Grupo (id_grupo)|

---

7. INTEGRIDAD REFERENCIAL 

|Restriccion |Descripcion |
| :--- | :--- |
|IR-01 |No se puede registrar un alumno con una carrera inexistente|
|IR-02|No se puede crear un grupo para una materia inexistente|
|IR-03|No se puede crear un grupo para un profesor inexistente|

---

8. Reglas del Negocio

|Codigo |Regla |
| :--- | :--- |
|RN-01 |Un alumno pertenece solo a una sola carrera|
|RN-02 |Una carrera puede tener muchos alumnos|
|RN-03 |Una carrera puede tener muchas materias|

---

9. Diagrama Relacional

![Solucion Ej3](../img/R/Ejercicio5-R%20-%20Página%202.png)







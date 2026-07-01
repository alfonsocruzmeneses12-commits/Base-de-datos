# Diccionario de Datos de la Base de Datos Clínica

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Expedientes Clínicos |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Alfonso |
| SGBD | SQL Server |

---

# 2. Descripción del Sistema de Base de Datos

El sistema administra la información de los pacientes y sus expedientes médicos.

Permite controlar:

- Pacientes
- Expedientes Clínicos

El sistema permite registrar la información personal de los pacientes y asociar un expediente clínico con sus datos médicos.

---

# 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |

---

# 4. Diccionario de Datos

## Tabla: Paciente

*Descripción:* Almacena la información general de los pacientes registrados.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumPaciente | INT | - | PK, NN | Identificador único del paciente |
| Nombre | VARCHAR | 20 | NN | Nombre del paciente |
| Apellido1 | VARCHAR | 20 | NN | Primer apellido del paciente |
| Apellido2 | VARCHAR | 20 | NN | Segundo apellido del paciente |
| FechaNaci | DATE | - | NN | Fecha de nacimiento del paciente |

---

## Tabla: Expediente

*Descripción:* Almacena la información clínica correspondiente a cada paciente.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumExp | INT | - | PK, NN | Número del expediente |
| FechaApertura | DATE | - | NN | Fecha de apertura del expediente |
| TipoSangre | CHAR | 3 | NN | Tipo de sangre del paciente |
| IdPaciente | INT | - | FK, NN | Paciente al que pertenece el expediente |

---

# 5. Relaciones

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Paciente → Expediente | 1 : 1 | Cada paciente posee un único expediente clínico y cada expediente pertenece a un solo paciente. |

---

# 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Expediente | IdPaciente | Paciente (NumPaciente) |

---

# 7. Integridad Referencial

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede registrar un expediente para un paciente inexistente. |
| IR-02 | Cada expediente debe pertenecer únicamente a un paciente registrado. |

---

# 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un paciente solo puede tener un expediente clínico. |
| RN-02 | Todo expediente debe estar asociado a un paciente. |
| RN-03 | El tipo de sangre debe registrarse obligatoriamente. |
| RN-04 | La fecha de apertura del expediente no puede ser nula. |

---

# 9. Diagrama Relacional

Paciente (1) ─────────── (1) Expediente

Paciente
- NumPaciente (PK)
- Nombre
- Apellido1
- Apellido2
- FechaNaci

Expediente
- NumExp (PK)
- FechaApertura
- TipoSangre
- IdPaciente (FK)
## Ejercicio 05 Office

```
CREATE DATABASE office;
GO

USE office;
GO

-- ===========CREAR LA TABLA DEPARTAMENT ===================
CREATE TABLE department (
    number INT,
    name_department VARCHAR(100) NOT NULL UNIQUE,
    manager VARCHAR(20) UNIQUE,
    start_dat DATE,
    CONSTRAINT pk_department
    PRIMARY KEY (number, name_department)
);
-- =================CREA LA TABLA DE EMPLOYEE ==============
CREATE TABLE employee (
    ssn VARCHAR(20) PRIMARY KEY,
    firsh_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_day DATE,
    salary DECIMAL(10, 2),
    sex CHAR(1),
    address_employee VARCHAR(255),
    boss VARCHAR(20),-- FOREIGN KEY recursiva
    number_department INT NOT NULL,
    name_department VARCHAR(100) NOT NULL,
    CONSTRAINT fk_employee_employeee
    FOREIGN KEY (boss) 
    REFERENCES employee(ssn),
    CONSTRAINT fk_employee_departament
    FOREIGN KEY (number_department, name_department) 
    REFERENCES department(number,name_department)
);

-- ============== ALTER DEPARTMENT PARA AGREGAR LA CLAVE FORANEA DEL MANAGER ================
ALTER TABLE department
ADD CONSTRAINT fk_department_manager 
FOREIGN KEY (manager) 
REFERENCES employee(ssn);

-- ============== CREAR TABLE DEPENDENT =====================
CREATE TABLE dependent_employee (
    name_dependent VARCHAR(100),
    snn VARCHAR(20) NOT NULL, 
    sex CHAR(1),
    relationship VARCHAR(50),
    birth_date DATE,
    CONSTRAINT pk_dependent_employee
    PRIMARY KEY (snn,name_dependent),
    CONSTRAINT fk_dependent_employee
    FOREIGN KEY (snn) 
    REFERENCES employee(ssn)
);

-- ========= CREAR TABAL DE PROJECT ========
CREATE TABLE project (
    name_project VARCHAR(100),
    number INT,
    location_project VARCHAR(100),
    number_department INT, -- FOREINGN KEY
    name_department VARCHAR(100) NOT NULL,
    CONSTRAINT pk_project
    PRIMARY KEY (name_project, number),
    CONSTRAINT fk_project_department
    FOREIGN KEY (number_department, name_department) 
    REFERENCES Department(number, name_department)
);

-- =========== CREAR TABLA DE LOCATION =====================
CREATE TABLE location_office (
    number_location INT,
    number_department INT,
    name_department VARCHAR(100) NOT NULL,
    location_office VARCHAR(100),
    CONSTRAINT pk_location_office
    PRIMARY KEY (number_location, number_department, name_department),
    CONSTRAINT fk_location_office_department
    FOREIGN KEY (number_department, name_department) 
    REFERENCES department(number,name_department)
);

-- ================= CREAR TABLA WORKS ON ======================
CREATE TABLE works_on (
    sn VARCHAR(20), -- FOREING KEY
    name_project VARCHAR(100),
    number_project INT,
    hours_work DECIMAL(5,2),
    CONSTRAINT pk_works_on
    PRIMARY KEY (sn, name_project, number_project, hours_work),
    CONSTRAINT fk_works_on_employee
    FOREIGN KEY (sn) 
    REFERENCES employee(ssn),
    CONSTRAINT fk_works_on_project
    FOREIGN KEY (name_project, number_project)
    REFERENCES project(name_project, number)
);
```
## Diagrama  

![Diagrama 8](/img/Construccion/05-Office.png)
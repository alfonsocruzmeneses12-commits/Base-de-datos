CREATE DATABASE ordenes;
GO

USE ordenes;
GO


CREATE TABLE orders(
	order_id INT NOT NULL
	CONSTRAINT pk_orders
	PRIMARY KEY (order_id),
	order_date DATE NOT NULL,
	requiere_date DATE,
);
GO

CREATE TABLE customer(
	customer_id INT NOT NULL
	CONSTRAINT pk_customer
	PRIMARY KEY (customer_id),
	company_name VARCHAR(30) NOT NULL,
	city VARCHAR(30) NOT NULL,
	region VARCHAR(20) NOT NULL,
);
GO

CREATE TABLE employee(
	employee_id INT NOT NULL
	CONSTRAINT pk_employee
	PRIMARY KEY (employee_id),
	CONSTRAINT uq_employee_id
	UNIQUE (employee_id),
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	address_emp VARCHAR(20) NOT NULL,
	report_to INT NOT NULL
	CONSTRAINT fk_employee_employee
	FOREIGN KEY (report_to)
	REFERENCES employee(employee_id)
);
GO

CREATE TABLE shipper(
	order_id_shipper INT NOT NULL
	CONSTRAINT pk_shipper
	PRIMARY KEY (order_id_shipper),
	company_name VARCHAR(40) NOT NULL,
);
GO

CREATE TABLE phone(
	number_id INT NOT NULL
	CONSTRAINT pk_phone
	PRIMARY KEY (number_id)
);
GO

ALTER TABLE shipper
ADD number_id INT NOT NULL
CONSTRAINT fk_shipper_phone
FOREIGN KEY (number_id)
REFERENCES phone(number_id)
GO

ALTER TABLE orders
ADD customer_id INT NOT NULL
CONSTRAINT fk_orders_customer_id
FOREIGN KEY (customer_id)
REFERENCES customer(customer_id),
employee_id INT NOT NULL
CONSTRAINT fk_orders_employee
FOREIGN KEY (employee_id)
REFERENCES employee(employee_id),
order_id_shipper INT NOT NULL
CONSTRAINT fk_orders_shipper
FOREIGN KEY(order_id_shipper)
REFERENCES shipper(order_id_shipper)
GO

CREATE TABLE entity(
	entity_id INT NOT NULL
	CONSTRAINT pk_entity
	PRIMARY KEY(entity_id),
	address_line VARCHAR(50),
	address_line_2 VARCHAR(20),
	add_id_entity INT NOT NULL
);
GO

CREATE TABLE product_table(
	product_id INT NOT NULL
	CONSTRAINT pk_producto_table
	PRIMARY KEY (product_id),
	product_name VARCHAR (30),
	unit_prices DECIMAL(10,2),
	units_in_stock INT
	CONSTRAINT df_units_in_stock
	DEFAULT (0),
);
GO

CREATE TABLE suplier(
	supplier_id INT NOT NULL
	CONSTRAINT pk_suplier
	PRIMARY KEY (supplier_id),
	company_name VARCHAR(50) NOT NULL,
	region VARCHAR(30) NOT NULL,
	city VARCHAR(30) NOT NULL,
	addrees_suplier VARCHAR(30) NOT NULL,
	contact VARCHAR(100),
	fax VARCHAR(30)
);
GO

CREATE TABLE  category(
	category_id INT NOT NULL
	CONSTRAINT pk_category
	PRIMARY KEY (category_id),
	category_name VARCHAR(100) NOT NULL,
	description_category TEXT
);
GO

ALTER TABLE product_table 
ADD category_id INT NOT NULL
CONSTRAINT fk_product_table_category
FOREIGN KEY (category_id)
REFERENCES category(category_id),
supplier_id INT NOT NULL
CONSTRAINT fk_product_table_suplier
FOREIGN KEY (supplier_id)
REFERENCES suplier(supplier_id)
GO

ALTER TABLE customer
ADD entity_id INT NOT NULL
CONSTRAINT fk_customer_entity
FOREIGN KEY (entity_id)
REFERENCES entity(entity_id)
GO

CREATE TABLE order_details(
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	unit_price DECIMAL(10,2) NOT NULL,
	quantity INT NOT NULL,
	discount DECIMAL(4,2)
	CONSTRAINT df_discount
	DEFAULT(0.0),
	CONSTRAINT pk_order_details
	PRIMARY KEY (order_id,product_id),
	CONSTRAINT fk_order_details_orders
	FOREIGN KEY (order_id)
	REFERENCES orders(order_id),
	CONSTRAINT fk_order_details_product_table
	FOREIGN KEY (product_id)
	REFERENCES product_table(product_id)
);
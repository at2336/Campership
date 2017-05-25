CREATE DATABASE campership;

\c campership;

CREATE TABLE scout (
	child_entry SERIAL PRIMARY KEY,
	first_name VARCHAR,
	last_name VARCHAR,
	borough VARCHAR,
	district VARCHAR,
	unit_type VARCHAR,
	unit_number INT,
	other_unit VARCHAR,
	birth_date DATE,
	address VARCHAR,
	phone VARCHAR
	);

CREATE TABLE parent (
	parent_entry SERIAL PRIMARY KEY,
	first_name VARCHAR,
	last_name VARCHAR,
	address VARCHAR,
	phone_number VARCHAR,
	email VARCHAR
	CONSTRAINT fk_parent_entry FOREIGN KEY (parent_entry) REFERENCES scout (child_entry)
	);

CREATE TABLE camp (
	camp_entry SERIAL PRIMARY KEY,
	num_week INT,
	cub_one VARCHAR NULL,
	cub_two VARCHAR NULL,
	cub_three VARCHAR NULL,
	cub_four VARCHAR NULL,
	cub_five VARCHAR NULL,
	cub_prov VARCHAR NULL,
	week_one_camp  VARCHAR NULL,
	week_one_specialty VARCHAR NULL,
	week_two_camp VARCHAR NULL,
	week_two_specialty VARCHAR NULL,
	week_three_camp VARCHAR NULL,
	week_three_specialty VARCHAR NULL,
	week_four_camp VARCHAR NULL,
	week_four_specialty VARCHAR NULL,
	CONSTRAINT fk_camp_entry FOREIGN KEY (camp_entry) REFERENCES scout (child_entry)
	);

CREATE TABLE finance (
	finance_entry SERIAL PRIMARY KEY,
	income INT,
	campership_requested INT,
	adults INT,
	youth INT,
	siblings_attending INT,
	CONSTRAINT fk_finance_entry FOREIGN KEY (finance_entry) REFERENCES scout (child_entry)
	);

CREATE TABLE staff_only (
	entry_number SERIAL PRIMARY KEY,
	receipt_number INT NULL,
	campership_granted INT NULL,
	granted_by VARCHAR NULL,
	granted_on DATE NULL,
	CONSTRAINT fk_entry_number FOREIGN KEY (entry_number) references scout (child_entry)
	);

CREATE TABLE users (
	username VARCHAR PRIMARY KEY,
	password VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	email VARCHAR,
	permission VARCHAR,
	CONSTRAINT fk_email FOREIGN KEY (email) references parent (email)
	);



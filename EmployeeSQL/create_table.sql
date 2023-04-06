DROP TABLE departments;
CREATE table departments (
	dept_no varchar(6) PRIMARY KEY not null,
	dept_name varchar(20)
-- 	FOREIGN KEY (dept_no) REFERENCES Persons(PersonID)
);

DROP TABLE dept_emp;
CREATE TABLE dept_emp(
	emp_no varchar(8) primary key not null,
	dept_no varchar(6)
);

DROP TABLE dept_manager;
CREATE TABLE dept_manager(
	dept_no varchar(6) primary key not null,
	emp_no varchar(8)
);

DROP TABLE employees;
CREATE TABLE employees(
	emp_no varchar(8) primary key not null,
	emp_title_id varchar(8),
	birthday_date varchar(12),
	first_name varchar(25),
	last_name varchar(25),
	sex varchar(3),
	hire_date varchar(20)
);

DROP TABLE salaries;
CREATE TABLE salaries(
	emp_no varchar(8) PRIMARY KEY not null,
	salary int,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

DROP TABLE titles;
CREATE TABLE titles(
	title_id varchar(8) PRIMARY KEY not null,
	title varchar(30)
);

-- SELECT * FROM salaries;

-------------------
-- Need to convert existing table employees hire_date column to str
-- ALTER TABLE employees ALTER COLUMN hire_date TYPE varchar(20);

-- Since the hire_date column format is in DD-MM-YYYY it is first imported as a string
-- To convert it to a date type, it must be formatted into YYYY-MM-DD
ALTER TABLE employees ALTER COLUMN hire_date TYPE DATE USING TO_DATE(hire_date, 'MM/DD/YYYY');
-- SELECT * FROM employees;


-- Experimented with this version of importing 
-- COPY salaries 
-- FROM 'C:\Users\Benjamin\Documents\Data Analytics Bootcamp U of T\sql-challenge\m9-starter-code\data\salaries.csv'
-- DELIMITER ','
-- CSV HEADER;

-- COPY employees 
-- FROM 'C:\Users\Benjamin\Documents\Data Analytics Bootcamp U of T\sql-challenge\m9-starter-code\data\employees.csv'
-- DELIMITER ','
-- CSV HEADER;
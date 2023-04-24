CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY NOT NULL,
	title VARCHAR NOT NULL
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR(3),
	hire_date DATE NOT NULL,
	CONSTRAINT fk_title_id
		FOREIGN KEY(emp_title_id)
			REFERENCES titles(title_id)
	
);


CREATE TABLE salaries (
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT,
	CONSTRAINT fk_emp_no
		FOREIGN KEY(emp_no)
			REFERENCES employees(emp_no)
);

CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY NOT NULL,
	dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY(emp_no,dept_no),
	CONSTRAINT fk_emp_no
		FOREIGN KEY(emp_no)
			REFERENCES employees(emp_no),
	CONSTRAINT fk_dept_no
		FOREIGN KEY(dept_no)
			REFERENCES departments(dept_no)
);


CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no,emp_no),
	CONSTRAINT fk_dept_no
		FOREIGN KEY(dept_no)
			REFERENCES departments(dept_no),
	CONSTRAINT fk_emp_no
		FOREIGN KEY(emp_no)
			REFERENCES employees(emp_no)
);


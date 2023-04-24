-- 1) pulling emp_no, last_name, first_name, sex, salary
SELECT employees.emp_no,last_name,first_name,sex,salary
FROM employees
LEFT JOIN salaries
	on employees.emp_no=salaries.emp_no
	
-- 2) first_name, last_name, hire_date in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT('Year' FROM hire_date) = 1986

-- 3) dept_no,dept_name,emp_no,last_name,first_name
SELECT departments.dept_no,departments.dept_name,dept_manager.emp_no,employees.last_name,employees.first_name
FROM departments
LEFT JOIN dept_manager
	on departments.dept_no=dept_manager.dept_no
LEFT JOIN employees
	on dept_manager.emp_no=employees.emp_no

-- 4) dept_no,emp_no,last_name,first_name,dept_name
SELECT dept_emp.dept_no,dept_emp.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp
LEFT JOIN employees as e
	on dept_emp.emp_no=e.emp_no
LEFT JOIN departments as d
	on dept_emp.dept_no=d.dept_no
	
-- 5) first_name,last_name, sex, where first_name=Hercules, last_name begins with a B
SELECT first_name, last_name, sex
FROM employees
where first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6) each employee in Sales, emp_no, last_name, first_name
SELECT d.emp_no, e.last_name,e.first_name
FROM dept_emp as d
LEFT JOIN employees as e
	on d.emp_no=e.emp_no
WHERE dept_no in (
	SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales'
)

-- 7) All employees in Sales and Development, emp_no, last_name, first_name, department
SELECT de.emp_no,d.dept_name,e.last_name,e.first_name
FROM dept_emp de
LEFT JOIN departments d
	ON de.dept_no=d.dept_no
LEFT JOIN employees e
	on de.emp_no=e.emp_no
WHERE de.dept_no in (
	SELECT d.dept_no
	FROM departments
	WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development'
)

-- 8) frequenty of employee last names in descending order
SELECT last_name, COUNT(last_name) AS Frequency
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
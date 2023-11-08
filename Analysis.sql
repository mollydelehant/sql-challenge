-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
INTO query11
FROM employees
	LEFT JOIN salaries
	ON salaries.emp_no = employees.emp_no
ORDER BY employees.emp_no
;
-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
INTO query12
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date
;
-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
-- Use abbreviations for tables this time
SELECT d.dept_no, d.dept_name, e.last_name, e.first_name
INTO query13
FROM departments as d
	JOIN dept_manager as dm
	ON d.dept_no = dm.dept_no
	JOIN employees as e
	ON dm.emp_no = e.emp_no
;
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
INTO query14
FROM dept_emp as de
	JOIN departments as d
	ON d.dept_no = de.dept_no
	JOIN employees as e
	ON e.emp_no = de.emp_no
;
-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
INTO query15
FROM employees as e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
;
-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT d.dept_name, e.last_name, e.first_name
INTO query16
FROM dept_emp as de
	JOIN employees as e
	ON de.emp_no = e.emp_no
	JOIN departments as d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
;
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
INTO query17
FROM dept_emp as de
	JOIN employees as e
	ON de.emp_no = e.emp_no
	JOIN departments as d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'
;
-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name,
COUNT(e.last_name) AS "frequency"
INTO query18
FROM employees as e
GROUP BY e.last_name
ORDER BY
COUNT(e.last_name) DESC
;
-- Display table results for query1
SELECT * FROM query11
;
-- Display table results for query2
SELECT * FROM query12
;
-- Display table results for query3
SELECT * FROM query13
;
-- Display table results for query4
SELECT * FROM query14
;
-- Display table results for query5
SELECT * FROM query15
;
-- Display table results for query6
SELECT * FROM query16
;
-- Display table results for query7
SELECT * FROM query17
;
-- Display table results for query8
SELECT * FROM query18
;
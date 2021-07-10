--Query 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

--Query 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--Query 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first -- name.

SELECT d.dept_no, d.dept_name, dmgr.emp_no, e.last_name, e.first_name
FROM departments as d
JOIN dept_manager AS dmgr ON d.dept_no = dmgr.dept_no
JOIN employees AS e ON dmgr.emp_no = e.emp_no;

--Query 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees As e
JOIN dept_emp AS demp ON e.emp_no = demp.emp_no
JOIN departments AS d ON d.dept_no = demp.dept_no
ORDER BY e.emp_no;

--Query 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--Query 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS demp ON demp.emp_no = e.emp_no
JOIN departments AS d ON demp.dept_no = d.dept_no 
WHERE d.dept_name = 'Sales';

--Query 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS demp ON demp.emp_no = e.emp_no
JOIN departments AS d ON demp.dept_no = d.dept_no 
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--Query 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;
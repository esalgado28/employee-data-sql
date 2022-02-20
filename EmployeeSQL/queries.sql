-- Employee details w/ salary
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- Employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- Department manager info
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
LEFT JOIN dept_manager ON
dept_manager.dept_no = departments.dept_no
LEFT JOIN employees ON
employees.emp_no = dept_manager.emp_no;

-- Employees w/ department
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no
LEFT JOIN departments ON
departments.dept_no = dept_emp.dept_no;

-- Employees named Hercules and last name beginning with B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Employees in Sales Department
SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no
LEFT JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

-- Employees in Sales and Development departments
SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no
LEFT JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- Frequencies of employee last names
SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY frequency DESC; 
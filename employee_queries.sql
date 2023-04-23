-- Finding employee number, last name, 
-- first name, sex, and salary of each employee

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
LEFT JOIN salaries AS sal
ON emp.emp_no = sal.emp_no
ORDER BY emp.emp_no;


-- Finding the first name, last name and 
-- hire dare for the employees hired in 1986

SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date >= '01-01-1986'
AND hire_date <= '12-31-1986';


-- Finding the manager of each department, 
-- their respective department name, employee number, 
-- last name and first name

SELECT deptman.dept_no, depts.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM employees AS emp
INNER JOIN dept_manager AS deptman
ON emp.emp_no = deptman.emp_no
INNER JOIN departments AS depts
ON deptman.dept_no = depts.dept_no
ORDER BY depts.dept_no;


-- Finding the deptartment number for employee with
-- their respective employee numer, last name, first name
-- and department number

SELECT emp.emp_no, emp.last_name, emp.first_name, depts.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS deptemp
ON emp.emp_no = deptemp.emp_no
INNER JOIN departments AS depts
ON deptemp.dept_no = depts.dept_no
ORDER BY depts.dept_no;


-- Finding the first name, last name and the sex of 
-- each employee whoes first name is Hercules and 
-- whose last name begins with the letter B

SELECT first_name, last_name FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name;


-- Finding each employee in the Sales department, including
-- their employee number, last name and first name

SELECT emp.emp_no, emp.last_name, emp.first_name
FROM employees AS emp
INNER JOIN dept_emp AS deptemp
ON emp.emp_no = deptemp.emp_no
INNER JOIN departments as depts
ON depts.dept_no = deptemp.dept_no
WHERE dept_name = 'Sales'
ORDER BY emp.emp_no;


-- Finding each employee in the Sales and Development 
-- departments, including their employee number, last name,
-- first name and department name

SELECT emp.emp_no, emp.last_name, emp.first_name, depts.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS deptemp
ON emp.emp_no = deptemp.emp_no
INNER JOIN departments AS depts
ON deptemp.dept_no = depts.dept_no
WHERE dept_name = 'Sales' or dept_name = 'Development'
ORDER BY emp.emp_no;


-- Finding frequency counts, in descending order, of all the 
-- employee's last names (how many share a last name)

SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
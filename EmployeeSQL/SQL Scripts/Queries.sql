--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employee.emp_no as "Employee Number", 
employee.last_name as "Last Name", 
employee.first_name as "First Name", 
employee.sex as "Gender",
salary.salary as "Salary"
FROM 
	employee 
LEFT JOIN  
	salary 
ON
	employee.emp_no = salary.emp_no
	
SELECT count(*) from employee;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
FROM employee
WHERE DATE_PART('year', hire_date)=1986

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT 
	emp.emp_no as "Employee Number", 
	emp.last_name as "Last Name", 
	emp.first_name as "First Name",
	dept.dept_no as "Department Number", 
	dept.dept_name as " Department Name"
FROM
	employee as emp
RIGHT JOIN
	departmentmanager as dept_mgr
ON
	dept_mgr.emp_no = emp.emp_no 
RIGHT JOIN
	department as dept
ON 
	dept_mgr.dept_no = dept.dept_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 
	emp.emp_no as "Employee Number", 
	emp.last_name as "Last Name", 
	emp.first_name as "First Name",
	dept.dept_name as " Department Name"
FROM
	employee as emp
LEFT JOIN
	departmentemployee 
ON
	emp.emp_no=departmentemployee.emp_no
LEFT JOIN
	department as dept
ON
	departmentemployee.dept_no=dept.dept_no 

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT
	first_name, last_name, sex
From
	employee
WHERE
	first_name= 'Hercules' AND last_name like ('B%')
	
--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
	emp.emp_no as "Employee Number", 
	emp.last_name as "Last Name", 
	emp.first_name as "First Name",
	dept.dept_name as " Department Name"
FROM
	employee as emp
Right JOIN
	departmentemployee 
ON
	emp.emp_no=departmentemployee.emp_no
Right JOIN
	department as dept
ON
	departmentemployee.dept_no=dept.dept_no 
AND
	dept.dept_name in ('Sales')
	
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	emp.emp_no as "Employee Number", 
	emp.last_name as "Last Name", 
	emp.first_name as "First Name",
	dept.dept_name as " Department Name"
FROM
	employee as emp
Right JOIN
	departmentemployee 
ON
	emp.emp_no=departmentemployee.emp_no
Right JOIN
	department as dept
ON
	departmentemployee.dept_no=dept.dept_no 
AND
	dept.dept_name in ('Sales','Development')


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, Count(last_name) as "Frequency"
FROM employee
GROUP BY last_name
ORDER BY Count(last_name) DESC;
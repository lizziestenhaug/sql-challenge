--Data Analysis

--List the following details of each employee: employee number, last name, first name, sex, and salary.

select employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
from employees
left join salaries
on employees.emp_no = salaries.emp_no
order by emp_no

--List first name, last name, and hire date for employees who were hired in 1986.

select employees.first_name,
employees.last_name,
employees.hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

select dept_managers.dept_no,
departments.dept_name,
dept_managers.emp_no,
employees.last_name,
employees.first_name
from dept_managers
left join departments
on dept_managers.dept_no = departments.dept_no
left join employees
on dept_managers.emp_no = employees.emp_no
order by emp_no

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees 
INNER JOIN dept_emb ON employees.emp_no=dept_emb.emp_no
INNER JOIN departments ON departments.dept_no=dept_emb.dept_no
order by emp_no;

--List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."
select employees.first_name,
employees.last_name,
employees.sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

SELECT dept_emb.emp_no,
employees.first_name,
employees.last_name,
departments.dept_name 
FROM dept_emb
INNER JOIN employees ON employees.emp_no=dept_emb.emp_no
INNER JOIN departments ON departments.dept_no=dept_emb.dept_no
WHERE departments.dept_name='Sales'
ORDER BY dept_emb.emp_no;

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT dept_emb.emp_no,
employees.first_name,
employees.last_name,
departments.dept_name 
FROM dept_emb
INNER JOIN employees ON employees.emp_no=dept_emb.emp_no
INNER JOIN departments ON departments.dept_no=dept_emb.dept_no
WHERE departments.dept_name='Sales'
or departments.dept_name='Development'
ORDER BY dept_emb.emp_no;

-- In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

select last_name, count(last_name) from employees
group by last_name
order by count(last_name)desc;


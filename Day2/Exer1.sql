#1. Query the employee's name, department number and annual salary, in descending order of annual salary and ascending order of name
SELECT
	last_name,department_id,salary * 12 * (1+ IFNULL(commission_pct, 0)) annualSalary
FROM
	employees
ORDER BY annualSalary DESC,last_name ASC;

#2. Select the name and salary of employees whose salary is not between 8000 and 17000, in descending order of salary
SELECT
	last_name,salary
FROM
	employees
WHERE salary NOT BETWEEN 8000 AND 17000

ORDER BY salary DESC;

#3. Query the employee information containing e in the mailbox, and first sort by the number of bytes in the mailbox in descending order, and then in ascending order by department number
SELECT
	*,LENGTH(email)
FROM
	employees
WHERE email LIKE '%e%'
ORDER BY LENGTH(email) DESC,department_id ASC;


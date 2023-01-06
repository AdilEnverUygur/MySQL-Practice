#1.Query the maximum, minimum, average, and sum of employee salaries for each job_id, and sort them in ascending order by job_id
SELECT MAX(salary),MIN(salary),AVG(salary),SUM(salary),job_id
FROM employees
GROUP BY job_id
ORDER BY job_id ASC;

#2.Query the gap between the maximum salary and the minimum salary of an employee (DIFFERENCE)
SELECT MAX(salary) - MIN(salary) DIFFERENCE
FROM employees;

#3.Query the minimum salary of the employees under each manager, the minimum salary cannot be lower than 6000, and the employees without managers are not counted
SELECT MIN(salary),manager_id
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) >= 6000;

#4.Query the number of all departments, the number of employees and the average salary, and sort by the average salary in descending order
SELECT department_id,COUNT(employee_id),AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY AVG(salary) DESC;

#5.Select the number of employees with each job_id
SELECT COUNT(*),job_id
FROM employees
GROUP BY job_id;

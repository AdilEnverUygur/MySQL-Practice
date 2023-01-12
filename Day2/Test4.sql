#1. Display all employees' names, department numbers and department names
SELECT last_name,d.department_id,department_name
FROM employees e,departments d
WHERE e.`department_id` = d.`department_id`;

#2. Query the job_id of employees in department number is 90 and the location_id in department number is 90
SELECT job_id,location_id
FROM employees e,departments d
WHERE e.`department_id` = d.`department_id`
AND e.`department_id`=90;

#3. Select all employees with bonuses last_name , department_name , location_id , city
SELECT last_name,department_name,l.location_id,city
FROM employees e,departments d,locations l
WHERE e.`department_id` = d.`department_id` 
AND d.`location_id` = l.`location_id`
AND commission_pct IS NOT NULL;

#4. Select last_name , job_id , department_id , department_name of employees who work in Toronto in city
SELECT last_name,job_id,d.`department_id`,city
FROM employees e,departments d,locations l
WHERE e.`department_id` = d.`department_id`
AND d.`location_id` = l.`location_id`
AND l.`city` = 'Toronto';

#5. Query the department name, job name and minimum salary of each type of work and each department
SELECT department_name,j.job_title,MIN(salary) minSa
FROM employees e,departments d,jobs j
WHERE e.`department_id` = d.`department_id`
AND e.`job_id` = j.`job_id`
GROUP BY department_name,job_title;

#6. Query the number of countries with departments greater than 2 in each country
SELECT country_id,COUNT(*) depC
FROM locations l,departments d
WHERE l.`location_id` = d.`location_id`
GROUP BY country_id
HAVING depC > 2

/*
 7. Select the specified employee's name, employee number, and his manager's name and employee number, and the result is similar to the following format
    employees Emp# manager   Mgr#
    kochhar   101   king     100  */
 SELECT e.last_name employees,e.employee_id "Emp#",m.last_name manager,m.employee_id "Mgr#"
 FROM employees e,employees m
 WHERE e.manager_id = m.employee_id
 AND e.last_name='kochhar';
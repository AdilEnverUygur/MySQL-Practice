#Level 5: Group query

/*
grammar:

SELECT Column,Group_function(column)
FROM table
WHERE filter condition
GROUP BY group_by_expression
ORDER BY column;

Features:
1. The field queried together with the grouping function must be the field that appears after group by
2. Filtering is divided into two categories: pre-group screening and post-group screening
Targeted table Location Keyword for join
Filter before grouping Original table before group by where

Filter the result set after group by after group by having

Question 1: Can the grouping function be used for filtering after where?
Answer: no

Question 2: where——group by——having

Generally speaking, if you can use pre-group screening, try to use pre-group screening to improve efficiency

3. Grouping can be done by a single field or by multiple fields
4. Can be used with sorting
*/

#Introduction: Query the number of employees in each department
SELECT AVG(salary) FROM employees;

#I. Simple grouping

#Case 1: Query the maximum salary of each type of work
SELECT MAX(salary),job_id
FROM employees
GROUP BY job_id;

#Case 2: Query the number of departments in each location
SELECT COUNT(*),location_id
FROM departments
GROUP BY location_id;

#II. Filtering before grouping can be achieved

#Case 1: Query the maximum salary of each department that contains a character in the mailbox
SELECT AVG(salary),department_id
FROM employees
WHERE email LIKE '%a%'
GROUP BY department_id;

#Case 2: Query the average salary of each leader's employees with bonuses
SELECT MAX(salary),manager_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY manager_id;

#Add filter criteria after grouping

#Case1: Query which department has the number of employees > 2

#①Query the number of employees in each department
SELECT COUNT(*),department_id
FROM employees
GROUP BY department_id;

#② Filter according to the results of ①, and check which department has more than 2 employees
SELECT COUNT(*),department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 2;

#Case 2: The highest salary of employees with bonuses for each type of work > 12000 type number and maximum salary

#① Query the maximum salary of employees with bonuses for each type of work

SELECT MAX(salary),job_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id;

#②Continue to filter according to the results of ①, the highest salary > 12000

SELECT MAX(salary),job_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id
HAVING MAX(salary) > 12000;

#Case 3: Query the leader number > 102 and the minimum salary of the employees under each leader whose leader number is greater than 5000 and the minimum salary

#① Query the fixed minimum salary of employees under each leader
SELECT MIN(salary),manager_id
FROM employees
GROUP BY manager_id;

#② Add filter condition: Number > 102
SELECT MIN(salary),manager_id
FROM employees
WHERE manager_id > 102
GROUP BY manager_id;

#③ Add filter condition: The minimum salary is greater than 5000
SELECT MIN(salary),manager_id
FROM employees
WHERE manager_id > 102
GROUP BY manager_id
HAVING MIN(salary) > 5000;

#group by expression or function

#Case: Group by the length of the employee's name, query the number of employees in each group, and filter the number of employees > 5

#① Query the number of employees of each length

SELECT COUNT(*),LENGTH(last_name) AS lan_name
FROM employees
GROUP BY lan_name;

#② Add Filtering condition
SELECT COUNT(*) AS c,LENGTH(last_name) AS lan_name
FROM employees
GROUP BY lan_name
HAVING c > 5;

#Group by multiple fields
#Case: Query the average salary of employees of each type of work in each department
SELECT AVG(salary),department_id,job_id
FROM employees
GROUP BY department_id,job_id;

#add sort
#Case: Query the average salary of employees of each type of work in each department, and display it according to the level of the average salary
SELECT AVG(salary) a,department_id,job_id
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id,job_id
HAVING a > 10000
ORDER BY a DESC;
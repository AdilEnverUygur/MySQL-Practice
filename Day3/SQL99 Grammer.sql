#2. sql99 syntax
/*
grammar:
select query list
from table 1 alias [connection type]
join table2 alias
on join condition
【where filter condition】
【group by grouping】
【having filter conditions】
【order by sort list】

Classification:
Inner connection (★): inner
outer join
Left outer (★): left 【outer】
Right outer (★): right 【outer】
All outside: full【outer】
Cross connection: cross
*/


#1) Inner join
/*
grammar:

SELECT query list
FROM table 1 alias
INNER JOIN table 2 alias
ON connection condition;

Classification:
equivalent
Non-equivalent
self-join

Features:
① Add sorting, grouping, filtering
② inner can be omitted
③ Filter conditions are placed after where, and connection conditions are placed after on to improve separation and facilitate reading
④ The inner join connection has the same effect as the equivalent connection in the sql92 syntax, and both query the intersection of multiple tables
*/

#1. Equivalent connection
#Case 1. Query employee name and department name
SELECT last_name,department_name
FROM employees e
INNER JOIN departments d
ON e.`department_id`=d.`department_id`;

#Case 2. Query the employee name and job type name containing e in the name (add filter)
SELECT last_name,job_title
FROM employees e
INNER JOIN jobs j
ON e.`job_id` = j.`job_id`
WHERE last_name LIKE '%e%';

#3. Query the city name and the number of departments with the number of departments > 3, (add group + filter)
#①Query the number of departments in each city
#② Filter the ones that meet the conditions on the results of ①
SELECT city,COUNT(*) AS cDep
FROM locations l
INNER JOIN departments d
ON l.`location_id` = d.`location_id`
GROUP BY city
HAVING cDep > 3;

#Case4. Query which department has the number of employees > 3 department names and the number of employees, and sort them in descending order (add sorting)
#①Query the number of employees in each department
#② Filter the records with the number of employees > 3 on the ① result, and sort
SELECT department_name depN,COUNT(*) cEmp
FROM employees e
INNER JOIN departments d
ON e.`department_id` = d.`department_id`
GROUP BY depN
HAVING cEmp > 3
ORDER BY cEmp DESC

#5. Query employee name, department name, job name, and descending order by department name (add three table connections)
SELECT last_name,department_name,job_title
FROM employees e
INNER JOIN departments d
ON e.`department_id` = d.`department_id`
INNER JOIN jobs j
ON e.`job_id` = j.`job_id`
ORDER BY department_name DESC;

#2) Non-equivalent connection
#Query the employee's salary level
SELECT salary,grade_level
FROM employees e
JOIN job_grades g
ON e.`salary` BETWEEN g.`lowest_sal` AND g.`highest_sal`;

#Query the number of salary levels > 20, and sort by salary level in descending order
SELECT COUNT(*),grade_level
FROM employees e
JOIN job_grades g
ON e.`salary` BETWEEN g.`lowest_sal` AND g.`highest_sal`
GROUP BY grade_level
HAVING COUNT(*) > 20
ORDER BY grade_level DESC;

#3) Self-join
#Query the name of the employee and the name of the manager
SELECT e.last_name,m.last_name
FROM employees e
JOIN employees m
ON e.`manager_id` = m.`employee_id`

#Query the name of the employee whose name contains the character k, the name of the superior
SELECT e.last_name,m.last_name
FROM employees e
JOIN employees m
ON e.`manager_id` = m.`employee_id`
WHERE e.`last_name` LIKE '%k%';


#2. Outer join
/*
  Application scenario: used to query records that exist in one table but not in another table
  Features:
  1. The query result of the outer connection is all the records in the main table
     If there is a match for it from the table, display the matching value
     Displays null if there is no match for it from the table
     Outer join query result = inner join result + records in the main table but not in the slave table
  2. Left outer join, the left side of left join is the main table
     Right outer join, the right join is the main table
  3. The order of the two tables can be exchanged between the left outer and right outer to achieve the same effect
  4. Full outer join = result of inner join + what is in table 1 but not in table 2 + what is in table 2 but not in table 1
  */

#Introduction: Query the boyfriend's female name that is not in the male list
SELECT * FROM beauty;
SELECT * FROM boys;

#Left outer join
SELECT b.name,bo.*
FROM beauty b
LEFT OUTER JOIN boys bo
ON b.`boyfriend_id` = bo.`id`
WHERE bo.`id` IS NULL;

#Case 1: Query which department has no employees
#Left outer
SELECT d.*,e.employee_id
FROM departments d
LEFT OUTER JOIN employees e
ON d.`department_id` = e.`department_id`
WHERE e.`employee_id` IS NULL;

#all outside

USE girls;
SELECT b.*,bo.*
FROM beauty b
FULL OUTER JOIN boys bo
ON b.`boyfriend_id` = bo.id;

# cross join
SELECT b.*,bo.*
FROM beauty b
CROSS JOIN boys bo;

#sql92 PK sql99
 /*
   Function: sql99 supports more
   Readability: sql99 realizes the separation of connection conditions and filter conditions, with high readability
 */

#Level 6: Connection query
/*
Meaning: Also known as multi-table query, when the queried fields come from multiple tables, join query will be used

Cartesian product phenomenon: Table 1 has m rows, Table 2 has n rows, result=m*n rows

Cause: No valid join condition
How to Avoid: Add Effective Join Conditions

Classification:

Classified by age:
   SQL92 standard: only supports inner joins
   SQL99 standard [recommended]: support inner join + outer join (left outer and right outer) + cross join

Classified by function:
Inner join:
   equijoin
   non-equivalence join
   self-join
Outer join:
   left outer join
   right outer join
   full outer join

cross connect
*/

SELECT * FROM beauty;

SELECT * FROM boys;

SELECT NAME,boyName FROM boys, beauty
WHERE beauty.boyfriend_id = boys.id;

#I.sql92 standard
#I. Equel Join
/*
① The result of multi-table equivalent connection is the intersection of multiple tables
② n table connection, at least n-1 connection conditions are required
③ The order of multiple tables is not required
④ It is generally necessary to alias the table
⑤ Can be used with all the clauses introduced earlier, such as sorting, grouping, filtering
*/

#Case 1:Query the female name and the corresponding male name
SELECT NAME,boyName FROM boys, beauty
WHERE beauty.boyfriend_id = boys.id;

#Case 2:Query employee name and corresponding department name
SELECT last_name,department_name
FROM employees,departments
WHERE employees.department_id = departments.department_id;

#2. Alias the table
/*
① Improve the conciseness of sentences
②Distinguish multiple fields with the same name
Note: If an alias is given to the table, the field to be queried cannot be qualified with the original table name
*/
#Query employee name, job number, job name
SELECT e.last_name,e.job_id,j.job_title
FROM employees e,jobs j
WHERE e.`job_id` = j.`job_id`;

#3. Can the order of the two tables be reversed?
#Query employee name, job number, job name
SELECT e.last_name,e.job_id,j.job_title
FROM jobs j,employees e
WHERE e.`job_id` = j.`job_id`;

#4. can add filter?
#Case 1: Query the employee name and department name with bonus
SELECT last_name,commission_pct,department_name
FROM employees e,departments d
WHERE e.`department_id` = d.`department_id`
AND e.`commission_pct` IS NOT NULL;

#Case 2: Query the department name and city name whose second character is o in the city name
SELECT department_name,city
FROM departments d,locations l
WHERE d.`location_id` = l.`location_id`
AND city LIKE '_o%';

#5. can add groups
#Case 1: Query the number of departments in each city
SELECT COUNT(*) countCity,city
FROM departments d,locations l
WHERE d.`location_id` = l.`location_id`
GROUP BY city;

#Case 2: Query the department name and department leader number of each department with bonuses and the minimum salary of the department
SELECT department_name,d.manager_id,commission_pct,MIN(salary)
FROM departments d,employees e
WHERE d.`department_id` = e.`department_id`
AND commission_pct IS NOT NULL
GROUP BY department_name,d.manager_id;

#6. can be sorted
#Case: Query the name of each type of work and the number of employees, and sort by the number of employees in descending order
SELECT job_title, COUNT(*)
FROM jobs j, employees e
WHERE j.`job_id` = e.`job_id`
GROUP BY job_title
ORDER BY COUNT(*) DESC;

#7. Can three tables be connected?
#Case: Query employee name, department name and city
SELECT last_name,department_name,city
FROM employees e, departments d, locations l
WHERE e.`department_id` = d.`department_id`
AND d.`location_id` = l.`location_id`
AND city LIKE 's%'

ORDER BY department_name DESC;


#2. Non-equivalent connection
#Case 1: Query the employee's salary and salary level
SELECT salary,grade_level
FROM employees e,job_grades g
WHERE salary BETWEEN g.`lowest_sal` AND g.`highest_sal`
AND g.`grade_level` = 'E';



/*
select salary,employee_id from employees;
select * from job_grades;
CREATE TABLE job_grades
(grade_level VARCHAR(3),
 lowest_sal  int,
 highest_sal int);

INSERT INTO job_grades
VALUES ('A', 1000, 2999);

INSERT INTO job_grades
VALUES ('B', 3000, 5999);

INSERT INTO job_grades
VALUES('C', 6000, 9999);

INSERT INTO job_grades
VALUES('D', 10000, 14999);

INSERT INTO job_grades
VALUES('E', 15000, 24999);

INSERT INTO job_grades
VALUES('F', 25000, 40000);

*/

#3. Self-connect
#Case: Query the name of the employee and the name of the manager
SELECT e.employee_id,e.last_name,m.employee_id,m.last_name
FROM employees e,employees m
WHERE e.`manager_id`=m.`employee_id`;



#Advanced 2: conditional query
 /*

grammar:
select
query list
from
		Table Name
where
filter criteria;

Classification:
1. Filter by conditional expression

Simple conditional operators: > < = != <> >= <=

2. Filter by logical expression
	Logical Operators:
Role: used to connect conditional expressions
		&& || !
		and or not

&& ， and: both conditions are true, the result is true, otherwise false
||or or: As long as one condition is true, the result is true, otherwise it is false
!or not: If the connection condition itself is false, the result is true, otherwise it is false

3. Fuzzy query
like
between and
in
is null

*/
#1. Filter by conditional expression
 #Case 1: Query employee information with salary > 12000
SELECT
	*
FROM
  employees
WHERE salary > 12000;

#Case 2: Query the employee name and department number whose department number is not equal to No. 90
SELECT
  first_name,
  department_id
FROM
  employees
WHERE department_id <> 90;

#二、按逻辑表达式筛选
 #Case 1: Query the name, salary and bonus of employees whose salary is between 10000 and 20000
SELECT
  last_name,
  salary,
  commission_pct
FROM
  employees
WHERE 
  salary >= 10000
AND 
  salary <= 20000;

#Case 2: Query the employee information whose department number is not between 90 and 110, or whose salary is higher than 15000
#method 1:
SELECT
  *
FROM
  employees
WHERE department_id < 90
OR department_id > 110
OR salary > 15000;
#method 2:
SELECT
  *
FROM
  employees
WHERE NOT (department_id >= 90 AND department_id <= 110)
OR salary > 15000;

#3. Fuzzy query
 /*
like

	
	
between and
in
is null|is not null

*/
#1. like
 /*
Features:
① Generally used with wildcards
wildcard:
% Any number of characters, including 0 characters
_ any single character
*,
*/
#Case 1: Query the employee information containing the character a in the employee name
SELECT
	*
FROM
	employees
WHERE 
	last_name LIKE '%a%';

#Case 2: Query employee names and wages whose third character is n and fifth character is l
SELECT
	last_name,
	salary
FROM
	employees
WHERE 
	last_name LIKE '__n_l%';

#Case 3: Query the employee name whose second character is _
#method 1:
SELECT
	last_name
FROM
	employees
WHERE 
	last_name LIKE '_\_%';
#method 2:
SELECT
	last_name
FROM
	employees
WHERE 
	last_name LIKE '_$_%' ESCAPE '$';
#2.between and
 /*
①Using between and can improve the conciseness of the statement
②Include critical value
③ Do not exchange the order of the two critical values

*/
#Case 4: Query employee information with employee number between 100 and 120
SELECT
	*
FROM
	employees
WHERE
	employee_id >= 120 AND employee_id<=100;
#-----------------------------------------------
SELECT
	*
FROM
	employees
WHERE 
	employee_id BETWEEN 100 AND 120;
	
#3.in
/*
Meaning: Determine whether the value of a field belongs to an item in the in list
Features:
① Use in to improve the conciseness of the statement
②The value types of the in list must be consistent or compatible
③Wildcards are not supported in the in list
*/

#Case: Query employee's work type number is an employee name and work type number in IT_PROG, AD_VP, AD_PRES
SELECT
	last_name,
	job_id
FROM
	employees
WHERE
	job_id = 'IT_PROG' OR job_id = 'AD_VP' OR JOB_ID ='AD_PRES';
#-------------------------------------------------------------------
SELECT
	last_name,
	job_id
FROM
	employees
WHERE   
	job_id IN('IT_PROG','AD_VP','AD_PRES');

#4、is null
 /*
= or <> cannot be used to judge null values
is null or is not null can judge null value
*/
#Case 1: Query the employee name and bonus rate without bonus
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE 
	commission_pct IS NULL;

#Case 2: Query the name and bonus rate of employees with bonuses
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE 
	commission_pct IS NOT NULL;

#safe equals <=>

#Case 1: Query the employee name and bonus rate without bonus
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE 
	commission_pct <=> NULL;
	
#Case 2: Query employee information with a salary of 12000
SELECT
	last_name,
	salary
FROM
	employees
WHERE 
	salary <=> 12000;

#is null pk <=>
/*
IS NULL: Only NULL values can be judged, and the readability is high. It is recommended to use

<=> : It can judge both NULL values and ordinary values, and the readability is low
*/


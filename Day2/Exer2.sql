#1. Display system time (note: date + time)
SELECT NOW();

#2. Query the employee number, name, salary, and the result after the salary is increased by 20% (new salary)
SELECT employee_id,last_name,salary,salary * 1.2 AS newSalary
FROM employees;

#3. Sort the names of the employees by the first letter, and write the length of the name (length)
SELECT LENGTH(last_name) AS lnLengh,SUBSTR(last_name,1,1) AS lnSubstr,last_name
FROM employees ORDER BY lnSubstr;

#4.Doing a query that yields the following results
/*
<last_name> earns <salary> monthly but wants <salary*3>
Dream Salary
King earns 24000 monthly but wants 72000
*/
SELECT CONCAT(last_name,' earns ',salary,' monthly but wants ',salary*3) AS 'Dream Salary'
FROM employees
WHERE salary = 24000;

#5.Use case-when, according to the following conditions:
/*
job grade
AD_PRES 	A
ST_MAN 		B
IT_PROG 	C
SA_REP 		D
ST_CLERK 	E

produces the following result:
Last_name: King
Jod_id:    AD_PRES
Grade:	   A
*/
SELECT job_id AS job,
CASE job_id
WHEN 'AD_PRES' THEN 'A'
WHEN 'ST_MAN' THEN 'B'
WHEN 'IT_PROG' THEN 'C'
WHEN 'SA_REP' THEN 'D'
WHEN 'ST_CLERK' THEN 'E'
END AS Grade
FROM employees
WHERE job_id = 'AD_PRES';
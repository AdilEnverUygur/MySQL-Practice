#Leve 3: Sort query
/*
grammar:
SELECT query list
FROM table name
【WHERE filter condition】
ORDER BY sorted field or expression;


Features:
1. ASC represents ascending order and can be omitted
   DESC represents descending order

2. The order by clause can support single field, alias, expression, function, multiple fields

3. The order by clause is at the end of the query statement, except for the limit clause

*/

#1, sort by a single field
#Case 1: Query employee information and require wages to be sorted from high to low
SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY salary ASC;

#2. Add filter conditions and sort
#Case 2: Query Department Number> = 90 Employee Information, follow the hire date
SELECT
	*
FROM
	employees
WHERE 
	department_id >= 90
ORDER BY hiredate ASC;

#3. Sort by expression
#Case 3: Query employee information is promoted by annual salary
SELECT
	*,salary * 12 * (1 + IFNULL(commission_pct, 0)) AS annualSalary
FROM
	employees
ORDER BY salary * 12 * (1 + IFNULL(commission_pct, 0)) DESC;

#4.Sort by aliases
#Case 4: Query employee information is promoted by annual salary
SELECT
	*,salary * 12 * (1 + IFNULL(commission_pct, 0)) AS annualSalary
FROM
	employees
ORDER BY annualSalary DESC;

#5. Sort by function
#Case 5: Show the name and salary of the employee according to the length of the name
SELECT
	last_name,salary,LENGTH(last_name) AS letterLength
FROM
	employees
ORDER BY LENGTH(last_name) DESC;

#6. Sort by multiple fields
#Case 6:Query employee information, require the order of salary first, and then press the order of Employee_id
SELECT * FROM employees ORDER BY salary ASC,employee_id DESC;


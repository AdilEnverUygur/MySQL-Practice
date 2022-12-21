#1. Whether the following statement can be executed successfully
SELECT last_name , job_id , salary AS sal
FROM employees; 

#2. Whether the following statement can be executed successfully
SELECT  *  FROM employees; 

#3.找出下面语句中的错误 
SELECT employee_id , last_name,
salary * 12 AS "ANNUAL  SALARY"
FROM employees;

#4. Display the structure of the table departments and query all the data in it
DESC departments;
SELECT
  *
FROM
  departments;

#5. Display all job_id in the table employees (cannot be repeated)
SELECT 
	DISTINCT job_id 
FROM 
	employees;

#6. Display all the columns of the table employees, each column is connected with a comma, and the column header is displayed as OUT_PUT
SELECT
  IFNULL(commission_pct, 0) AS commissionRate,
  commission_pct
FROM
  employees;

SELECT 
	CONCAT(`first_name`,',',`last_name`,',',`job_id`,',',IFNULL(commission_pct,0)) AS out_put
FROM
	employees;



#II.grouping function
/*
Function: used for statistics, also known as aggregation function or statistical function or group function

Classification:
sum summation, avg average value, max maximum value, min minimum value, count calculation number

Features:
1. SUM and AVG are generally used to process numeric values
    MAX, MIN, COUNT can handle any type
2. The above grouping functions ignore null values

3. It can be combined with DISTINCT to realize deduplication operation

4. A separate introduction to the count function
Generally use count(*) for counting the number of rows

5. The fields queried together with the grouping function are required to be the fields after group by
*/

#1. Easy to use
SELECT SUM(salary) FROM employees;
SELECT AVG(salary) FROM employees;
SELECT MIN(salary) FROM employees;
SELECT MAX(salary) FROM employees;
SELECT COUNT(salary) FROM employees;

SELECT SUM(salary),AVG(salary),MAX(salary),MIN(salary),COUNT(salary)
FROM employees;

SELECT SUM(salary) Toplam,ROUND(AVG(salary),2) Otturiche,MAX(salary) Yuqiri,MIN(salary) Towen,COUNT(salary) Sani
FROM employees;

#2. What types of parameters are supported
SELECT SUM(last_name),AVG(last_name) FROM employees;
SELECT SUM(hiredate),AVG(hiredate) FROM employees;

SELECT MAX(last_name),MIN(last_name) FROM employees;

SELECT MAX(hiredate),MIN(hiredate) FROM employees;

SELECT COUNT(commission_pct) FROM employees;
SELECT COUNT(last_name) FROM employees;

#3. whether to ignore null
SELECT SUM(commission_pct),AVG(commission_pct),SUM(commission_pct)/35,SUM(commission_pct)/107
FROM employees;

SELECT MAX(commission_pct),MIN(commission_pct) FROM employees;

SELECT commission_pct FROM employees;

#4. match with DISTINCT
SELECT SUM(DISTINCT salary),SUM(salary)
FROM employees;

SELECT COUNT(DISTINCT salary),COUNT(salary) FROM employees;

#5. Detailed introduction of the COUNT function
SELECT COUNT(salary) FROM employees;

SELECT COUNT(*) FROM employees;

SELECT COUNT(1) FROM employees;

#efficiency:
/*
Under the MYISAM storage engine, the efficiency of COUNT(*) is high
Under the INNODB storage engine, the efficiency of COUNT(*) and COUNT(1) is similar, higher than that of COUNT(field)
*/

#6. There are restrictions on the fields queried together with the grouping function
SELECT AVG(salary),employee_id FROM employees;

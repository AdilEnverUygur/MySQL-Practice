#Test

#1.Query the maximum, minimum, average, and sum of the company's employee salaries
SELECT MAX(salary) max_sal,MIN(salary) mi_sal,ROUND(AVG(salary),2) av_sal,SUM(salary) sm_sal
FROM employees;


#2.Query the difference in days between the maximum entry time and the minimum entry time in the employee table (DIFFRENCE)
SELECT DATEDIFF(MAX(hiredate),MIN(hiredate)) DIFFERENCE
FROM employees;

#3.Query the number of employees whose department number is 90
SELECT COUNT(*) numberOf
FROM employees
WHERE department_id = 90;
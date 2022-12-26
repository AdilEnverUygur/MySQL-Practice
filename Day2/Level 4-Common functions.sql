#Level 4:Common functions
/*
Concept: Similar to java methods, a set of logical statements is encapsulated in the method body, and the method name is exposed to the outside world
Benefits: 1. Hiding implementation details 2. Improve code reusability
Call: select functionName (actual parameter list) [from table];

Features:
①What is it called (function name)
②What to do (function function)

Classification:
1. One-line function
Such as concat, length, ifnull, etc.
2. Grouping function

Function: Used for statistics, also known as statistical functions, aggregate functions, group functions
Common functions:
1. One-line function
Character functions:
length: Get the number of bytes (a Chinese character in utf-8 represents 3 bytes, and gbk is 2 bytes)
concat
substr
instr
trim
upper
lower
lpad
rpad
replace

Mathematical functions:
round
the ceil
floor
truncate
mod

Date function:
now
curdate
curtime
year
month
month name
the day
hours
minutes
second
str_to_date
date_format
Other functions:
version
database
user
control function
if
case

*/

#I. Character function
#1.length: Get the number of bytes of the parameter value
SELECT LENGTH('john');
SELECT LENGTH('阿迪Adil');

SHOW VARIABLES LIKE '%char%';

#2. concat splicing string
SELECT CONCAT(last_name,'-',first_name) AS full_name FROM employees;

#3.upper and lower
SELECT UPPER('john');
SELECT LOWER('jOhN');
#Example: Change the last name to uppercase, the first name to lowercase, and then splicing
SELECT CONCAT(UPPER(last_name),'-',LOWER(first_name)) AS full_name FROM employees;

#4. substr, substring
#Note: Indexes start at 1
#Intercept all characters after the specified index
SELECT SUBSTR('Adil is wrting',5) out_put;

#Intercept the characters of the specified character length from the specified index
SELECT SUBSTR('Adil is wrting',1,4) out_put;

#Case: The first letter of the name is capitalized, the other letters are lowercase and then spliced with _ to display
 SELECT
	CONCAT(UPPER(SUBSTR(last_name, 1, 1)),'_',LOWER(SUBSTR(last_name, 2)))
FROM
	employees;

#5.instr: Returns the index of the first occurrence of the substring, or 0 if not found
SELECT INSTR('Adil is learning Spring','Spring') AS out_put;

#6.trim
SELECT LENGTH(TRIM('	Adil	')) AS out_put;

SELECT TRIM('a' FROM 'aaaaaaaaa阿aaaaaaaaaaaa迪aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')  AS out_put;

#7.lpad: Use the specified character to achieve left padding to the specified length
SELECT LPAD('Adil',10,'*') AS out_put;
# cut off from left
SELECT LPAD('Adil',2,'*') AS out_put;

#8.rpad: uses the specified character to realize the right padding to the specified length
SELECT RPAD('Adil',12,'ab') AS out_put;

#9.replace
SELECT REPLACE('Adil is learning Java','Java','JavaScript');

#============================================================

#II.Mathematical functions

#1. round
SELECT ROUND(1.65);
SELECT ROUND(1.567,2);

#2. ceil: rounded up: return>=Minimum integer for this parameter
SELECT CEIL(1.52);

#3. floor: rounded down: return<=The largest integer for this parameter
SELECT FLOOR(-9.99);

#4. truncate: cut off
SELECT TRUNCATE(1.65,1);

#5. mod: Take the remainder
/*
mod(a,b) ：  a-a/b*b
mod(-10,-3):-10- (-10)/(-3)*（-3）=-1
*/
SELECT MOD(10,3);
SELECT 10 % 3;

#===================================================

#III. Date function

#1. now: Return the current system date + time
SELECT NOW();

#2. curdate: Returns the current system date, without time
SELECT CURDATE();

#3. curtime: Returns the current time, without the date
SELECT CURTIME();

#You can get the specified part, year, month, day, hour, minute, second
SELECT YEAR(NOW());
SELECT YEAR('1998-1-1');

SELECT YEAR(hiredate) FROM employees;

SELECT MONTH(NOW());
SELECT MONTHNAME(NOW());

#4. str_to_date: Convert characters to dates in the specified format
SELECT STR_TO_DATE('1998-3-2','%Y-%c-%d') AS out_put;

#case: #Query the employee information whose entry date is 1992--4-3
SELECT * FROM employees WHERE hiredate = '1992-4-3';
SELECT * FROM employees WHERE hiredate =STR_TO_DATE('4-3 1992','%c-%d %Y');

#5. data_format: convert date to character
SELECT DATE_FORMAT(NOW(),'%y.Yil %m.ay %d.gun') AS out_put;

#case: #Query the name and entry date of employees with bonuses (xx month/xx day xx year)
SELECT last_name,DATE_FORMAT(hiredate,'%m-ayning/%d-kuni %y-yili')
FROM employees
WHERE commission_pct IS NOT NULL;

#IV. other functions
SELECT VERSION();
SELECT DATABASE();
SELECT USER();

#V. flow control function
#1. if function: if else 
SELECT IF(10 > 5,'Big','small');
SELECT last_name,commission_pct,IF(commission_pct IS NULL,'Not OK','OK') 
FROM employees;

#2. Use of case function 1: The effect of switch case
/*
java
switch(variable or expression){
case constant 1: statement 1;break;
...
default: statement n;break;


}

mysql

case The field or expression to be judged
when constant 1 then value 1 or statement 1 to be displayed;
when constant 2 then value 2 or statement 2 to be displayed;
...
else value n or statement n to display;
end
*/

/*Case: Query the employee's salary, request

Department number = 30, the displayed salary is 1.1 times
Department number = 40, the displayed salary is 1.2 times
Department number = 50, the displayed salary is 1.3 times
For other departments, the displayed salary is the original salary

*/
SELECT salary oldSalary,department_id,
CASE department_id
WHEN 30 THEN salary*1.1
WHEN 40 THEN salary*1.2
WHEN 50 THEN salary*1.3
ELSE salary
END AS newSalary
FROM employees;

#3. The use of case function 2: similar to multiple if
/*
java:
if(condition 1){
Statement 1;
}else if(condition 2){
Statement 2;
}
...
else {
statement n;
}

mysql:

case
when condition 1 then value 1 or statement 1 to be displayed
when condition 2 then value 2 or statement 2 to be displayed
. . .
else value n or statement n to display
end
*/

#Case: Query the employee's salary
/*
If salary>20000, display A level
If salary>15000, display B level
If salary > 10000, display C level
Otherwise, display D level
*/

SELECT salary,
CASE 
WHEN salary > 20000 THEN 'A'
WHEN salary > 15000 THEN 'B'
WHEN salary > 10000 THEN 'C'
ELSE 'D'
END AS salaryLevel
FROM employees;

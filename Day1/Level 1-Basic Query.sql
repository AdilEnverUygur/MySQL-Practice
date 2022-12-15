#Advanced 1: basic query
/*
Grammer:
SELECT queryList FROM tableName;

Similar to: System.out.println(print something);

features:

1. The query list can be: fields in the table, constant values, expressions, functions
2. The result of the query is a virtual table
*/

USE myemployees;

#1. Query a single field in the table
SELECT last_name FROM employees;

#2. Query multiple fields in the table
SELECT last_name,salary,email FROM employees;

#3. Query all fields in the table
#method 1:
SELECT 
    `employee_id`,
    `first_name`,
    `last_name`,
    `phone_number`,
    `last_name`,
    `job_id`,
    `phone_number`,
    `job_id`,
    `salary`,
    `commission_pct`,
    `manager_id`,
    `department_id`,
    `hiredate` 
FROM
    employees ;
    
  #method 2:
  SELECT * FROM employees;
  
  #4. Query constant value
  SELECT 100;
  SELECT 'john';
  
  #5. Query expressions
  SELECT 100%98;
  
  #6. Query function
  SELECT VERSION();
  
  #7. Alias
  /*
  ① Easy to understand
  ② If the field to be queried has the same name, use an alias to distinguish it
 
  */
  #method 1: use as
  SELECT 100%98 AS result;
  SELECT last_name AS lastName, first_name AS firstName FROM employees;
  
  #method 2: use spaces
  SELECT last_name lastName,first_name firstName FROM employees;
  
  #Case: Query salary, the display result is out put
  SELECT salary AS "out put" FROM employees;
 
  #8.return different values
  #Case: Query all department numbers involved in the employee table
  SELECT DISTINCT department_id FROM employees;
  
  #9. The role of the + sign
  /*

 The + sign in java:
 ① operator, both operands are numeric
 ② Connector, as long as one operand is a string

 The + sign in mysql:
 There is only one function: the operator

 select 100+90; If both operands are numeric, then add operation
 select '123'+90; As long as one of them is a character type, try to convert the character value into a numeric value
 If the conversion is successful, continue to do the addition operation
 select 'john'+90; If the conversion fails, convert the character value to 0

 select null+10; As long as one of them is null, the result must be null

 */
 #Case: query employee name and surname are connected into one field and displayed as name
 
 #Correct
 SELECT 
       CONCAT(last_name,first_name) AS result 
 FROM 
       employees;
       
 
 
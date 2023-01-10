 #1. Display the maximum salary of the employee table,the average salary in the employee table
 SELECT MAX(salary),AVG(salary)
 FROM employees;
 
 #2. Query the employee_id, job_id, and last_name of the employee table in descending order of department_id and ascending order of salary
 SELECT employee_id,job_id,last_name
 FROM employees
 ORDER BY department_id DESC, salary ASC;
 
 #3. Query that the job_id of the employee table contains a and e, and a is in front of e
 SELECT job_id
 FROM employees
 WHERE job_id LIKE '%a%e%'

/*4.Known table student, which contains id (student number), name, gradeId (grade number)
    Known table grade, which contains id (grade number), name (grade name)
    Known table result, which contains id, score, studentNo (student number)
    Ask for name, grade name, grades?
 */
  SELECT s.name,g.name,score
  FROM student s,grade g,result r
  WHERE s.id=r.studentNo
  AND g.id=s.gradeId;
 
 #5.Display the current date, remove the leading and trailing spaces, and load the substring function
 SELECT NOW();
 SELECT TRIM(字符 FROM '');
 SELECT SUBSTR(str,startIndex);
 SELECT SUBSTR(str,startIndex,LENGTH);

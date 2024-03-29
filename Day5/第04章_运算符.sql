# 第04章_运算符
#1. 算数运算符: + - * / div % mod

SELECT 100, 100 + 0, 100 - 0, 100 + 50 * 30, 100 + 35.5, 100 - 35.5
FROM DUAL;

# 在SQL中, + 没有连接的作用, 就表示加法运算. 此时, 会将字符串转换为数值(隐式转换)
SELECT 100 + '1'  # 在Java语言中, 结果是: 1001 
FROM DUAL;

SELECT 100 + 'a'  # 此时将'a'看做0处理
FROM DUAL;

SELECT 100 + NULL  # null值参与运算, 结果为null
FROM DUAL;

SELECT 100, 100 * 1, 100 * 1.0, 100 / 1.0, 100 / 2,
100 + 2 * 5 / 2, 100 / 3, 100 DIV 0  # 分母如果为0, 则结果为null
FROM DUAL;

# 取模运算: % mod
SELECT 12 % 3, 12 % 5, 12 MOD -5, -12 % 5, -12 % -5
FROM DUAL;

#练习: 查询员工id为偶数的员工信息 
SELECT employee_id, last_name, salary 
FROM employees
WHERE employee_id % 2 = 0;

#2. 比较运算符 
#2.1  =  <=>  !=  <  <=  >  >=

# = 的使用
SELECT 1 = 2,1 != 2,1 = '1',1 = 'a',0 = 'a'  #字符串存在隐式转换. 如果转换数值不成功, 则看作0
FROM DUAL;

SELECT 'a' = 'a','ab' = 'ab','a' = 'b'  #两边都是字符串的话, 则按照ANSI的比较规则进行比较
FROM DUAL;

SELECT 1 = NULL,NULL = NULL # 只要有null参与判断, 结果为null
FROM DUAL;

SELECT last_name,salary,commission_pct
FROM employees
         #WHERE salary = 6000;
WHERE commission_pct = NULL;  #此时执行, 不会有任何的结果

# <=> 安全等于 . 记忆技巧: 为NULL而生.

SELECT 1 <=> 2,1 <=> '1',1 <=> 'a',0 <=> 'a'
FROM DUAL;

SELECT 1 <=> NULL, NULL <=> NULL
FROM DUAL;

#练习: 查询表中commission_pct为NULL的数据有哪些
SELECT last_name,salary,commission_pct
FROM employees
WHERE commission_pct <=> NULL;

SELECT 3 <> 2,'4' <> NULL,'' != NULL,NULL != NULL
FROM DUAL;

#2.2
#(1).  IS NULL / IS NOT NULL / ISNULL()
#练习: 查询表中commission_pct为NULL的数据有哪些
SELECT last_name,salary,commission_pct
FROM employees
WHERE commission_pct IS NULL;
#或
SELECT last_name,salary,commission_pct
FROM employees
WHERE ISNULL(commission_pct);

#练习: 查询表中commission_pct不为NULL的数据有哪些
SELECT last_name,salary,commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;
#或
SELECT last_name,salary,commission_pct
FROM employees
WHERE NOT commission_pct <=> NULL;

#(2).  LEAST() / GREATEST
SELECT LEAST('g','b','t','m'),GREATEST('g','b','t','m')
FROM DUAL;

SELECT LEAST(first_name,last_name),LEAST(LENGTH(first_name),LENGTH(last_name))
FROM employees;

#(3).  BETWEEN 条件下界1 AND 条件上界2 (查询条件1和条件2范围内的数据,包含边界)
#查询工资在6000 到 8000的员工信息
SELECT employee_id,last_name,salary
FROM employees
WHERE salary BETWEEN 6000 AND 8000;
# WHERE salary >= 6000 && salary <= 8000;

#交换6000 和 8000之后, 查询不到数据
SELECT employee_id,last_name,salary
FROM employees
WHERE salary BETWEEN 8000 AND 6000;

#查询工资不在6000 到 8000的员工信息
SELECT employee_id,last_name,salary
FROM employees
WHERE salary NOT BETWEEN 6000 AND 8000;
#WHERE salary < 6000 OR salary > 8000;

#(4).  IN() / NOT IN()
#练习: 查询部门为10,20,30部门的员工信息
SELECT last_name,salary,department_id
FROM employees
#WHERE department_id = 10 OR department_id = 20 OR department_id = 30;
WHERE department_id IN(10,20,30);

#练习: 查询工资不是6000,7000,8000的员工信息
SELECT employee_id,last_name,salary
FROM employees
WHERE salary NOT IN(6000,7000,8000);

#(5).  LIKE : 模糊查询
#练习: 查询last_name中包含字符'a'的员工信息

# % : 代表不确定个数的字符  (0个,1个,或多个)
SELECT employee_id,last_name,department_id
FROM employees
WHERE last_name LIKE '%a%';

#练习: 查询last_name中以字符'a'开头的员工信息
SELECT employee_id,last_name,department_id
FROM employees
WHERE last_name LIKE 'a%';

#练习: 查询last_name中包含字符'a'且包含字符'e'的员工信息
#写法2:
SELECT employee_id,last_name,department_id
FROM employees
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%';
#写法2:
SELECT employee_id,last_name,department_id
FROM employees
WHERE last_name LIKE '%a%e%' OR last_name LIKE '%e%a%';


# _ : 代表一个不确定的字符
#练习: 查询第2个字符是'a'的员工信息
SELECT employee_id,last_name,department_id
FROM employees
WHERE last_name LIKE '_a%';

#练习: 查询第2个字符是_且第三个字符是'a'的员工信息
#需要使用转义字符 : \
SELECT employee_id,last_name,department_id
FROM employees
WHERE last_name LIKE '_\_a%';

# 或者 (了解)
SELECT employee_id,last_name,department_id
FROM employees
WHERE last_name LIKE '_$_a%' ESCAPE '$';


#(6).  REGEXP / RLIKE : 正则表达式
# ^s: 是否为s开头的意思.  t$: 是否为t结尾的.  'hk': 是否包含hk字符
SELECT 'shkstart' REGEXP '^s', 'shkstart' REGEXP 't$', 'shkstart' REGEXP 'hk'
FROM DUAL;

#[ab]: 里面包含a或者b即可
SELECT 'atguigu' REGEXP 'gu.gu','atguigu' REGEXP '[ab]'
FROM DUAL;

#3. 逻辑运算符(Logical Operators): OR || AND && NOT ! XOR

# OR AND
SELECT last_name,salary,department_id
FROM employees
         #WHERE department_id = 10 OR department_id = 20;
#WHERE department_id = 10 AND department_id = 20;
WHERE department_id = 50 AND salary > 6000;

# NOT
SELECT last_name,salary,department_id
FROM employees
         #WHERE salary NOT BETWEEN 6000 AND 8000;
#WHERE commission_pct IS NOT NULL;
WHERE NOT commission_pct <=> NULL;

# XOR (异或): 追求的'异' 满足一个条件时不满足另外一个条件
SELECT last_name,salary,department_id
FROM employees
WHERE department_id = 50 XOR salary > 6000;

#注意: AND的优先级高于OR


#4. 位运算符 (Bitwise operators): &	 |	 ^	 ~	 >>	 <<

SELECT 12 & 5, 12 | 5, 12 ^ 5
FROM DUAL;

#按位取反运算符: 按位取反(~)运算符将给定的二进制数逐位进行取反操作, 即将1变为0, 将0变为1;
SELECT 10 & ~1
FROM DUAL;

#左移和右移 >> <<
SELECT 4 << 1, 8 >> 1
FROM DUAL;
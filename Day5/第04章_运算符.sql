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

SELECT 1 = 2,1 != 2,1 = '1',1 = 'a',0 = 'a'  #字符串存在隐式转换. 如果转换数值不成功, 则看作0
FROM DUAL;

SELECT 'a' = 'a','ab' = 'ab','a' = 'b'  #两边都是字符串的话, 则按照ANSI的比较规则进行比较
FROM DUAL;

SELECT 1 = NULL,NULL = NULL # 只要有null参与判断, 结果为null
FROM DUAL;

SELECT first_name FROM employees;

SELECT
    first_name, last_name
FROM employees
WHERE LOWER (first_name) = 'david';

--실습 문제

SELECT
    LENGTH(first_name)
FROM employees;

--2

SELECT
CONCAT(first_name, last_name)
FROM employees;

--3

SELECT
    RPAD(SUBSTR(first_name, 1,3), LENGTH(first_name), '*') AS name,
    LPAD(salary, 10, '*') AS salary
FROM employees
WHERE LOWER (job_id) = 'it_prog';


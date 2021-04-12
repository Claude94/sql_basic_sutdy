-- 실습1

SELECT
    first_name, last_name, salary
FROM employees;

-- 2

SELECT
    department_id, department_name, manager_id, location_id
FROM departments;

-- 3

SELECT
    first_name AS "이름",
    salary AS "급여"
FROM employees;

-- 4

SELECT
    first_name || last_name || '의 급여는 $'|| salary AS "사원정보"
FROM employees;

-- 5

SELECT DISTINCT
    department_id
FROM departments;

--실습2

SELECT
    first_name, job_id, department_id
FROM employees
WHERE job_id = 'IT_PROG';

-- 2

SELECT
    first_name, last_name, hire_date
FROM employees
WHERE last_name = 'King';

-- 3

SELECT
    first_name, salary, hire_date
FROM employees
WHERE salary >= 15000;

-- 4

SELECT
    first_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 12000;

-- 5

SELECT
    first_name, salary, manager_id
FROM employees
WHERE manager_id IN (101, 102, 103);
 
-- 6

SELECT
    first_name, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'FI_MGR');

-- 7

SELECT
    first_name, last_name, job_id
FROM employees
WHERE job_id LIKE 'IT%';

-- 8

SELECT
    first_name, email
FROM employees
WHERE email LIKE '_A%';

-- 9

SELECT
    first_name, manager_id
FROM employees
WHERE manager_id IS NULL;

-- 10

SELECT
    first_name, job_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

-- 11

SELECT
    first_name, job_id, salary
FROM employees
WHERE job_id = 'IT_PROG' AND salary >= 5000;

-- 12

SELECT
    first_name, job_id, salary
FROM employees
WHERE job_id = 'IT_PROG' AND salary >= 5000;

-- 13

SELECT
    first_name, job_id, salary
FROM employees
WHERE (job_id = 'IT_PROG' OR job_id = 'FI_MGR') AND salary >= 5000;

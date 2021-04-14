-- 실습 문제
-- 1
SELECT
    *
FROM employees;

SELECT
    department_id AS 부서번호, ROUND(AVG(salary),2) AS 평균급여
FROM employees
GROUP BY department_id;

-- 2
SELECT
    department_id, 
    COUNT(*) AS "총 사원수"
FROM employees
GROUP BY department_id;

-- 3
SELECT
    department_id AS 부서번호, ROUND(AVG(salary),2) AS 평균급여
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 8000;

--4

SELECT 
    job_id,
    ROUND(AVG(salary), 2) AS sal_avg
FROM employees
WHERE job_id NOT LIKE 'SA%' 
GROUP BY job_id
HAVING ROUND(AVG(salary), 2) > 8000
ORDER BY sal_avg DESC;

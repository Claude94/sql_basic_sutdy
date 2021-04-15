-- # 실습 문제
-- 1. employees, departments테이블을 INNER JOIN해서
--    first_name, department_id, department_name을 조회하세요.

SELECT
    a.first_name, b.department_id, b.department_name
FROM employees a, departments b
WHERE a.department_id = b.department_id;

-- 2. employees, departments테이블을 NATURAL JOIN해서
--    first_name, department_id, department_name을 조회하세요.

SELECT
    a.first_name, department_id, b.department_name
FROM employees a NATURAL JOIN departments b;

-- 3. employees, departments테이블을 JOIN ON을 사용해서
--    first_name, department_id, department_name을 조회하세요.

SELECT
    a.first_name, b.department_id, b.department_name
FROM employees a 
JOIN departments b
ON a.department_id = b.department_id;

-- 4. USING

SELECT
    a.first_name, department_id, b.department_name
FROM employees a JOIN departments b USING (department_id);
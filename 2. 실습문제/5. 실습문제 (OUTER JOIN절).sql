-- OUTER JOIN 추가 예제
SELECT
    *
FROM job_history
ORDER BY employee_id; -- 직무 변동 이력

-- 모든 사원 정보를 조회할 건데 혹시 직무 변동이력이 있다면
-- 해당내역도 같이 보고 싶다.

SELECT
    a.employee_id, a.first_name, a.hire_date, a.job_id AS "courrent_job_id",
    b.start_date, b.end_date, b.job_id AS "last_job_id", b.department_id
FROM employees a
LEFT OUTER JOIN job_history b
ON a.employee_id = b.employee_id
ORDER BY b.employee_id
;

-- 실습문제 (JOIN)
-- 1. 사원번호가 103번인 사원의 이름(employee_name)과 매니저 이름(manager_name)을 출력하세요.

SELECT
    a.first_name,
    b.first_name
FROM employees a
JOIN employees b
ON b.employee_id = a.manager_id
WHERE a.employee_id = 103
;

-- 2. 모든 사원의 first_name과 department_name, 
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 조회하세요.
-- employees, departments, locations 3개 조인

SELECT
    a.first_name, a.department_id,
    street_address || ',' || city || ',' || state_province AS address
FROM employees a
JOIN departments b
ON a.department_id = b.department_id
JOIN locations c
ON b.location_id = c.location_id
;

-- 3. 103번 사원의 first_name과 department_name, 
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 
--    지정하여 조회하세요.

SELECT
    a.first_name, a.department_id,
    street_address || ',' || city || ',' || state_province AS address
FROM employees a
JOIN departments b
ON a.department_id = b.department_id
JOIN locations c
ON b.location_id = c.location_id
WHERE a.employee_id = 103
;

-- 4. 부서 이름이 IT로 시작하는 사원의 first_name과 department_name, 
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 
--    지정하여 조회하세요.


SELECT
    a.first_name, a.department_id,
    street_address || ',' || city || ',' || state_province AS address
FROM employees a
JOIN departments b
ON a.department_id = b.department_id
JOIN locations c
ON b.location_id = c.location_id
WHERE b.department_name = 'IT';

-- 5. jobs테이블에서 모든 직무 id(job_id)와 직무명(job_title)을 조회하는데 
--    만약 직무변동 이력이 있다면 해당 이력 정보 
-- (start_date, end_date, job_id, employee_id, first_name, department_id, department_name)
--    도 함께 조회하세요.

SELECT
    a.job_id, a.job_title,
    b.start_date, b.end_date, b.job_id,
    c.employee_id, c.department_id, d.department_name
FROM jobs a
LEFT OUTER JOIN job_history b
ON a.job_id = b.job_id
LEFT OUTER JOIN employees c
ON b.employee_id = c.employee_id
LEFT OUTER JOIN departments d
ON c.department_id = d.department_id;



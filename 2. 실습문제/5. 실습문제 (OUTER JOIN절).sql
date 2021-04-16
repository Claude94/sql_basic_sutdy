-- OUTER JOIN �߰� ����
SELECT
    *
FROM job_history
ORDER BY employee_id; -- ���� ���� �̷�

-- ��� ��� ������ ��ȸ�� �ǵ� Ȥ�� ���� �����̷��� �ִٸ�
-- �ش系���� ���� ���� �ʹ�.

SELECT
    a.employee_id, a.first_name, a.hire_date, a.job_id AS "courrent_job_id",
    b.start_date, b.end_date, b.job_id AS "last_job_id", b.department_id
FROM employees a
LEFT OUTER JOIN job_history b
ON a.employee_id = b.employee_id
ORDER BY b.employee_id
;

-- �ǽ����� (JOIN)
-- 1. �����ȣ�� 103���� ����� �̸�(employee_name)�� �Ŵ��� �̸�(manager_name)�� ����ϼ���.

SELECT
    a.first_name,
    b.first_name
FROM employees a
JOIN employees b
ON b.employee_id = a.manager_id
WHERE a.employee_id = 103
;

-- 2. ��� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� ��ȸ�ϼ���.
-- employees, departments, locations 3�� ����

SELECT
    a.first_name, a.department_id,
    street_address || ',' || city || ',' || state_province AS address
FROM employees a
JOIN departments b
ON a.department_id = b.department_id
JOIN locations c
ON b.location_id = c.location_id
;

-- 3. 103�� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.

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

-- 4. �μ� �̸��� IT�� �����ϴ� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.


SELECT
    a.first_name, a.department_id,
    street_address || ',' || city || ',' || state_province AS address
FROM employees a
JOIN departments b
ON a.department_id = b.department_id
JOIN locations c
ON b.location_id = c.location_id
WHERE b.department_name = 'IT';

-- 5. jobs���̺��� ��� ���� id(job_id)�� ������(job_title)�� ��ȸ�ϴµ� 
--    ���� �������� �̷��� �ִٸ� �ش� �̷� ���� 
-- (start_date, end_date, job_id, employee_id, first_name, department_id, department_name)
--    �� �Բ� ��ȸ�ϼ���.

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



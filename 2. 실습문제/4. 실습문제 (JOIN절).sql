-- # �ǽ� ����
-- 1. employees, departments���̺��� INNER JOIN�ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.

SELECT
    a.first_name, b.department_id, b.department_name
FROM employees a, departments b
WHERE a.department_id = b.department_id;

-- 2. employees, departments���̺��� NATURAL JOIN�ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.

SELECT
    a.first_name, department_id, b.department_name
FROM employees a NATURAL JOIN departments b;

-- 3. employees, departments���̺��� JOIN ON�� ����ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.

SELECT
    a.first_name, b.department_id, b.department_name
FROM employees a 
JOIN departments b
ON a.department_id = b.department_id;

-- 4. USING

SELECT
    a.first_name, department_id, b.department_name
FROM employees a JOIN departments b USING (department_id);
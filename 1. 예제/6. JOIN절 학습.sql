-- JOIN ����

-- īƼ�þ� ���δ�Ʈ (ũ�ν� ����)

SELECT 
    emp_no, emp_nm, a.dept_cd, dept_nm
FROM tb_emp a, tb_dept b

-- ��ť ����
WHERE a.dept_cd = b.dept_cd -- ���� ����
;

SELECT 
    dept_cd, dept_nm
FROM tb_dept
;

-- �ڰ��� ���� ���̺�
SELECT
    *
FROM tb_certi
;

-- ȸ���� ����� �ڰ��� ���� ���̺�
SELECT
    *
FROM tb_emp_certi;

-- �����ȣ, �����, �����, ����ڰ��� �ڵ��ȣ
SELECT
    *
FROM tb_emp_certi; -- �����, ����ڰ��� �ڵ��ȣ

SELECT
    *
FROM tb_emp; -- �����, �����ȣ

SELECT
    a.emp_no, a.emp_nm, b.certi_cd, b.acqu_de, c.certi_nm, d.dept_nm
FROM tb_emp a, tb_emp_certi b, tb_certi c, tb_dept d
WHERE a.emp_no = b.emp_no 
    AND b.certi_cd = c.certi_cd
    AND a.dept_cd = d.dept_cd;


-- INNER JOIN
-- 1. 2�� �̻��� ���̺��� ����� �÷��� ���� �������� ���յǴ� ���α���Դϴ�.
-- 2. WHERE���� ���� �÷����� �������(=)�� ���� ���ε˴ϴ�.
SELECT
    a.emp_nm, a.emp_no, a.addr, b.dept_nm, b.dept_cd
FROM tb_emp a, tb_dept b
WHERE a.dept_cd = b.dept_cd
AND a.addr LIKE '%����%'
ORDER BY a.emp_nm
;

-- NATURAL JOIN
-- 1. NATURAL JOIN�� ������ �̸��� ���� �÷��鿡 ���� �ڵ� �����ϴ� ����Դϴ�.
-- 2. ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� INNER������ �����մϴ�.
-- 3. �� �� ���εǾ� ���� �̸��� �÷��� ������ Ÿ���� ���ƾ� �ϸ� ALIAS�� ���̺���� ���� �� �����ϴ�.
-- 4. SELECT * ������ ����ϸ�, ���� �÷����� �ڵ� �����ϸ� ������տ��� �ѹ��� ǥ��˴ϴ�.

SELECT
    a.emp_no, a.emp_nm, a.addr, dept_cd, b.dept_nm
FROM tb_emp a NATURAL JOIN tb_dept b
;

SELECT
    *
FROM tb_emp a NATURAL JOIN tb_dept b
;

-- USING�� ����
-- 1. NATURAL���ο����� �ڵ����� �̸��� ��ġ�ϴ� ��� �÷��� ���� ������
-- �Ͼ���� USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ���������� ������ �����մϴ�.
-- 2. USING�������� ���� �÷��� ���� ALIAS�� ���̺���� ���� �� �����ϴ�

SELECT
    a.emp_no, a.emp_nm, a.addr, dept_cd, e.dept_nm
FROM tb_emp a JOIN tb_dept e USING (dept_cd);

-- JOIN ON��
-- 1. ���� ���� ������(ON��)�� �Ϲ� ���� ������(WHERE��)�� �и��ؼ� �ۼ��ϴ� ����Դϴ�.
-- 2. ON���� ����ϸ� JOIN���Ŀ� �� �����̳� ���������� ���� �߰� ������ �� �� �ֽ��ϴ�.

SELECT
    a.emp_nm, a.emp_no, a.addr, b.dept_nm, b.dept_cd
FROM tb_emp a 
INNER JOIN tb_dept b
ON a.dept_cd = b.dept_cd
WHERE a.addr LIKE '%����%'
ORDER BY a.emp_nm
;

-- SELECT [DISTINCT] { ���̸� .... } 
-- FROM  ���̺� �Ǵ� �� �̸�
-- JOIN  ���̺� �Ǵ� �� �̸�
-- ON    ���� ����
-- WHERE ��ȸ ����
-- GROUP BY  ���� �׷�ȭ
-- HAVING    �׷�ȭ ����
-- ORDER BY  ������ �� [ASC | DESC];


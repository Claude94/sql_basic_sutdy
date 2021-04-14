-- Grop, by ,Having��
-- 1. ���� �Լ�

SELECT
    COUNT(emp_no) AS "�����",
    MAX(birth_de) AS "���� � ���",
    MIN(birth_de) AS "���� ���� ���� ���"
FROM tb_emp;

SELECT
    *
FROM tb_emp;

SELECT 
    COUNT(*),
    COUNT(direct_manager_emp_no)
FROM tb_emp;

SELECT 
*
FROM tb_sal_his;

-- Group by

-- �μ����� ���� � ��� �������, ���� �������� �������, �μ��� �� �������� �˰� �ʹ�.
SELECT birth_de, dept_cd FROM tb_emp;

SELECT
    A.dept_cd,
    (SELECT B.dept_nm FROM tb_dept B WHERE a.dept_cd = b.dept_cd) AS dep_mn,
    COUNT(*) AS "�μ��� ������",
    MAX(A.birth_de) AS "���� � ���",
    MIN(A.birth_de) AS "�μ��� ������"
FROM tb_emp A
GROUP BY dept_cd
HAVING COUNT(*) > 1
ORDER BY dept_cd;

-- ������� �޿��� ���� ���� �׼�, ���� ���� ���� �׼�, ��վ׼��� ��ȸ
SELECT
    emp_no, pay_de, pay_amt
FROM tb_sal_his
ORDER BY emp_no, pay_de;

SELECT
    A.emp_no,
    (SELECT B.emp_nm FROM tb_emp B WHERE A.emp_no = B.emp_no) AS emp_mn, 
    ROUND(AVG(A.pay_amt), 2) AS "��� �޿�",
    MAX(A.pay_amt)AS "�ְ� ���ɾ�",
    MIN(A.pay_amt)AS "���� ���ɾ�"
FROM tb_sal_his A
WHERE a.pay_de BETWEEN '20190101' and '20191231'
GROUP BY A.emp_no
HAVING AVG(A.pay_amt) >= 4700000
ORDER BY A.emp_no;

-- HAVING�� : �׷�ȭ �� ������� ������ �ɾ �� �� ����

-- ����� 2019�� �����ȣ��, ����̸�, ������ ��ȸ

SELECT
    A.emp_no,
    (SELECT B.emp_nm FROM tb_emp B WHERE A.emp_no = B.emp_no) AS emp_mn,
    to_char(SUM(A.pay_amt), '999,999,999L') AS "����"
FROM tb_sal_his A
WHERE A.pay_de BETWEEN '20190101' and '20191231'
GROUP BY A.emp_no
HAVING SUM(A.pay_amt) >= 50000000
ORDER BY A.emp_no;

-- ���� ORDER BY
-- ASC : ������(�⺻��), DESC ������
SELECT
    emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_no ASC;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm DESC;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
ORDER BY 2;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm DESC, emp_no;

SELECT
    emp_no AS en, emp_nm AS em, addr
FROM tb_emp
ORDER BY em DESC;

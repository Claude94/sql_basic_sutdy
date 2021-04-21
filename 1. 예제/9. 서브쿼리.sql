-- ��������
-- ������ ��������

-- �����ȣ�� 1000000005���� ����� ���� �μ��� ��� �������

SELECT
    emp_nm, emp_no, dept_cd
FROM tb_emp
WHERE dept_cd = (
    SELECT
        dept_cd
    FROM tb_emp
    WHERE emp_no = '1000000005'
);

-- 20150525�� ���� �޿��� ȸ�� ��ü ��ձ޿����� ���� ������� ���� ��ȸ

SELECT
    a.emp_no, a.emp_nm, b.pay_de, b.pay_amt
FROM tb_emp a
JOIN tb_sal_his b
ON a.emp_no = b.emp_no
WHERE b.pay_de = '20200525'
AND b.pay_amt >= (
    SELECT
        AVG(pay_amt)
    FROM tb_sal_his
    WHERE pay_de = '20200525'
);

-- ������ ��������
-- �������� ��ȸ �Ǽ��� ���� ���� ��
-- ������ ������ : IN, ANY, EXISTS

-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ� �����ȣ�� ���� �ڰ��� ������ ��ȸ

SELECT
    a.emp_no, b.emp_nm, COUNT(a.certi_cd)
FROM tb_emp_certi a 
JOIN tb_emp b
ON a.emp_no = b.emp_no
WHERE a.certi_cd IN (
SELECT
    certi_cd
FROM tb_certi c
WHERE issue_insti_nm LIKE '�ѱ������ͺ��̽������'
)
GROUP BY a.emp_no, b.emp_nm
ORDER BY a.emp_no
;

-- ���� �÷� ��������
-- �μ����� 2�� �̻��� �μ� �߿��� �� �μ��� ���� ���� ���� ����� ������ ��ȸ

SELECT
    a.emp_nm, a.emp_no, a.dept_cd, b.dept_nm, a.birth_de
FROM tb_emp a
JOIN tb_dept b
ON a.dept_cd = b.dept_cd
WHERE (a.dept_cd, a.birth_de) IN (
    SELECT
        c.dept_cd, MIN(c.birth_de)
    FROM tb_emp c
    GROUP BY c.dept_cd
    HAVING COUNT(*) >= 2
    )
ORDER BY a.emp_no
;

SELECT
    1
FROM tb_emp
WHERE addr LIKE '%����%';

-- �ּҰ� ������ �������� �μ������� ��ȸ
SELECT
    a.dept_cd, a.dept_nm
FROM tb_dept a
WHERE EXISTS ( 
    SELECT 1
    FROM tb_emp b
    WHERE b.addr LIKE '%����%'
        AND a.dept_cd = b.dept_cd
);

-- ��Į�� �������� (select���� ���� ��������)

SELECT
    a.emp_no, a.emp_nm, a.dept_cd,
    (SELECT b.dept_nm FROM tb_dept b WHERE a.dept_cd = b.dept_cd) as dept_nm
FROM tb_emp a;

-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ���� �ִ� ����� ������ ��ȸ
SELECT
    a.emp_no, (SELECT b.emp_nm FROM tb_emp b WHERE a.emp_no = b.emp_no) AS emp_nm,
    a.certi_cd, (SELECT c.certi_nm FROM tb_certi c WHERE a.certi_cd = c.certi_cd) AS certi_nm
FROM tb_emp_certi a
WHERE a.certi_cd IN (
    SELECT
        b.certi_cd
    FROM tb_certi b
    WHERE b.issue_insti_nm = '�ѱ������ͺ��̽������'
)
;

-- �ζ��� �� (FROM���� ����ϴ� ��������)

SELECT
    *
FROM (
    SELECT
        ROWNUM rn, emp_nm, emp_no, addr
    FROM tb_emp
    WHERE ROWNUM <= 10
) a
WHERE a.addr LIKE '%����%'
;

SELECT
    ROWNUM, emp_nm, emp_no, addr
FROM tb_emp
ORDER BY emp_no;

-- ������ �������� ������
-- 1. IN: ����� ����� ������ Ȯ��
-- 2. ANY, SOME: ���� ���������� ���� ���ϵ� �� ��ϰ� ���ϴµ� �ϳ��� �����ϸ� ��.
-- 3. ALL: ���� ���������� ���� ���ϵ� �� ��ϰ� ���ϴµ� ��� ���� �����ؾ� ��.
-- 4. EXISTS: ����� �����ϴ� ���� �����ϴ����� ���θ� Ȯ��

-- IN�����ڿ� = ANY�� �����ϴ�

SELECT
    emp_nm, addr, dept_cd
FROM tb_emp
WHERE dept_cd = SOME (
    SELECT
        dept_cd
    FROM tb_emp
    WHERE emp_nm = '�̳���'
);




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



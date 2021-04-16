-- 3���� ���̺� ����
SELECT
    a.emp_nm, a.emp_no, a.addr,
    b.dept_cd, b.dept_nm, c.certi_cd
FROM tb_emp a JOIN tb_dept b ON a.dept_cd = b.dept_cd 
JOIN tb_emp_certi c ON a.emp_no = c.emp_no;

-- 4�� ���̺� ����

-- SELF JOIN
-- 1. SELF JOIN�� �ڱ� �ڽ� ���̺��� �����ϴ� �����Դϴ�.
-- 2. �ڱ� ���̺��� �÷����� ��Ī�Ͽ� ��ȸ�ϴ� ����Դϴ�.

SELECT
    a.emp_nm, a.emp_no, a.direct_manager_emp_no,
    a.emp_nm AS ����̸�
FROM tb_emp a
JOIN tb_emp b
ON a.direct_manager_emp_no = b.emp_no
WHERE a.emp_nm = '�質��'
ORDER BY a.emp.nm;

-- OUTER JOIN �ǽ�ȯ�� ����
INSERT INTO tb_dept VALUES ('100014', '4�����������', '999999');
INSERT INTO tb_dept VALUES ('100015', '����Ʈ�ڷγ���', '999999');
COMMIT;

SELECT * FROM tb_dept;

ALTER TABLE tb_emp DROP CONSTRAINT fk_tb_emp01;

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000041', '�̼���', '19811201', '1', '��⵵ ���ν� ������ ����1�� 435', '010-5656-7878',
        NULL, '006', '003', '114-554-223433', '000000', 'N');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000042', '�����', '19820402', '1', '��⵵ ���� ���籸 ȭ���� 231', '010-4054-6547',
        NULL, '004', '001', '110-223-553453', '000000', 'Y');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000043', '������', '19850611', '1', '��⵵ ������ �ȴޱ� ��ź�� 553', '010-1254-1116',
        NULL, '004', '001', '100-233-664234', '000000', 'N');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000044', '�庸��', '19870102', '1', '��⵵ ������ �д籸 ���ڵ� 776', '010-1215-8784',
        NULL, '004', '002', '180-345-556634', '000000', 'Y');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000045', '������', '19880824', '1', '��⵵ ���� �ϻ꼭�� �鼮�� 474', '010-3687-1245',
        NULL, '004', '002', '325-344-45345', '000000', 'Y');
        
COMMIT;
    
 
SELECT * FROM tb_emp ORDER BY emp_no DESC;

SELECT * FROM tb_dept;

-- OUTER JOIN
-- 1.���� ������ �������� �ʴ� ��鵵 ��ȸ�� �� ����ϴ� ���α���Դϴ�
-- 2. OUTER���� ������ ��ȣ�� (+)��ȣ�Դϴ�
-- 3. INNER������ ���� ������ �������� ������ �ش� ���� ��ȸ���� �ʽ��ϴ�
-- �׷��� OUTER������ ���� (LEFT, RIGHT, FULL)�� �°� ���ǿ� ��Ī����
-- �ʴ� ��鵵 ��� NULL�� ó���ؼ� ��ȸ�մϴ�.

-- LEFT OUTER JOIN
-- ���εǴ� ���� ���̺��� ��� ��ȸ�ϰ� ������ ���̺��� �������ǿ� ��Ī�� �͸� ��ȸ�մϴ�.

-- ��������� �ϴ� �� ���� �Ͱ� Ȥ�� �μ����̺��� �μ��ڵ尡 ��Ī�Ǹ� �μ��̸� ���

SELECT
    a.emp_nm, a.emp_no, b.dept_cd, b.dept_nm
FROM tb_emp a, tb_dept b
WHERE a.dept_cd = b.dept_cd (+);

SELECT
    a.emp_nm, a.emp_no, b.dept_cd, b.dept_nm
FROM tb_emp a 
LEFT JOIN tb_dept b
ON a.dept_cd = b.dept_cd;

-- RIGHT OUTER JOIN
-- ���εǴ� ������ ���̺��� ��� ��ȸ�ϰ� ���� ���̺��� �������ǿ� ��Ī�� �͸� ��ȸ�մϴ�
SELECT
    a.emp_nm, a.emp_no, b.dept_cd, b.dept_nm
FROM tb_emp a, tb_dept b
WHERE a.dept_cd (+) = b.dept_cd;

SELECT
    a.emp_nm, a.emp_no, b.dept_cd, b.dept_nm
FROM tb_emp a 
JOIN tb_dept b
ON a.dept_cd (+) = b.dept_cd;

SELECT
    a.emp_nm, a.emp_no, b.dept_cd, b.dept_nm
FROM tb_emp a 
RIGHT OUTER JOIN tb_dept b
ON a.dept_cd = b.dept_cd;

-- FULL OUTER JOIN


SELECT
    a.emp_nm, a.emp_no, b.dept_cd, b.dept_nm
FROM tb_emp a 
FULL OUTER JOIN tb_dept b
ON a.dept_cd = b.dept_cd;
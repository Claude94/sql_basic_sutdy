-- ���ڿ� ��
CREATE TABLE CHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    char_6 CHAR(6)
);

INSERT INTO char_compare VALUES ('101', 'SQLD', 'SQLD');
INSERT INTO char_compare VALUES ('102', 'SQLD', 'SQLA');

COMMIT;

SELECT * FROM char_compare;

SELECT
    REPLACE(char_4,' ','+')AS char_4,
    REPLACE(char_6,' ','+')AS char_6
FROM char_compare;


SELECT
    REPLACE(char_4,' ','+')AS char_4,
    REPLACE(char_6,' ','+')AS char_6
FROM char_compare
WHERE sn = '101'
    AND char_4 = char_6;

SELECT * FROM char_compare;

SELECT
    REPLACE(char_4,' ','+')AS char_4,
    REPLACE(char_6,' ','+')AS char_6
FROM char_compare
WHERE sn = '102'
    AND char_4 > char_6;
    
-- ������ VARCHARŸ���� ����� ��
DROP TABLE VARCHAR_COMPARE;
CREATE TABLE VARCHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    varchar_6 VARCHAR2(6)
);

INSERT INTO varchar_compare VALUES ('101', 'SQLD', 'SQLD  ');
INSERT INTO varchar_compare VALUES ('102', 'SQLD', 'SQLA  ');

COMMIT;

SELECT
    *
FROM varchar_compare;

SELECT
    REPLACE(char_4,' ','+')AS char_4,
    REPLACE(varchar_6,' ','+')AS varchar_6
FROM varchar_compare
WHERE sn = '101'
    AND char_4 = varchar_6;
    
-- ������ڿ��� ��
SELECT
    REPLACE(char_4,' ','+')AS char_4,
    REPLACE(varchar_6,' ','+')AS varchar_6
FROM varchar_compare
WHERE sn = '101'
    AND varchar_6 = 'SQLD  ';
    
-- ������ �Լ�
-- ���ڿ� �Լ�
SELECT
    LOWER('Hello WORLD'), --���� �빮��
    UPPER('hello world'), --���� �ҹ���
    INITCAP('abcdef') --ù��° �빮��
FROM dual;

SELECT
    ASCII('A'),--���ڸ� �ƽ�Ű�ڵ��
    CHR(65) --�ƽ�Ű�ڵ带 ���ڷ�
FROM dual;

SELECT
    CONCAT('SQL', 'Developer'), --���ڿ��� ����
    SUBSTR('SQL Developer',1,3), --���ڿ� �ڸ� (ù���ڰ� 1��)
    LENGTH('HELLO WORLD'), --���ڿ� ���� ��
    TRIM('       HI       ') -- �¿� ���� ����
FROM dual;

SELECT
    RPAD('Steve', 10, '-'), --�����ʿ� �־��� ���ڸ� ä��
    LPAD('Steve', 10, '*'), --���ʿ� �־��� ���ڸ� ä��
    REPLACE('Java Programmer','Java','BingData')--���ڸ� ����
FROM dual;

-- ��¥�� �Լ�

-- ���� ��¥�� ��ȸ
SELECT SYSDATE,
       LAST_DAY(SYSDATE) "Last",
       LAST_DAY(SYSDATE) - SYSDATE "Days Left"
FROM DUAL;

SELECT SYSTIMESTAMP
FROM DUAL;

--��ȯ �Լ�
SELECT * FROM char_compare
WHERE sn = 101;

-- ��¥�� ���ڷ� ��ȯ (to_char�Լ�)
-- ��¥ ���� ���� : Y - ����, MM - ���ڸ� ��, D - �ϼ�
-- �ð� �������� : HH12 - ��(1~12), HH24 - ��(0~23), MI - ��, ss - ��
SELECT 
    to_char(SYSDATE, 'MM - DD') AS "��, ��",
    to_char(SYSDATE, 'YYYY/MM/DD') AS "��/��/��",
    to_char(SYSDATE, 'YYYY"��" MM"��" DD"��"') AS "��¥ - �ѱ�����",
    to_char(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS "��¥�� �ð�",
    to_char(SYSDATE, 'YYYY/MM/DD PM HH12:MI:SS') AS "��¥�� �ð�2"
FROM DUAL;

-- ���ڸ� ���ڷ� ��ȯ

-- ## ������ �Լ�
SELECT 
    MOD(27, 5) AS MOD, -- ������ �� ��ȯ
    CEIL(38.678) AS ceil, -- �ø��� ��ȯ
    FLOOR(38.678) AS floor, -- ������ ��ȯ
    ROUND(38.678, 2) AS round, -- �ڸ������� �ݿø�
    TRUNC(38.678, 2) AS trunc  -- �ڸ��� ���ϸ� ����
FROM dual;

-- ��¥ ����
-- ��¥ + ���� = ��¥  => ��(DAY) ���� ��¥�� ����
-- ��¥ - ���� = ��¥  => ��¥���� �� ���� ��
-- ��¥ - ��¥ = �ϼ�  => � ��¥���� �ٸ� ��¥�� �� �ϼ�
-- ��¥ + ����/24 = ��¥  => ��¥�� �ð��� ����

SELECT 
    SYSDATE AS "���� �ð�",
    SYSDATE - 1 AS "SYSDATE - 1",
    (SYSDATE + 10) - SYSDATE AS "��¥ - ��¥",
    SYSDATE - (1/24) AS "1�ð� ����",
    SYSDATE - (1/24/60) * 100 AS "100�� ����",
    SYSDATE - (1/24/60/60) * 30 AS "30�� ����"
FROM dual;

-- ���� ���� ���� - $: �޷�ǥ��, L:����ȭ���ȣ
SELECT 
    to_char(9412*1.33, '$999,999.99') AS "�޷�",
    to_char(1350000,'999,999,999L') AS "��ȭ"
FROM DUAL;

-- ���ڸ� ���ڷ� ��ȯ
SELECT
    to_number('$5,500', '$999,999') - 4000 AS "�����"
FROM DUAL;

-- caseǥ���� decode�Լ�
SELECT 
    sal_cd, sal_nm,
    CASE WHEN sal_cd = '100001' THEN '�⺻�޿�'
       WHEN sal_cd = '100002' THEN '���ʽ��޿�'
       ELSE '��Ÿ' 
       END sal_name
FROM tb_sal;

SELECT 
    sal_cd,
    DECODE(sal_cd, '100001', '�⺻�޿�', '100002', '���ʽ��޿�', '��Ÿ') AS sal_name
FROM tb_sal;

-- �� ���� �Լ�
-- NVL (expr1, expr2)
-- expr1 : Null�� ���� �� �ִ� ���̳� ǥ����
-- expr2 : expr1�� Null�� ��� ��ü�� ��

SELECT 
    emp_no,
    emp_nm,
    NVL(direct_manager_emp_no,'�ֻ��� ������') AS ������
FROM tb_emp;


SELECT 
    NVL(MAX(emp_nm),'�������') AS emp_nm
FROM tb_emp
WHERE emp_nm = '����ȣ';

-- NVL2(expr1, expr2, expr3)
-- expr1�� ���� Null�� �ƴϸ� expr2�� ��ȯ, Null�̸� expr3�� ��ȯ

SELECT 
    emp_nm,
    NVL2(direct_manager_emp_no, '�Ϲݻ��', 'ȸ���') AS ����
FROM tb_emp;

-- NULLIF(expr1, expr2)
-- �� ���� ������ Null����, �ٸ��� expr1 ����

SELECT 
    NULLIF('����ȣ', '����ȣ')
FROM DUAL;

SELECT 
    NULLIF('����ȣ', '������')
FROM DUAL;

-- COALESCE(expr1, ...)
-- ���� ǥ���� �� Null�� �ƴ� ���� ���ʷ� �߰ߵǸ� �ش� ���� ����

SELECT 
    COALESCE(NULL, 5000, NULL)
FROM DUAL;

SELECT 
    COALESCE(7000, NULL, NULL)
FROM DUAL;

SELECT 
    COALESCE(NULL, 3000, 4000)
FROM DUAL;

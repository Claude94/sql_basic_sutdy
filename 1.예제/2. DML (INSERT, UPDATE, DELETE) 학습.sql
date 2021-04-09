
-- # DML : ������ ���۾�
-- # SELECT, INSERT, UPDATE
-- ������ �߰�
INSERT INTO
   board (bno, title, content, writer, reg_date)
VALUES
    (1, '�ȳ�', '����ִ� �����Դϴ�', '������', SYSDATE);
    
INSERT INTO
   board (bno, title, writer, reg_date)
VALUES
    (3, '3���� �Դϴ�', '�Ѹ�', SYSDATE);
    
INSERT INTO
   board
VALUES
    (4, '3���� �Դϴ�','���볻��', '�Ѹ�', SYSDATE);
    
-- ������ ����
UPDATE board SET writer='������' WHERE bno=1;

-- ������ ����
UPDATE board SET writer='mike',content='hello goodbye' WHERE bno=3;

-- UPDATE������ WHERE�������� ������ ���
UPDATE board
SET title='�޷�';

-- ������ ����
DELETE FROM board WHERE bno = 4;

COMMIT;

-- DELETE���� WHERE���� ������ ��� ��ü���� �����ǹǷ� ����
DELETE FROM board;
ROLLBACK;
-- ��ü ������ ����
-- 1. WHERE���� ������ DELETE�� (�ѹ� ����)
DELETE FROM board;
ROLLBACK;
-- 2. TRUNCATE TABLE DDL�� ����� ��� (�ѹ� �Ұ��� / ���̺� ������ �������� ����
-- FK ���� ����
ALTER TABLE REPLY
DROP CONSTRAINT fk_reply_bno;

TRUNCATE TABLE board;
-- 3.DROP TABLE DDL�� ����� ��� (�ѹ� �Ұ��� / ���̺� ������ ����)
DROP TABLE board;


SELECT * FROM board;
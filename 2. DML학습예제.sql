--DML: ������ ���۾�
--SESECT, INSERT, UPDATE, DELETE

--������ ����
INSERT INTO BOARD
(BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
(1,'�ȳ�', '����ִ� �����Դϴ�.', '������', SYSDATE);


--NOT NULL �������ǿ� �ɸ�(TITLE)
INSERT INTO BOARD
(BNO, CONTENT, WRITER, REG_DATE)
VALUES
(2, '����ִ� �����Դϴ�.', '������', SYSDATE);

--PK ������������ �۹�ȣ �ߺ�
INSERT INTO BOARD
(BNO, TITLE, WRITER, REG_DATE)
VALUES
(1, '���ο� ���̾�', '�����', SYSDATE);

INSERT INTO BOARD
(BNO, TITLE, WRITER, REG_DATE)
VALUES
(2, '���ο� ���̾�', '�����', SYSDATE);

--���̺��� ��� �÷��� ������� �� ä�� ��� �÷������� ��������
INSERT INTO BOARD
VALUES
(3, '3�� ��','�� ���� ����������', '�Ѹ�', SYSDATE);

SELECT * FROM BOARD;

COMMIT;--SAVE ���

--������ ����
UPDATE BOARD
SET writer = '������ ö��'
WHERE bno = 2;

UPDATE board
SET content = '���������Ĥ�'
WHERE bno = 2;

UPDATE board
SET TITLE = '������ �����̾�'
    ,content = '������������'
WHERE BNO = 1;

--UPDATE������ WHERE�� �����Ǹ� ��ü�����ǹǷ� ����
UPDATE board
SET content = '�޷�';

--�����ͻ��� -- DELETE FROM�� ��� �ƹ��͵� �� �� �ٿ���
DELETE FROM board
WHERE bno = 2;

ROLLBACK;

COMMIT;

INSERT INTO BOARD
(BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
(4,'�ӽ��׽�Ʈ', '�޷ո޷�', '���׽�Ʈ', SYSDATE);

SELECT * FROM BOARD;

ROLLBACK;--����Ŀ�� �������� �ѹ��ϴ� ��


INSERT INTO BOARD
(BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
(5,'�ӽ��׽�Ʈ', '�޷ո޷�', '���׽�Ʈ', SYSDATE);

INSERT INTO BOARD
(BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
(6,'�ӽ��׽�Ʈ', '�޷ո޷�', '���׽�Ʈ', SYSDATE);


INSERT INTO BOARD
(BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
(7,'�ӽ��׽�Ʈ', '�޷ո޷�', '���׽�Ʈ', SYSDATE);

COMMIT;

--��ü�����ͻ���
--1.WHERE���� ������ DELETE�� (ROLLBACK����)
DELETE FROM BOARD;
SELECT * FROM BOARD;
ROLLBACK;

--����!!!!
--2. TRUNCATE TABLE�� ����� ���(ROLLBACK�Ұ���)/���̺� ������ �������� ����
TRUNCATE TABLE BOARD;

--3. DROP TABLE(ROLLBACK�Ұ���/���̺� ������ ����)

DROP TABLE BOARD;











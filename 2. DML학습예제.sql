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


-- ���� 97

CREATE TABLE ȸ��_97 (
    ȸ����ȣ CHAR(7)
    , ȸ���� VARCHAR2(50)
    , CONSTRAINT ȸ��_97_PK PRIMARY KEY (ȸ����ȣ)
);
CREATE TABLE ����׸�_97 (
    ����׸��ڵ� CHAR(3)
    , ����� VARCHAR2(50)
    , CONSTRAINT ����׸�_97_PK PRIMARY KEY (����׸��ڵ�)
);

CREATE TABLE �����׸�_97 (
    ȸ����ȣ CHAR(7)
    , ����׸��ڵ� CHAR(3)
    , ���ǿ��� CHAR(1)
    , �����Ͻ� DATE
    , CONSTRAINT �����׸�_97_PK PRIMARY KEY (ȸ����ȣ, ����׸��ڵ�)
);

INSERT INTO ȸ��_97 VALUES ('101', '��ö��');
INSERT INTO ȸ��_97 VALUES ('102', '�ڿ���');

INSERT INTO ����׸�_97 VALUES ('101', '������������');
INSERT INTO ����׸�_97 VALUES ('102', '������ ��������');

INSERT INTO �����׸�_97 VALUES ('101', '101', 'N', TO_DATE('20210831141516', 'YYYYMMDDHH24MISS'));
INSERT INTO �����׸�_97 VALUES ('101', '102', 'Y', TO_DATE('20210831141516', 'YYYYMMDDHH24MISS'));
INSERT INTO �����׸�_97 VALUES ('102', '101', 'Y', TO_DATE('20210831141516', 'YYYYMMDDHH24MISS'));
INSERT INTO �����׸�_97 VALUES ('102', '102', 'Y', TO_DATE('20210831141516', 'YYYYMMDDHH24MISS'));
COMMIT;

SELECT*FROM �����׸�_97;

-- SQL
SELECT A.ȸ����ȣ, A.ȸ����
FROM ȸ��_97 A, �����׸�_97 B
WHERE A.ȸ����ȣ = B.ȸ����ȣ
GROUP BY A.ȸ����ȣ, A.ȸ����
HAVING COUNT(CASE WHEN B.���ǿ��� = 'N' THEN 0 ELSE NULL END) >= 1
ORDER BY A.ȸ����ȣ
;

-- ����1
SELECT A.ȸ����ȣ, A.ȸ����
FROM ȸ��_97 A
WHERE EXISTS (
    SELECT 1 FROM �����׸�_97 B WHERE A.ȸ����ȣ = B.ȸ����ȣ
                                 AND B.���ǿ��� = 'N'
            );

-- ����2
SELECT A.ȸ����ȣ, A.ȸ����
FROM ȸ��_97 A
WHERE A.ȸ����ȣ IN (
                        SELECT B.ȸ����ȣ FROM �����׸�_97 B
                        WHERE B.���ǿ��� = 'N'
                    );

-- ����3
SELECT A.ȸ����ȣ, A.ȸ����
FROM ȸ��_97 A
WHERE 0 < (SELECT COUNT(*) FROM �����׸�_97 B
                        WHERE B.���ǿ��� = 'N');


-- ����4
SELECT A.ȸ����ȣ, A.ȸ����
FROM ȸ��_97 A, �����׸�_97 B
WHERE A.ȸ����ȣ = B.ȸ����ȣ
   AND B.���ǿ��� = 'N'
GROUP BY A.ȸ����ȣ, A.ȸ����
ORDER BY A.ȸ����ȣ
;




-- ���� 98��
CREATE TABLE ȸ��_98 (
    ȸ��ID VARCHAR2(255) PRIMARY KEY,
    ȸ���� VARCHAR2(255)
);

CREATE TABLE ���Ϲ߼�_98 (
    �̺�ƮID VARCHAR2(255),
    ȸ��ID VARCHAR2(255),
    �߼��Ͻ� VARCHAR2(255)
);

CREATE TABLE �̺�Ʈ_98 (
    �̺�ƮID VARCHAR2(255) PRIMARY KEY,
    �̺�Ʈ�� VARCHAR2(255),
    �������� VARCHAR2(255)
);

INSERT INTO ȸ��_98 VALUES ('aaa', '��ö��');
INSERT INTO ȸ��_98 VALUES ('bbb', '�ڿ���');
INSERT INTO ȸ��_98 VALUES ('ccc', '��浿');
INSERT INTO ȸ��_98 VALUES ('ddd', '�����');

INSERT INTO �̺�Ʈ_98 VALUES ('001', '1�ֳ��̺�Ʈ', '20140901');
INSERT INTO �̺�Ʈ_98 VALUES ('002', '�������̺�Ʈ', '20141002');
INSERT INTO �̺�Ʈ_98 VALUES ('003', 'Ŀ�������̺�Ʈ', '20141014');


INSERT INTO ���Ϲ߼�_98 VALUES ('001', 'aaa', '20140902');
INSERT INTO ���Ϲ߼�_98 VALUES ('001', 'bbb', '20140902');
INSERT INTO ���Ϲ߼�_98 VALUES ('001', 'ccc', '20140902');
INSERT INTO ���Ϲ߼�_98 VALUES ('002', 'aaa', '20141002');
INSERT INTO ���Ϲ߼�_98 VALUES ('002', 'bbb', '20141002');
INSERT INTO ���Ϲ߼�_98 VALUES ('002', 'ccc', '20141002');
INSERT INTO ���Ϲ߼�_98 VALUES ('002', 'ddd', '20141002');
INSERT INTO ���Ϲ߼�_98 VALUES ('003', 'aaa', '20141017');
INSERT INTO ���Ϲ߼�_98 VALUES ('003', 'bbb', '20141017');

COMMIT;

SELECT 
    A.ȸ��ID, A.ȸ����
FROM ȸ��_98 A
WHERE EXISTS (
                SELECT 'X' FROM �̺�Ʈ_98 B, ���Ϲ߼�_98 C
                WHERE B.�������� >= '20141001' 
                    AND B.�̺�ƮID = C.�̺�ƮID 
                    AND A.ȸ��ID = C.ȸ��ID
                HAVING COUNT(*) < (SELECT COUNT(*) FROM �̺�Ʈ_98 WHERE �������� >= '20141001')
            );
            
            
            
-- ���� 101��
CREATE TABLE ǰ�����׸�_101 (
    ���׸�ID CHAR(7) PRIMARY KEY,
    ���׸�� VARCHAR2(50)
);

CREATE TABLE �򰡴���ǰ_101 (
    ��ǰID CHAR(7) PRIMARY KEY,
    ��ǰ�� VARCHAR2(50)
);

CREATE TABLE �򰡰��_101 (
    ��ǰID CHAR(7),
    ��ȸ�� NUMBER,
    ���׸�ID CHAR(7),
    �򰡵�� CHAR(1),
    ������ CHAR(8),
    CONSTRAINT �򰡰��_101_PK PRIMARY KEY (��ǰID, ��ȸ��, ���׸�ID)
);

INSERT INTO ǰ�����׸�_101 VALUES ('100001', '�����ڷ�');
INSERT INTO ǰ�����׸�_101 VALUES ('100002', '���缳��');

INSERT INTO �򰡴���ǰ_101 VALUES ('100001', '�����������ӿ�ũ');
INSERT INTO �򰡴���ǰ_101 VALUES ('100002', '�ڹٽ�ũ��Ʈ');

INSERT INTO �򰡰��_101 VALUES ('100001', 1, '100001', 'S', '20210317');
INSERT INTO �򰡰��_101 VALUES ('100001', 2, '100001', 'A', '20210317');
INSERT INTO �򰡰��_101 VALUES ('100001', 3, '100001', 'B', '20210317');
INSERT INTO �򰡰��_101 VALUES ('100001', 1, '100002', 'B', '20210317');
INSERT INTO �򰡰��_101 VALUES ('100001', 2, '100002', 'A', '20210317');

INSERT INTO �򰡰��_101 VALUES ('100002', 1, '100001', 'S', '20210317');
INSERT INTO �򰡰��_101 VALUES ('100002', 2, '100001', 'A', '20210317');
INSERT INTO �򰡰��_101 VALUES ('100002', 3, '100001', 'B', '20210317');
INSERT INTO �򰡰��_101 VALUES ('100002', 1, '100002', 'B', '20210317');
INSERT INTO �򰡰��_101 VALUES ('100002', 2, '100002', 'A', '20210317');
INSERT INTO �򰡰��_101 VALUES ('100002', 3, '100002', 'S', '20210317');
INSERT INTO �򰡰��_101 VALUES ('100002', 4, '100002', 'C', '20210317');
COMMIT;


SELECT * FROM �򰡰��_101;
            
            
-- 1�� : ��ü��ǰ �߿� ��ȸ���� ���� ���� ��ǰ�� ���� ��ȸ
SELECT
    B.��ǰID, B.��ǰ��, C.���׸�ID, C.���׸��,
    A.��ȸ��, A.�򰡵��, A.������
FROM �򰡰��_101 A, �򰡴���ǰ_101 B, ǰ�����׸�_101 C
     , (SELECT MAX(��ȸ��) AS ��ȸ�� FROM �򰡰��_101) D
WHERE A.��ǰID = B.��ǰID
    AND A.���׸�ID = C.���׸�ID
    AND A.��ȸ�� = D.��ȸ��;

-- 2�� : ����
SELECT
    B.��ǰID, B.��ǰ��, C.���׸�ID, C.���׸��,
    A.��ȸ��, A.�򰡵��, A.������
FROM �򰡰��_101 A, �򰡴���ǰ_101 B, ǰ�����׸�_101 C
WHERE A.��ǰID = B.��ǰID
    AND A.���׸�ID = C.���׸�ID
    AND A.��ȸ�� = (
                    SELECT MAX(X.��ȸ��) 
                    FROM �򰡰��_101 X 
                    WHERE X.��ǰID = B.��ǰID
                        AND X.���׸�ID = C.���׸�ID
                    )
;

            
-- 3�� : �򰡵���� ���� ����ȸ���� ����� ����
SELECT
    B.��ǰID, B.��ǰ��, C.���׸�ID, C.���׸��,
    MAX(A.��ȸ��) AS ��ȸ��, 
    MAX(A.�򰡵��) AS �򰡵��,
    MAX(A.������) AS ������
FROM �򰡰��_101 A, �򰡴���ǰ_101 B, ǰ�����׸�_101 C
WHERE A.��ǰID = B.��ǰID
    AND A.���׸�ID = C.���׸�ID
GROUP BY B.��ǰID, B.��ǰ��, C.���׸�ID, C.���׸��
;

-- 4�� : �򰡵���� ���� ����ȸ���� ����� ����
SELECT
   B.��ǰID, B.��ǰ��, C.���׸�ID, C.���׸��,
    A.��ȸ��, A.�򰡵��, A.������
FROM (
        SELECT  ��ǰID, ���׸�ID, 
                MAX(��ȸ��) AS ��ȸ��,
                MAX(�򰡵��) AS �򰡵��, 
                MAX(������) AS ������
        FROM �򰡰��_101 
        GROUP BY ��ǰID, ���׸�ID
      ) A,
    �򰡴���ǰ_101 B, ǰ�����׸�_101 C
WHERE A.��ǰID = B.��ǰID
    AND A.���׸�ID = C.���׸�ID
;
            
            
            
            
            
            




            
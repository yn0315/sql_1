-- # ���ڿ� ��

-- CHARŸ�Գ����� ��
DROP TABLE CHAR_COMPARE;
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
    REPLACE(char_4, ' ', '+') AS char_4,
    REPLACE(char_6, ' ', '+') AS char_6
FROM char_compare;

SELECT 
    REPLACE(char_4, ' ', '+') AS char_4,
    REPLACE(char_6, ' ', '+') AS char_6
FROM char_compare
WHERE sn = '101'
    AND char_4 = char_6
;--�ڿ� ����� ������� ���ڸ� ������ ���ٰ� ��

SELECT 
    REPLACE(char_4, ' ', '+') AS char_4,
    REPLACE(char_6, ' ', '+') AS char_6
FROM char_compare
WHERE sn = '102'
    AND char_4 > char_6
;

SELECT * FROM char_compare;

-- ������ VARCHARŸ���� ����� ��
DROP TABLE VARCHAR_COMPARE;
CREATE TABLE VARCHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    varchar_6 VARCHAR2(6)
);

INSERT INTO varchar_compare VALUES ('101', 'SQLD', 'SQLD  ');--�ǵ������� ���� �־�� ��
INSERT INTO varchar_compare VALUES ('102', 'SQLD', 'SQLA  ');
COMMIT;

SELECT * FROM varchar_compare;

SELECT 
    REPLACE(char_4, ' ', '+') AS char_4,
    REPLACE(varchar_6, ' ', '+') AS varchar_6
FROM varchar_compare
WHERE sn = '101'
    AND char_4 = varchar_6
;

-- ������ڿ����� ��
SELECT 
    REPLACE(char_4, ' ', '+') AS char_4,
    REPLACE(varchar_6, ' ', '+') AS varchar_6
FROM varchar_compare
WHERE sn = '101'
    AND char_4 = 'SQLD    '
;

SELECT 
    REPLACE(char_4, ' ', '+') AS char_4,
    REPLACE(varchar_6, ' ', '+') AS varchar_6
FROM varchar_compare
WHERE sn = '101'
    AND varchar_6 = 'SQLD'
;--Ÿ���� �޶� ���ٰ� �Ⱥ�


-- # ������ �Լ�
-- ## ���ڿ� �Լ�
SELECT 
    LOWER('Hello WORLD'),  -- ���� �ҹ��ڷ� ��ȯ
    UPPER('hello World'),  -- ���� �빮�ڷ� ��ȯ
    INITCAP('abcdef')      -- ù���ڸ� �빮�ڷ� �������� �ҹ��ڷ� ��ȯ
FROM dual;

SELECT
    ASCII('A'), -- ���ڸ� �ƽ�Ű�ڵ��
    CHR(65)     -- �ƽ�Ű�ڵ带 ���ڷ�
FROM dual;

SELECT 
    CONCAT('SQL', 'Developer'),   -- ���ڿ��� ����
    SUBSTR('SQL Developer', 1, 3), -- ���ڿ� �ڸ� 1������ 3���ڸ� (ù���ڰ� 1��), �߿�
    LENGTH('HELLO WORLD'),         -- ���ڿ��� ����, ���� �� ����, ��������
    TRIM('    HI   ')              -- �¿� ���� ����
FROM dual;

SELECT 
    RPAD('Steve', 10, '-'), -- �����ʿ� �־��� ���ڸ� ä��
    LPAD('Steve', 10, '*'),  -- ���ʿ� �־��� ���ڸ� ä��
    REPLACE('Java Programmer', 'Java', 'BigData') AS "REPLACE" -- �ڹٸ� �����ͷ� ���ڸ� ����
    ,REPLACE('Java Programmer', 'Java') AS "REPLACE" -- �ڹٹ��ڸ� ����
FROM dual;

-- ## ������ �Լ�
SELECT 
    MOD(27, 5) AS MOD, -- ������ �� ��ȯ
    CEIL(38.678) AS ceil, -- �ø��� ��ȯ
    FLOOR(38.678) AS floor, -- ������ ��ȯ
    ROUND(38.678, 2) AS round, -- �ڸ������� �ݿø�
    TRUNC(38.678, 2) AS trunc  -- �ڸ��� ���ϸ� ����
    , ABS(-20) AS abs -- ���밪
    , SIGN(50) AS sign --0���� ������ -1, 0���� ũ�� 1, 0�̸� 0
FROM dual;

-- ## ��¥�� �Լ�

-- ���� ��¥�� ��ȸ
SELECT SYSDATE
FROM dual;

SELECT SYSTIMESTAMP
FROM dual;

-- ��¥ ����
-- ��¥ + ���� = ��¥  => ��(DAY) ���� ��¥�� ����
-- ��¥ - ���� = ��¥  => ��¥���� �� ���� ��
-- ��¥ - ��¥ = �ϼ�  => � ��¥���� �ٸ� ��¥�� �� �ϼ�
-- ��¥ + ����/24 = ��¥  => ��¥�� �ð��� ����

SELECT 
    SYSDATE AS "���� �ð�",
    SYSDATE - 1 AS "SYSDATE - 1",
    (SYSDATE + 10) - SYSDATE AS "��¥ - ��¥",--���̳��� �ϼ��� ����
    SYSDATE - (1/24) AS "1�ð� ����",
    SYSDATE - (1/24/60) * 100 AS "100�� ����",
    SYSDATE - (1/24/60/60) * 30 AS "30�� ����"
FROM dual;


-- ## ��ȯ �Լ�
SELECT * FROM char_compare
WHERE sn = 101;

-- ��¥�� ���ڷ� ��ȯ (TO_CHAR�Լ�)
-- ��¥ ��������: Y - ����, MM - ���ڸ� ��, D - �ϼ�
-- �ð� ��������: HH12 - ��(1~12)--���㱸������� ��,AM�̶�� ���� �˾Ƽ� ����
--HH24 (0-23), MI - ��, SS - ��
SELECT
    SYSDATE,--M�� �� �ΰ� ��� ��..
    TO_CHAR(SYSDATE, 'MM - DD') AS "�� - ��",
    TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS "��/��/��",
    TO_CHAR(SYSDATE, 'YYYY"��" MM"��" DD"��"') AS "��¥ - �ѱ�����",
    TO_CHAR(SYSDATE + (1/24)*6, 'YY/MM/DD HH24:MI:SS') AS "��¥�� �ð�",
    TO_CHAR(SYSDATE+ (1/24)*6, 'YY/MM/DD AM HH12:MI:SS') AS "��¥�� �ð�2"
FROM dual;

-- ���ڸ� ���ڷ� ��ȯ
-- ���� ���� ���� -  $: �޷�ǥ��, L: ����ȭ���ȣ
SELECT
    TO_CHAR(9512 * 1.33, '$999,999.99') AS "�޷�",--9�� �׳� ��¡���� ����....
    TO_CHAR(1350000, '999,999,999L') AS "��ȭ"--L�� ����ȭ��
FROM dual;

-- ���ڸ� ���ڷ� ��ȯ
SELECT 
    TO_NUMBER('$5,500', '$999,999') - 4000 AS "�����"
FROM dual;


-- CASEǥ���� DECODE�Լ�
SELECT 
    sal_cd, sal_nm,
    CASE WHEN sal_cd = '100001' THEN '�⺻�޿�' --���ǽ�
         WHEN sal_cd = '100002' THEN '���ʽ��޿�'
         ELSE '��Ÿ'
         END sal_name --AS�� ����
FROM tb_sal;

SELECT
    sal_cd,
    DECODE(sal_cd, '100001', '�⺻�޿�', '100002', '���ʽ��޿�', '��Ÿ') AS sal_name
FROM tb_sal;

-- # �� ���� �Լ�--�����߳���
-- NVL(expr1, expr2)
-- expr1: Null�� ���� �� �ִ� ���̳� ǥ����
-- expr2: expr1�� Null�� ��� ��ü�� ��
SELECT 
    emp_no,
    emp_nm,
    NVL(direct_manager_emp_no, '�ֻ���������') AS ������
FROM tb_emp;

SELECT 
    emp_nm,
    addr,
    tel_no,
    NVL(emp_nm, '�������') AS emp_nm
FROM tb_emp
WHERE emp_nm = '����ȣ';--��� �ȳ���, ������

SELECT 
    MAX(emp_nm),
    NVL(MAX(emp_nm), '�������') AS emp_nm--�̰� null�ϰ�쿡 ���� �Լ��� max�� ����
    --�����ϱ� �������� ���� max�� null�� ��
FROM tb_emp
WHERE emp_nm = '����ȣ';

-- NVL2(expr1, expr2, expr3)
-- expr1�� ���� Null�� �ƴϸ� expr2�� ��ȯ, Null�̸� expr3�� ��ȯ
SELECT 
    emp_nm,
    NVL2(direct_manager_emp_no, '�Ϲݻ��', 'ȸ���') AS ����
FROM tb_emp;

-- NULLIF(expr1, expr2)
-- �� ���� ������ NULL����, �ٸ��� expr1 ����
SELECT
    NULLIF('����ȣ', '����ȣ')
FROM dual;

SELECT
    NULLIF('����ȣ', '������')
FROM dual;

-- COALESCE(expr1, ...)
-- ���� ǥ���� �� Null�� �ƴ� ���� ���ʷ� �߰ߵǸ� �ش� ���� ����
SELECT 
    COALESCE(NULL, NULL, 3000, 4000)
FROM dual;

SELECT 
    COALESCE(NULL, 5000, NULL, 2000)
FROM dual;

SELECT 
    COALESCE(7000, NULL, NULL, 8000)
FROM dual;











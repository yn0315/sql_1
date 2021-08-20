

--SELECT �⺻
SELECT
    CERTI_CD, CERTI_NM
FROM TB_CERTI;

SELECT
    CERTI_NM
FROM TB_CERTI;

SELECT
CERTI_CD, CERTI_NM, issue_insti_nm
FROM TB_CERTI;

SELECT
*
FROM tb_certi;

--SELECT �ڿ��� ALL�� ����
SELECT ALL
    issue_insti_nm
FROM TB_CERTI;

--DISTINCT: �ߺ��� ����
SELECT DISTINCT
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    certi_nm ,issue_insti_nm
FROM TB_CERTI;

--�� ��Ī ����(ALIAS)���⼭�� "" �����/ AS�� ��������
--/���� ���ų� ��������� ""��������
SELECT
certi_cd AS "�ڰ��� �ڵ�"
, certi_nm AS "�ڰ��� �̸�"
, issue_insti_nm AS "��������"
FROM TB_CERTI;

--���տ�����(||)�� ����� �÷������� ����

SELECT
certi_nm || '(' || certi_cd || ') - ' || issue_insti_nm AS "�ڰ��� ����"
FROM TB_CERTI;

--���� ���̺�(DUAL): �ܼ� �������� ��ȸ�ϰ� ���� ��
SELECT
    (3+7)*5/10 AS "������"
FROM DUAL;

--WHERE ������: ��ȸ��� ���� �����ϴ� ������
SELECT * FROM TB_EMP;

SELECT
    EMP_NO, emp_nm,ADDR
FROM TB_EMP
WHERE SEX_CD = 1;

--PK�� ������ �����ϸ� ������ �������� ��ȸ�˴ϴ�.
SELECT
emp_no, emp_nm, tel_no
FROM TB_EMP
WHERE EMP_NO = 1000000001;

--�񱳿����� (=, <>, <, <=,>=)
--SQL�񱳿�����(BETWEEN,IN,LIKE)

SELECT
emp_no, emp_nm, birth_de, tel_no
FROM TB_EMP
WHERE BIRTH_DE>= '19900101' AND BIRTH_DE <='19991231';

--BETWEEN ������
SELECT
emp_no, emp_nm, birth_de, tel_no
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19900101' AND '19991231';

--IN������
SELECT 
emp_no, emp_nm, dept_cd
FROM TB_EMP
WHERE DEPT_CD = '100004'
OR DEPT_CD = '100006'
;

--���� ����

SELECT 
emp_no, emp_nm, dept_cd
FROM TB_EMP
WHERE DEPT_CD IN ('100004', '100006')--IN �ڿ� �����ϴ� �����ʹ� �� OR�� ó���ؼ� ������
;

SELECT 
emp_no, emp_nm, dept_cd
FROM TB_EMP
WHERE DEPT_CD NOT IN ('100004', '100006')
;

--LIKE������
--���ϵ�ī�� ���� - %: 1���� �̻� ����, _: �� 1���� ����
SELECT
emp_no, emp_nm
FROM TB_EMP
WHERE EMP_NM LIKE '��%';--'��'�ڿ� �� ���ڰ� ������ �������

SELECT
emp_no, emp_nm
FROM TB_EMP
WHERE EMP_NM LIKE '%��';

SELECT
emp_no, emp_nm
FROM TB_EMP
WHERE EMP_NM LIKE '��__';--����� �ϳ��� �ѱ��ھ���, �ϳ��� ���� �ƹ��� ������� ����
--����̸� �߿� ���ڰ� ���

--������� ����� �����ϱ�
SELECT
EMP_NM, ADDR, TEL_NO
FROM TB_EMP
WHERE ADDR LIKE '%����%';--�ּ� �߰��� ������ ���Ե� ��, �˻��� �� ���� �� 


-- ������ �达�̸鼭, �μ��� 100003, 100004, 100006�� �߿� �ϳ��̸鼭, 
-- 90������ ����� ���, �̸�, ����, �μ��ڵ带 ��ȸ

SELECT
EMP_NO,
EMP_NM,
BIRTH_DE,
DEPT_CD
FROM TB_EMP 
WHERE EMP_NM LIKE '��%'
AND DEPT_CD IN ('100003', '100004', '100006')
AND BIRTH_DE BETWEEN '19900101' AND '19991231';


--NULL�� ��ȸ IS NULL �̶�� �����!! = ���� �ȵ�
SELECT
emp_no, emp_nm, DIRECT_MANAGER_EMP_NO
FROM TB_EMP
WHERE DIRECT_MANAGER_EMP_NO IS NULL;

SELECT
emp_no, emp_nm, DIRECT_MANAGER_EMP_NO
FROM TB_EMP
WHERE DIRECT_MANAGER_EMP_NO IS NOT NULL;

--���� �񱳿�����
SELECT
emp_no, emp_nm, SEX_CD, dept_cd
FROM TB_EMP
WHERE EMP_NM LIKE '��%'
AND SEX_CD <> 1;  --���ڰ� �ƴ� ������� != �� ���� �ǹ�!! 


--AND�� OR�� �켱����
SELECT
    EMP_NO, EMP_NM, ADDR, DEPT_CD
FROM TB_EMP
WHERE EMP_NM LIKE '��%'
    AND DEPT_CD IN('100004', '100006')
    AND (ADDR LIKE '%����%' OR ADDR LIKE '%����%');
    --OR�տ������� �� ����� ���� ������ �� �����ϴ� ����� 
    --�����Ϸ��� OR���� ��ȣ�� ����� ��

SELECT
    EMP_NO, EMP_NM, ADDR, DEPT_CD
FROM TB_EMP
WHERE EMP_NM LIKE '��%'
    AND DEPT_CD IN('100004', '100006')
    AND NOT(ADDR LIKE '%����%' OR ADDR LIKE '%����%');
















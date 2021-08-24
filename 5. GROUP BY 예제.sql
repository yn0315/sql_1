

--#GROUP BY, HAVING
--1. �����Լ�
SELECT
COUNT(emp_no) AS "�� �����"
, MAX(birth_de)AS "���� � ���"
, MIN(birth_de)AS "���� ���� ���� ���"
FROM tb_emp;

SELECT
COUNT(*),--��ȸ�� ����(NULL����)
COUNT(direct_manager_emp_no)--��ȸ�� ���� ��
FROM tb_emp;


--GROUP BY :���̺� ������ �׷�ȭ�� ��
--EX) �μ����� ���� ������ �������, ���� ���̸��� ����� �������, �μ��� �������� �˰����
SELECT emp_nm, birth_de, dept_cd
FROM tb_emp
ORDER BY dept_cd ASC; --����: ASC-������(�⺻��)//DESC(������)

SELECT
dept_cd,
COUNT(*) AS "�μ��� ���� ��",
MAX(birth_de)AS "�μ� ����",
MIN(birth_de)AS "�μ� ������"
FROM tb_emp
GROUP BY dept_cd
ORDER BY dept_cd;

--HAVING��: �׷�ȭ�� ������� ������ �ɾ� �� ���� ����
SELECT
dept_cd,
COUNT(*) AS "�μ��� ���� ��",
MAX(birth_de)AS "�μ� ����",
MIN(birth_de)AS "�μ� ������"
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT(*)>=2 --1�� �̻��� �μ��� �����϶�
ORDER BY dept_cd;


--������� �޿��� ���� ���� ���� �׼�, ���� ���� ���� �׼�, ��� �׼� ��ȸ
SELECT * FROM tb_sal_his
ORDER BY emp_no, pay_de;--emp_no�� ������ �� ���� ���鳢���� pay_de�� ������

SELECT 
emp_no,
MAX(pay_amt)AS "�ְ���ɾ�",
MIN(pay_amt)AS "�������ɾ�",
TO_CHAR(ROUND(AVG(pay_amt),2), 'L999,999,999.99')AS "��ռ��ɾ�"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no;

--��� �޿��� 470���� �̻��� ����� ��ȸ�ϰ� ����--HAVING�����
--where�� �׷�ȭ ������ having�� �׷�ȭ ������
SELECT 
emp_no,
MAX(pay_amt)AS "�ְ���ɾ�",
MIN(pay_amt)AS "�������ɾ�",
TO_CHAR(ROUND(AVG(pay_amt),2), 'L999,999,999.99')AS "��ռ��ɾ�"
FROM tb_sal_his
GROUP BY emp_no
HAVING AVG(pay_amt)>=4500000
ORDER BY emp_no;

--2019�� 1�Ⱓ ��� �޿��� 470���� �̻��� ����� ��ȸ�ϰ� ����
--where�����

SELECT 
emp_no,
MAX(pay_amt)AS "�ְ���ɾ�",
MIN(pay_amt)AS "�������ɾ�",
TO_CHAR(ROUND(AVG(pay_amt),2), 'L999,999,999.99')AS "��ռ��ɾ�"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt)>=4500000
ORDER BY emp_no;


--2019�� 1�Ⱓ ����� ������ �߰� ��ȸ
SELECT 
emp_no,
MAX(pay_amt)AS "�ְ���ɾ�",
MIN(pay_amt)AS "�������ɾ�",
TO_CHAR(ROUND(AVG(pay_amt),2), 'L999,999,999.99')AS "��ռ��ɾ�",
TO_CHAR(ROUND(SUM(pay_amt),2), 'L999,999,999')AS "����"

FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no;


--���� ORDER BY
--ASC:������(�⺻��)//DESC:������
--�׻� SELECT���� �� ������ �ٿ� ��ġ
SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_no DESC;

SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_NM;

SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY 2 DESC;--��ȸ�÷� ������ ���ڷ� �� �̸�(EMP_NM)��������

SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm DESC, emp_no DESC;

--���� ����
SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY 2 DESC, 1 DESC;

--������ �� ��Ī�� �� �� ����
SELECT emp_no AS eno,
emp_nm AS enm,
addr
FROM tb_emp
ORDER BY eno DESC;


SELECT
 emp_nm --41�� ����
 --COUNT(emp_no) AS cnt--1�� ����, �׷��Լ���, �Ϲ��÷��ϰ� ���� �ȵ�, �����Լ����� �����
FROM tb_emp;

--ORDER BY�� �׻� �� ������..











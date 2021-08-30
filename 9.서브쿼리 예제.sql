

--# ������ ��������
--���������� ��ȸ����� 1�� ������ ���

--�μ���ȣ�� 100004���� �μ��� ��� ������� ��ȸ
SELECT
*
FROM tb_emp
WHERE dept_cd= '100004'
;

--�̳��� �����ִ� �μ��� ��� ������� ��ȸ

SELECT
*
FROM tb_emp
WHERE dept_cd= (
        SELECT dept_cd 
        FROM tb_emp 
        WHERE emp_nm = '�̳���'
)
;

--SELECT
--*
--FROM tb_emp
--WHERE dept_cd= (
--        SELECT dept_cd 
--        FROM tb_emp 
--        WHERE emp_nm = '�̰���'--�� ���̶� �� ����, ������ ���������� �� �ุ ���;� �ؼ�!
--)
--;

--20200525�� ���� �޿��� ȸ���� 20200525 ��ü ��� �޿����� ���� ������� ���� ��ȸ

SELECT
A.emp_no, A.emp_nm, B.pay_de, B.pay_amt
FROM tb_emp A
JOIN tb_sal_his B
ON A.emp_no = B.emp_no
WHERE B.pay_de = '20200525'
    AND B.pay_amt >= (
            SELECT
            AVG(pay_amt)
            FROM tb_sal_his
            WHERE pay_de = '20200525'
    )
ORDER BY A.emp_no, B.pay_de
;

--#���� �� ��������
--�������� ��ȸ �Ǽ��� ���� ���� ��

--�ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ� �����ȣ�� ���� �ڰ��� ������ ��ȸ

SELECT
*
FROM tb_certi
WHERE issue_insti_nm = '�ѱ������ͺ��̽������';

SELECT A.emp_no,B.emp_nm, COUNT(certi_cd) 
FROM tb_emp_certi A, tb_emp B
WHERE certi_cd IN ('100001', '100002', '100003', '100004', '100005', '100006')
AND A.emp_no = B.emp_no
GROUP BY A.emp_no, B.emp_nm -- �׷������ ����÷��� select�� �� �� ����
ORDER BY A.emp_no;


--������ �������������� ��ȣ ���� �ȵ� ,IN ������ ��

SELECT A.emp_no,B.emp_nm, COUNT(certi_cd) 
FROM tb_emp_certi A, tb_emp B
WHERE certi_cd IN (
        SELECT certi_cd FROM tb_certi
        WHERE issue_insti_nm = '�ѱ������ͺ��̽������'
)
AND A.emp_no = B.emp_no
GROUP BY A.emp_no, B.emp_nm -- �׷������ ����÷��� select�� �� �� ����
ORDER BY A.emp_no;


--#�����÷� ��������

--�μ����� 2�� �̻��� �μ� �߿��� �� �μ��� ���� ���� ���� ����� ��������� ��ȸ

SELECT
    A.emp_no, A.emp_nm, A.birth_de, A.dept_cd
FROM tb_emp A 
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
WHERE (A.dept_cd, A.birth_de) IN(
                SELECT
                dept_cd, MIN(birth_de)-- ���� where���� ������ ��ġ�ؾ� ��
                FROM tb_emp
                GROUP BY dept_cd
                HAVING COUNT(*)>=2
)
ORDER BY A.emp_no
;

SELECT
dept_cd, MIN(birth_de)
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT(*)>=2
;


--EXISTS��

--�ּҰ� ������ �������� �ٹ��ϰ� �ִ� �μ����� ��ü������ ��ȸ
SELECT DISTINCT
a.dept_cd, a.dept_nm
FROM tb_dept A, tb_emp B
WHERE A.dept_cd = B.dept_cd
AND B.addr LIKE '%����%'
ORDER BY A.dept_cd
;

SELECT * FROM tb_emp WHERE addr LIKE'%����%';

SELECT
A.dept_cd, A.dept_nm
FROM tb_dept A
WHERE EXISTS (
    SELECT
    'x'--1�̳� x ���� ��, 
    FROM tb_emp B
    WHERE B.addr LIKE'%����%'
    AND A.dept_cd = B.dept_cd --����ó�� ������ ����� ��

)
;

SELECT
A.dept_cd, A.dept_nm
FROM tb_dept A
WHERE NOT EXISTS (
    SELECT
    'x'--1�̳� x ���� ��, 
    FROM tb_emp B
    WHERE B.addr LIKE'%����%'
    AND A.dept_cd = B.dept_cd --����ó�� ������ ����� ��

)
;

    SELECT
    1--�ִ��� Ȯ���ϱ� ���� �׳� ���� �뵵
    FROM tb_emp
    WHERE addr LIKE'%����%';

--#��Į�� ��������(select���� ���� ��������)

SELECT
A.emp_no, A.emp_nm, 
B.dept_nm
, A.addr, A.birth_de, A.sex_cd
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
;

SELECT
A.emp_no, A.emp_nm, 
(SELECT B.dept_nm FROM tb_dept B WHERE A.dept_cd = B.dept_cd) AS dept_nm
, A.addr, A.birth_de, A.sex_cd
FROM tb_emp A

;


--#�ζ��� ��(from�� �ȿ� �ִ� ��������)
SELECT
X.emp_nm, X.dept_nm
FROM(SELECT
        A.emp_no, A.emp_nm, 
        B.dept_nm
        , A.addr, A.birth_de, A.sex_cd
        FROM tb_emp A
        JOIN tb_dept B
        ON A.dept_cd = B.dept_cd)X 
;









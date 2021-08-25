

--���α���
SELECT 
emp_no, emp_nm, dept_cd
FROM tb_emp;

--2���� ���̺� ����
SELECT
E.emp_no, 
E.emp_nm, 
E.dept_cd, 
D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd;--��������...


--�ڰ��� ���� ���̺�
SELECT * FROM tb_certi;

--����� ����� �ڰ��� ���� ���̺�
SELECT
    *
FROM tb_emp_certi;

SELECT
E.emp_no, E.emp_nm,
EC.certi_cd, EC.acqu_de
FROM tb_emp E, tb_emp_certi EC
WHERE E.emp_no = EC.emp_no;

SELECT
c.certi_cd, c.certi_nm, c.issue_insti_nm,
EC.acqu_de, ec.emp_no
FROM tb_certi C, tb_emp_certi EC
WHERE c.certi_cd= EC.certi_cd;

--3���� ���̺� ����
SELECT
A.emp_no, A.emp_nm, B.certi_cd,
B.certi_nm, C.acqu_de
FROM tb_emp A, tb_certi B, tb_emp_certi C
WHERE A.emp_no = C.emp_no
AND B.certi_cd = C.certi_cd
;

SELECT
A.emp_no, A.emp_nm, B.certi_cd,
B.certi_nm, C.acqu_de
FROM tb_emp A, tb_certi B, tb_emp_certi C
WHERE A.emp_no = C.emp_no
AND B.certi_cd = C.certi_cd
AND a.emp_nm like '��%'
and c.acqu_de BETWEEN '20190101' AND '20191231'
ORDER BY c.acqu_de
;



CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY
    , content VARCHAR2(200)
);
CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY
    , reply VARCHAR2(100)
    , a_id NUMBER(10)
);

INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, '������', 1);
INSERT INTO TEST_B  VALUES (2, '������', 1);
INSERT INTO TEST_B  VALUES (3, '������', 2);
INSERT INTO TEST_B  VALUES (4, '������', 3);
COMMIT;

SELECT*FROM TEST_A;
SELECT*FROM TEST_B;


SELECT
A.id, A.content,B.b_id, B.reply
FROM TEST_A A, TEST_B B
WHERE A.id = B.a_id;--�������� �� �ɾ�θ� cross join��, ī�׽þ� ��..



















SELECT first_name, last_name, salary
FROM employees
WHERE LOWER(last_name) = 'king';
--�̸��� �ҹ��ڿ����� �빮�ڿ����� �� �� �ƿ� 
--�ҹ��ڷ� �ٲ������ ��

-- # �ǽ����� 
-- 1. employees ���̺��� ��� ����� first_name�� first_name�� ���� ���� ��ȸ�ϼ���.
SELECT
first_name,
LENGTH('first_name') AS "�̸� ���ڼ�"
FROM employees;

-- 2. employees ���̺��� first_name�� last_name�� �� ���� ������ �̸��� ��ȸ�ϼ���.
SELECT
first_name, last_name
,CONCAT(first_name, last_name) AS "full name"
FROM employees;

-- 3. employees ���̺��� job_id�� it_prog�� ����� first_name�� salary�� ����ϼ���.

--  ����1 ) ���ϱ� ���� ���� �ҹ��ڷ� �Է��� ��!
--  ����2 ) �̸��� �� 3���ڱ����� ����ϰ� �������� *�� ��ŷ�� ��. �� ���� ��Ī�� name�Դϴ�.
--  ����3 ) �޿��� ��ü 10�ڸ��� ����ϵ� �������ڸ��� *�� ����մϴ�. �� ���� ��Ī�� salary�Դϴ�.

SELECT
RPAD(SUBSTR(first_name, 1,3),LENGTH(first_name), '*') AS "name",--����2
LPAD(salary, 10, '*') AS salary--����3

FROM employees
WHERE LOWER(job_id)= ('it_prog')--���� 1
;











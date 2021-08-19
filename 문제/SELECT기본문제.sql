-- �ǽ� 1 
-- 1. employees���̺��� first_name, last_name, salary�� ��ȸ�ϼ���.

SELECT
    first_name
    ,last_name
    ,salary
from employees;

-- 2. departments���̺��� department_id, department_name, manager_id, location_id�� ��ȸ�ϼ���.

SELECT
department_id
,department_name
,manager_id
,location_id
FROM departments;

-- 3. employees���̺��� first_name�� ��Ī�� '�̸�', salary�� ��Ī�� '�޿�'�� ��ȸ�ϼ���.

SELECT
first_name AS "�̸�"
, salary "�޿�"
FROM EMPLOYEES;

-- 4. employees���̺��� ��������� first_name + last_name + '�� �޿��� $' + salary + '�Դϴ�.' 
--    �� ���·� �����Ͽ� '�������' ��� ��Ī�� �ο��Ͽ� �ϳ��� �÷����� ��ȸ�ϼ���.

SELECT
    first_name || last_name || '�� �޿��� $' || salary ||'�Դϴ�.' AS "�������"
FROM EMPLOYEES;

-- 5. employees���̺��� department_id�� �ߺ��� �����Ͽ� ��ȸ�ϼ���.

SELECT DISTINCT
department_id 
FROM EMPLOYEES;












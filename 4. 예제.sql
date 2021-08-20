-- �ǽ� 2
-- 1. employees���̺��� job_id�� 'IT_PROG'�� ����� first_name, job_id, department_id�� ��ȸ�ϼ���.

SELECT
first_name, job_id, department_id
FROM EMPLOYEES
WHERE job_id like 'IT_PROG'; --����ǥ ���� ���ڴ� ��ҹ��� �����ؾ� ��
-- 2. employees���̺��� last_name�� 'King'�� ����� first_name, last_name, hire_date�� ��ȸ�ϼ���.

SELECT
first_name, last_name, hire_date
FROM EMPLOYEES
WHERE last_name like 'King'; 

-- 3. employees���̺��� salary�� 15000���� ũ�ų� ���� ����� first_name, salary, hire_date�� ��ȸ�ϼ���.

SELECT
first_name, salary, hire_date
FROM EMPLOYEES
WHERE SALARY >=15000; 
-- 4. employees���̺��� salary�� 10000�� 12000 ���̿� �ִ� ����� first_name, salary�� ��ȸ�ϼ���.

SELECT
first_name, salary, hire_date
FROM EMPLOYEES
WHERE SALARY BETWEEN '10000'AND '12000'; 
-- 5. employees���̺��� manager_id�� 101, 102, 103�߿� ���ϴ� ����� first_name, salary, manager_id�� ��ȸ�ϼ���.

SELECT
first_name, salary, manager_id
FROM EMPLOYEES
WHERE manager_id IN ('101','102','103'); 

-- 6. employees���̺��� job_id�� 'IT_PROG', 'FI_MGR'�߿� ���Ե��� �ʴ� ����� first_name, job_id�� ��ȸ�ϼ���.

SELECT
first_name, job_id
FROM EMPLOYEES
WHERE job_id NOT IN ('IT_PROG','FI_MGR'); 

-- 7. employees���̺��� job_id�� 'IT'�� �����ϴ� ����� first_name, last_name, job_id�� ��ȸ�ϼ���.

SELECT
first_name,last_name, job_id
FROM EMPLOYEES
WHERE job_id like ('IT%'); 

-- 8. employees���̺��� email�� �ι�° ���ڰ� A�� ����� first_name, email�� ��ȸ�ϼ���.

SELECT
first_name, email
FROM EMPLOYEES
WHERE email like ('_A%'); 

-- 9. employees���̺��� manager_id�� null�� ����� first_name, manager_id�� ��ȸ�ϼ���.

SELECT
first_name, manager_id
FROM EMPLOYEES
WHERE manager_id is null; 

-- 10. employees���̺��� commission_pct�� null�� �ƴ� ����� first_name, job_id, commission_pct�� ��ȸ�ϼ���.

SELECT
first_name, job_id, commission_pct
FROM EMPLOYEES
WHERE commission_pct is not null; 

-- 11. employees���̺��� job_id�� 'IT_PROG'�̰� salary�� 5000�̻��� �����
--     first_name, job_id, salary�� ��ȸ�ϼ���.

SELECT
first_name, job_id, salary
FROM EMPLOYEES
WHERE job_id like ('IT_PROG')
AND SALARY>= 5000; 

-- 12. employees���̺��� job_id�� 'IT_PROG'�̰ų� salary�� 5000�̻��� �����
--     first_name, job_id, salary�� ��ȸ�ϼ���.

SELECT
first_name, job_id, salary
FROM EMPLOYEES
WHERE job_id like ('IT_PROG')
OR SALARY>= 5000; 

-- 13. employees���̺��� job_id�� 'IT_PROG'�̰ų� 'FI_MGR'�̸鼭 salary�� 5000�̻��� �����
--     first_name, job_id, salary�� ��ȸ�ϼ���.

SELECT
first_name, job_id, salary
FROM EMPLOYEES
WHERE (job_id='IT_PROG' OR job_id = 'FI_MGR')
AND SALARY>= 5000; 
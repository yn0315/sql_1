

-- �ǽ�����

-- 1. employees���̺��� �� ����� �μ��� �μ� ��ȣ(department_id)�� ��� �޿�(salary)�� ��ȸ�ϼ���. 

SELECT
NVL(department_id, 0) AS "�μ���ȣ",--NULL�ڸ��� 0�� ����
ROUND(AVG(salary),2) AS "��ձ޿�"
FROM employees
GROUP BY department_id
ORDER by "�μ���ȣ";--�̷��� ���� 0�� �׳� ���ڷ� ���� ���� ���� ��ġ��
--ORDER BY department_id;--����Ŭ�� ���� ���� ũ�� �� �׷��� ���� ������ ��ġ��

-- 2. employees���̺��� �μ��� �μ� ��ȣ(department_id)�� �μ��� �� ��� ���� ��ȸ�ϼ���.

SELECT
NVL(department_id, 0) AS "�μ���ȣ",--NULL�ڸ��� 0�� ����
COUNT(employee_id) AS TOTAL_COUNT
FROM employees
GROUP BY department_id;



-- 3. employees���̺��� �μ��� �޿� ����� 8000�� �ʰ��ϴ� �μ��� �μ���ȣ�� �޿� ����� ��ȸ�ϼ���.

SELECT
NVL(department_id, 0) AS "�μ���ȣ",
ROUND(AVG(salary),2)AS "�޿����"
FROM employees
GROUP BY department_id
HAVING AVG(salary)>8000;--�� �κ��� ��Ī ���� �ȵ�

-- 4. employees���̺��� �޿� ����� 8000�� �ʰ��ϴ� �� ����(job_id)�� ���Ͽ� 
--    ���� �̸�(job_id)�� SA�� �����ϴ� ����� �����ϰ� ���� �̸��� �޿� ����� 
--    �޿� ����� ���� ������ �����Ͽ� ��ȸ�ϼ���.


SELECT
job_id,
ROUND(AVG(salary),2) AS "�޿����"
FROM employees
WHERE job_id NOT LIKE'SA%'
GROUP BY job_id  
HAVING AVG(salary)>8000
ORDER BY 2 DESC;--����� ���� ������� ��ġ, ��������

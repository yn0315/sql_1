
--OUTER JOIN �߰�����
SELECT * FROM job_history ORDER BY employee_id;

--��� ����� ������ ��ȸ�Ұǵ� Ȥ�� ���������̷��� ������ �Բ� ��ȸ�ϰ� �ʹ�.
SELECT
E.employee_id, E.first_name, E.hire_date, E.job_id AS "current job",
J.start_date, J.end_date, J.job_id AS "last job"
FROM employees E 
JOIN job_history J
ON E.employee_id = J.employee_id;


SELECT
E.employee_id, E.first_name, E.hire_date, E.job_id AS "current job",
J.start_date, J.end_date, J.job_id AS "last job"
FROM employees E 
LEFT JOIN job_history J
ON E.employee_id = J.employee_id;


-- �ǽ����� (JOIN)
-- 1. �����ȣ�� 103���� ����� �̸�(employee_name)�� �Ŵ��� �̸�(manager_name)�� ����ϼ���.

SELECT
a.employee_id, a.first_name, a.manager_id, b.first_name As"manager_name"
FROM employees A
JOIN employees B
ON A.manager_id= b.employee_id
WHERE A.employee_id = 103
ORDER BY A.employee_id;

-- 2. ��� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� ��ȸ�ϼ���.
-- employees, departments, locations 3�� ����

SELECT
e.first_name, d.department_name,
L.street_address || ',' || L.city || ',' || L.state_province AS "address"
FROM employees E 
LEFT JOIN departments D
ON e.department_id = D.department_id
LEFT JOIN locations L
on d.location_id = l.location_id
;


-- 3. 103�� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.

SELECT
e.first_name, d.department_name,
L.street_address || ',' || L.city || ',' || L.state_province AS "address"
FROM employees E 
LEFT JOIN departments D
ON e.department_id = D.department_id
LEFT JOIN locations L
on d.location_id = l.location_id
WHERE e.employee_id = 103
;

-- 4. �μ� �̸��� IT�� �����ϴ� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.

SELECT
e.first_name, d.department_name,
L.street_address || ',' || L.city || ',' || L.state_province AS "address"
FROM employees E 
LEFT JOIN departments D
ON e.department_id = D.department_id
LEFT JOIN locations L
on d.location_id = l.location_id
WHERE d.department_name LIKE 'IT%'
;



-- 5. jobs���̺��� ��� ���� id(job_id)�� ������(job_title)�� ��ȸ�ϴµ� 
--    ���� �������� �̷��� �ִٸ� �ش� �̷� ���� 
-- (start_date, end_date, job_id, employee_id, first_name, department_id, department_name)
--    �� �Բ� ��ȸ�ϼ���.

SELECT
j.job_id,J.job_title, 
h.start_date, h.end_date, h.job_id, h.employee_id, 
e.first_name, e.department_id, d.department_name
FROM jobs J 
LEFT JOIN job_history H
ON J.job_id =H.job_id
LEFT JOIN employees E
ON H.employee_id = E.employee_id
LEFT JOIN departments D
ON E.department_id = D.department_id
;






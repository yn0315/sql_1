

--#������ ���� �߰� ����

SELECT
employee_id, first_name, manager_id, level
FROM employees
START WITH employee_id = 185
CONNECT BY employee_id = PRIOR manager_id
ORDER SIBLINGS BY first_name
;
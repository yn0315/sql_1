
--OUTER JOIN 추가예제
SELECT * FROM job_history ORDER BY employee_id;

--모든 사원의 정보를 조회할건데 혹시 직무변동이력이 있으면 함께 조회하고 싶다.
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


-- 실습문제 (JOIN)
-- 1. 사원번호가 103번인 사원의 이름(employee_name)과 매니저 이름(manager_name)을 출력하세요.

SELECT
a.employee_id, a.first_name, a.manager_id, b.first_name As"manager_name"
FROM employees A
JOIN employees B
ON A.manager_id= b.employee_id
WHERE A.employee_id = 103
ORDER BY A.employee_id;

-- 2. 모든 사원의 first_name과 department_name, 
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 조회하세요.
-- employees, departments, locations 3개 조인

SELECT
e.first_name, d.department_name,
L.street_address || ',' || L.city || ',' || L.state_province AS "address"
FROM employees E 
LEFT JOIN departments D
ON e.department_id = D.department_id
LEFT JOIN locations L
on d.location_id = l.location_id
;


-- 3. 103번 사원의 first_name과 department_name, 
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 
--    지정하여 조회하세요.

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

-- 4. 부서 이름이 IT로 시작하는 사원의 first_name과 department_name, 
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 
--    지정하여 조회하세요.

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



-- 5. jobs테이블에서 모든 직무 id(job_id)와 직무명(job_title)을 조회하는데 
--    만약 직무변동 이력이 있다면 해당 이력 정보 
-- (start_date, end_date, job_id, employee_id, first_name, department_id, department_name)
--    도 함께 조회하세요.

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






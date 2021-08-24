

-- 실습문제

-- 1. employees테이블에서 각 사원의 부서별 부서 번호(department_id)와 평균 급여(salary)를 조회하세요. 

SELECT
NVL(department_id, 0) AS "부서번호",--NULL자리에 0을 넣음
ROUND(AVG(salary),2) AS "평균급여"
FROM employees
GROUP BY department_id
ORDER by "부서번호";--이렇게 쓰면 0을 그냥 숫자로 봐서 가장 먼저 배치됨
--ORDER BY department_id;--오라클은 널을 가장 크게 봄 그래서 가장 밑으로 배치됨

-- 2. employees테이블에서 부서별 부서 번호(department_id)와 부서별 총 사원 수를 조회하세요.

SELECT
NVL(department_id, 0) AS "부서번호",--NULL자리에 0을 넣음
COUNT(employee_id) AS TOTAL_COUNT
FROM employees
GROUP BY department_id;



-- 3. employees테이블에서 부서의 급여 평균이 8000을 초과하는 부서의 부서번호와 급여 평균을 조회하세요.

SELECT
NVL(department_id, 0) AS "부서번호",
ROUND(AVG(salary),2)AS "급여평균"
FROM employees
GROUP BY department_id
HAVING AVG(salary)>8000;--이 부분은 별칭 쓰면 안됨

-- 4. employees테이블에서 급여 평균이 8000을 초과하는 각 직무(job_id)에 대하여 
--    직무 이름(job_id)이 SA로 시작하는 사원은 제외하고 직무 이름과 급여 평균을 
--    급여 평균이 높은 순서로 정렬하여 조회하세요.


SELECT
job_id,
ROUND(AVG(salary),2) AS "급여평균"
FROM employees
WHERE job_id NOT LIKE'SA%'
GROUP BY job_id  
HAVING AVG(salary)>8000
ORDER BY 2 DESC;--평균이 높은 순서대로 배치, 내림차순

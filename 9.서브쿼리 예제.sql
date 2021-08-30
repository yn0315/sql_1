

--# 단일행 서브쿼리
--서브쿼리의 조회결과가 1건 이하인 경우

--부서번호가 100004번인 부서의 모든 사원정보 조회
SELECT
*
FROM tb_emp
WHERE dept_cd= '100004'
;

--이나라가 속해있는 부서의 모든 사원정보 조회

SELECT
*
FROM tb_emp
WHERE dept_cd= (
        SELECT dept_cd 
        FROM tb_emp 
        WHERE emp_nm = '이나라'
)
;

--SELECT
--*
--FROM tb_emp
--WHERE dept_cd= (
--        SELECT dept_cd 
--        FROM tb_emp 
--        WHERE emp_nm = '이관심'--두 명이라 안 나옴, 단일행 서브쿼리는 한 행만 나와야 해서!
--)
--;

--20200525에 받은 급여가 회사의 20200525 전체 평균 급여보다 높은 사원들의 정보 조회

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

--#다중 행 서브쿼리
--서브쿼리 조회 건수가 여러 행인 것

--한국데이터베이스진흥원에서 발급한 자격증을 가지고 있는 사원번호와 보유 자격증 개수를 조회

SELECT
*
FROM tb_certi
WHERE issue_insti_nm = '한국데이터베이스진흥원';

SELECT A.emp_no,B.emp_nm, COUNT(certi_cd) 
FROM tb_emp_certi A, tb_emp B
WHERE certi_cd IN ('100001', '100002', '100003', '100004', '100005', '100006')
AND A.emp_no = B.emp_no
GROUP BY A.emp_no, B.emp_nm -- 그룹바이한 대상컬럼만 select에 쓸 수 있음
ORDER BY A.emp_no;


--다중행 서브쿼리에서는 등호 쓰면 안됨 ,IN 같은거 씀

SELECT A.emp_no,B.emp_nm, COUNT(certi_cd) 
FROM tb_emp_certi A, tb_emp B
WHERE certi_cd IN (
        SELECT certi_cd FROM tb_certi
        WHERE issue_insti_nm = '한국데이터베이스진흥원'
)
AND A.emp_no = B.emp_no
GROUP BY A.emp_no, B.emp_nm -- 그룹바이한 대상컬럼만 select에 쓸 수 있음
ORDER BY A.emp_no;


--#다중컬럼 서브쿼리

--부서원이 2명 이상인 부서 중에서 각 부서의 가장 나이 많은 사람의 사원정보를 조회

SELECT
    A.emp_no, A.emp_nm, A.birth_de, A.dept_cd
FROM tb_emp A 
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
WHERE (A.dept_cd, A.birth_de) IN(
                SELECT
                dept_cd, MIN(birth_de)-- 위에 where절과 순서도 일치해야 함
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


--EXISTS문

--주소가 강남인 직원들이 근무하고 있는 부서들의 전체정보를 조회
SELECT DISTINCT
a.dept_cd, a.dept_nm
FROM tb_dept A, tb_emp B
WHERE A.dept_cd = B.dept_cd
AND B.addr LIKE '%강남%'
ORDER BY A.dept_cd
;

SELECT * FROM tb_emp WHERE addr LIKE'%강남%';

SELECT
A.dept_cd, A.dept_nm
FROM tb_dept A
WHERE EXISTS (
    SELECT
    'x'--1이나 x 자주 씀, 
    FROM tb_emp B
    WHERE B.addr LIKE'%강남%'
    AND A.dept_cd = B.dept_cd --조인처럼 조건을 써줘야 함

)
;

SELECT
A.dept_cd, A.dept_nm
FROM tb_dept A
WHERE NOT EXISTS (
    SELECT
    'x'--1이나 x 자주 씀, 
    FROM tb_emp B
    WHERE B.addr LIKE'%강남%'
    AND A.dept_cd = B.dept_cd --조인처럼 조건을 써줘야 함

)
;

    SELECT
    1--있는지 확인하기 위해 그냥 찍어보는 용도
    FROM tb_emp
    WHERE addr LIKE'%강남%';

--#스칼라 서브쿼리(select절에 들어가는 서브쿼리)

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


--#인라인 뷰(from절 안에 넣는 서브쿼리)
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









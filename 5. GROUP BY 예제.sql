

--#GROUP BY, HAVING
--1. 집계함수
SELECT
COUNT(emp_no) AS "총 사원수"
, MAX(birth_de)AS "가장 어린 사람"
, MIN(birth_de)AS "가장 나이 많은 사람"
FROM tb_emp;

SELECT
COUNT(*),--김회장 포함(NULL포함)
COUNT(direct_manager_emp_no)--김회장 빼고 셈
FROM tb_emp;


--GROUP BY :테이블 내에서 그룹화할 때
--EX) 부서별로 가장 어린사람의 생년월일, 가장 나이많은 사람의 생년월일, 부서별 직원수를 알고싶음
SELECT emp_nm, birth_de, dept_cd
FROM tb_emp
ORDER BY dept_cd ASC; --정렬: ASC-오름차(기본값)//DESC(내림차)

SELECT
dept_cd,
COUNT(*) AS "부서별 직원 수",
MAX(birth_de)AS "부서 막내",
MIN(birth_de)AS "부서 연장자"
FROM tb_emp
GROUP BY dept_cd
ORDER BY dept_cd;

--HAVING절: 그룹화된 결과에서 조건을 걸어 행 수를 제한
SELECT
dept_cd,
COUNT(*) AS "부서별 직원 수",
MAX(birth_de)AS "부서 막내",
MIN(birth_de)AS "부서 연장자"
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT(*)>=2 --1명 이상의 부서만 추출하라
ORDER BY dept_cd;


--사원별로 급여를 제일 많이 받은 액수, 제일 적게 받은 액수, 평균 액수 조회
SELECT * FROM tb_sal_his
ORDER BY emp_no, pay_de;--emp_no로 정렬한 후 같은 값들끼리는 pay_de로 재정렬

SELECT 
emp_no,
MAX(pay_amt)AS "최고수령액",
MIN(pay_amt)AS "최저수령액",
TO_CHAR(ROUND(AVG(pay_amt),2), 'L999,999,999.99')AS "평균수령액"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no;

--평균 급여가 470만원 이상인 사원만 조회하고 싶음--HAVING써야함
--where은 그룹화 전조건 having은 그룹화 후조건
SELECT 
emp_no,
MAX(pay_amt)AS "최고수령액",
MIN(pay_amt)AS "최저수령액",
TO_CHAR(ROUND(AVG(pay_amt),2), 'L999,999,999.99')AS "평균수령액"
FROM tb_sal_his
GROUP BY emp_no
HAVING AVG(pay_amt)>=4500000
ORDER BY emp_no;

--2019년 1년간 평균 급여가 470만원 이상인 사원만 조회하고 싶음
--where써야함

SELECT 
emp_no,
MAX(pay_amt)AS "최고수령액",
MIN(pay_amt)AS "최저수령액",
TO_CHAR(ROUND(AVG(pay_amt),2), 'L999,999,999.99')AS "평균수령액"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt)>=4500000
ORDER BY emp_no;


--2019년 1년간 사원별 연봉을 추가 조회
SELECT 
emp_no,
MAX(pay_amt)AS "최고수령액",
MIN(pay_amt)AS "최저수령액",
TO_CHAR(ROUND(AVG(pay_amt),2), 'L999,999,999.99')AS "평균수령액",
TO_CHAR(ROUND(SUM(pay_amt),2), 'L999,999,999')AS "연봉"

FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no;


--정렬 ORDER BY
--ASC:오름차(기본값)//DESC:내림차
--항상 SELECT절의 맨 마지막 줄에 위치
SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_no DESC;

SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_NM;

SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY 2 DESC;--조회컬럼 순서의 숫자로 봄 이름(EMP_NM)내림차순

SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm DESC, emp_no DESC;

--위랑 같음
SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY 2 DESC, 1 DESC;

--정렬할 때 별칭을 쓸 수 있음
SELECT emp_no AS eno,
emp_nm AS enm,
addr
FROM tb_emp
ORDER BY eno DESC;


SELECT
 emp_nm --41건 나옴
 --COUNT(emp_no) AS cnt--1건 나옴, 그룹함수임, 일반컬럼하고 쓰면 안됨, 집계함수끼리 써야함
FROM tb_emp;

--ORDER BY는 항상 맨 마지막..











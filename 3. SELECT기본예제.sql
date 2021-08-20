

--SELECT 기본
SELECT
    CERTI_CD, CERTI_NM
FROM TB_CERTI;

SELECT
    CERTI_NM
FROM TB_CERTI;

SELECT
CERTI_CD, CERTI_NM, issue_insti_nm
FROM TB_CERTI;

SELECT
*
FROM tb_certi;

--SELECT 뒤에는 ALL이 생략
SELECT ALL
    issue_insti_nm
FROM TB_CERTI;

--DISTINCT: 중복값 제외
SELECT DISTINCT
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    certi_nm ,issue_insti_nm
FROM TB_CERTI;

--열 별칭 지정(ALIAS)여기서는 "" 써야함/ AS는 생략가능
--/띄어쓰기 없거나 영어만있으면 ""생략가능
SELECT
certi_cd AS "자격증 코드"
, certi_nm AS "자격증 이름"
, issue_insti_nm AS "발행기관명"
FROM TB_CERTI;

--결합연산자(||)를 사용한 컬럼데이터 결합

SELECT
certi_nm || '(' || certi_cd || ') - ' || issue_insti_nm AS "자격증 정보"
FROM TB_CERTI;

--더미 테이블(DUAL): 단순 연산결과를 조회하고 싶을 때
SELECT
    (3+7)*5/10 AS "연산결과"
FROM DUAL;

--WHERE 조건절: 조회결과 행을 제한하는 조건절
SELECT * FROM TB_EMP;

SELECT
    EMP_NO, emp_nm,ADDR
FROM TB_EMP
WHERE SEX_CD = 1;

--PK로 조건을 제한하면 무조건 단일행이 조회됩니다.
SELECT
emp_no, emp_nm, tel_no
FROM TB_EMP
WHERE EMP_NO = 1000000001;

--비교연산자 (=, <>, <, <=,>=)
--SQL비교연산자(BETWEEN,IN,LIKE)

SELECT
emp_no, emp_nm, birth_de, tel_no
FROM TB_EMP
WHERE BIRTH_DE>= '19900101' AND BIRTH_DE <='19991231';

--BETWEEN 연산자
SELECT
emp_no, emp_nm, birth_de, tel_no
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19900101' AND '19991231';

--IN연산자
SELECT 
emp_no, emp_nm, dept_cd
FROM TB_EMP
WHERE DEPT_CD = '100004'
OR DEPT_CD = '100006'
;

--위랑 같음

SELECT 
emp_no, emp_nm, dept_cd
FROM TB_EMP
WHERE DEPT_CD IN ('100004', '100006')--IN 뒤에 나열하는 데이터는 다 OR로 처리해서 데려옴
;

SELECT 
emp_no, emp_nm, dept_cd
FROM TB_EMP
WHERE DEPT_CD NOT IN ('100004', '100006')
;

--LIKE연산자
--와일드카드 매핑 - %: 1글자 이상 포함, _: 딱 1글자 포함
SELECT
emp_no, emp_nm
FROM TB_EMP
WHERE EMP_NM LIKE '이%';--'이'뒤에 몇 글자가 나오든 상관없음

SELECT
emp_no, emp_nm
FROM TB_EMP
WHERE EMP_NM LIKE '%심';

SELECT
emp_no, emp_nm
FROM TB_EMP
WHERE EMP_NM LIKE '이__';--언더바 하나당 한글자씩만, 하나만 쓰면 아무도 추출되지 않음
--사원이름 중에 외자가 없어서

--수원사는 사람을 추출하기
SELECT
EMP_NM, ADDR, TEL_NO
FROM TB_EMP
WHERE ADDR LIKE '%수원%';--주소 중간에 수원이 포함된 것, 검색할 때 많이 씀 


-- 성씨가 김씨이면서, 부서가 100003, 100004, 100006번 중에 하나이면서, 
-- 90년대생인 사원의 사번, 이름, 생일, 부서코드를 조회

SELECT
EMP_NO,
EMP_NM,
BIRTH_DE,
DEPT_CD
FROM TB_EMP 
WHERE EMP_NM LIKE '김%'
AND DEPT_CD IN ('100003', '100004', '100006')
AND BIRTH_DE BETWEEN '19900101' AND '19991231';


--NULL값 조회 IS NULL 이라고 써야함!! = 쓰면 안됨
SELECT
emp_no, emp_nm, DIRECT_MANAGER_EMP_NO
FROM TB_EMP
WHERE DIRECT_MANAGER_EMP_NO IS NULL;

SELECT
emp_no, emp_nm, DIRECT_MANAGER_EMP_NO
FROM TB_EMP
WHERE DIRECT_MANAGER_EMP_NO IS NOT NULL;

--부정 비교연산자
SELECT
emp_no, emp_nm, SEX_CD, dept_cd
FROM TB_EMP
WHERE EMP_NM LIKE '이%'
AND SEX_CD <> 1;  --남자가 아닌 사원추출 != 와 같은 의미!! 


--AND와 OR의 우선순위
SELECT
    EMP_NO, EMP_NM, ADDR, DEPT_CD
FROM TB_EMP
WHERE EMP_NM LIKE '이%'
    AND DEPT_CD IN('100004', '100006')
    AND (ADDR LIKE '%수원%' OR ADDR LIKE '%성남%');
    --OR앞에까지를 한 덩어리로 보기 때문에 다 만족하는 사람을 
    --추출하려면 OR문은 괄호로 쳐줘야 함

SELECT
    EMP_NO, EMP_NM, ADDR, DEPT_CD
FROM TB_EMP
WHERE EMP_NM LIKE '이%'
    AND DEPT_CD IN('100004', '100006')
    AND NOT(ADDR LIKE '%수원%' OR ADDR LIKE '%성남%');
















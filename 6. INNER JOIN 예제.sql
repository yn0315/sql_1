

--조인기초
SELECT 
emp_no, emp_nm, dept_cd
FROM tb_emp;

--2개의 테이블 조인
SELECT
E.emp_no, 
E.emp_nm, 
E.dept_cd, 
D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd;--조인조건...


--자격증 정보 테이블
SELECT * FROM tb_certi;

--사원이 취득한 자격증 정보 테이블
SELECT
    *
FROM tb_emp_certi;

SELECT
E.emp_no, E.emp_nm,
EC.certi_cd, EC.acqu_de
FROM tb_emp E, tb_emp_certi EC
WHERE E.emp_no = EC.emp_no;

SELECT
c.certi_cd, c.certi_nm, c.issue_insti_nm,
EC.acqu_de, ec.emp_no
FROM tb_certi C, tb_emp_certi EC
WHERE c.certi_cd= EC.certi_cd;

--3개의 테이블 조인
SELECT
A.emp_no, A.emp_nm, B.certi_cd,
B.certi_nm, C.acqu_de
FROM tb_emp A, tb_certi B, tb_emp_certi C
WHERE A.emp_no = C.emp_no
AND B.certi_cd = C.certi_cd
;

SELECT
A.emp_no, A.emp_nm, B.certi_cd,
B.certi_nm, C.acqu_de
FROM tb_emp A, tb_certi B, tb_emp_certi C
WHERE A.emp_no = C.emp_no
AND B.certi_cd = C.certi_cd
AND a.emp_nm like '이%'
and c.acqu_de BETWEEN '20190101' AND '20191231'
ORDER BY c.acqu_de
;



CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY
    , content VARCHAR2(200)
);
CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY
    , reply VARCHAR2(100)
    , a_id NUMBER(10)
);

INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, 'ㄱㄱㄱ', 1);
INSERT INTO TEST_B  VALUES (2, 'ㄴㄴㄴ', 1);
INSERT INTO TEST_B  VALUES (3, 'ㄷㄷㄷ', 2);
INSERT INTO TEST_B  VALUES (4, 'ㄹㄹㄹ', 3);
COMMIT;

SELECT*FROM TEST_A;
SELECT*FROM TEST_B;


SELECT
A.id, A.content,B.b_id, B.reply
FROM TEST_A A, TEST_B B
WHERE A.id = B.a_id;--조인조건 안 걸어두면 cross join됨, 카테시안 곱..


--#INNER JOIN
--1. 2개 이상의 테이블이 공통된 컬럼에 의해 논리적으로 결합되는 조인기법입니다.
--2. WHERE절에 사용된 컬럼들이 동등연산자(=)에 의해 조인됩니다.

SELECT
E.emp_no, E.emp_nm, E.addr, E.dept_cd, D.dept_nm 
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
    AND addr LIKE '%용인%'
ORDER BY E.emp_no;


SELECT
*--dept_cd두번나옴, 안쓰는게....
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
    AND addr LIKE '%용인%'
ORDER BY E.emp_no;

-- # NATURAL JOIN
-- 1. NATURAL JOIN은 동일한 이름을 갖는 컬럼들에 대해 자동 조인하는 기법입니다.
-- 2. 즉, 자동으로 2개 이상의 테이블에서 같은 이름을 가진 컬럼을 찾아 INNER조인을 수행합니다.
-- 3. 이 때 조인되는 동일 이름의 컬럼은 데이터 타입이 같아야 하며(둘다 바차2거나 넘버거나), 
--ALIAS나 테이블명을 붙일 수 없습니다.
-- 4. SELECT * 문법을 사용하면, 공통 컬럼으로 자동 조인하며 결과집합에서 한번만 표기됩니다.

SELECT
E.emp_no, E.emp_nm, E.addr, dept_cd, D.dept_nm
FROM tb_emp E NATURAL JOIN tb_dept D;--콤마 안씀, 동일한 이름의 컬럼은 별칭 쓰지 않음

SELECT
*--여기서는 dept_cd한번만 나옴
FROM tb_emp E NATURAL JOIN tb_dept D;

-- # USING절 조인
-- 1. NATURAL조인에서는 자동으로 이름이 일치하는 모든 컬럼에 대해 조인이
--    일어나지만 USING을 사용하면 원하는 컬럼에 대해서만 선택적으로 조인이 가능합니다.
-- 2. USING절에서도 조인 컬럼에 대해 ALIAS나 테이블명을 붙일 수 없습니다.

SELECT
E.emp_no, E.emp_nm, E.addr, dept_cd, D.dept_nm
FROM tb_emp E JOIN tb_dept D USING (dept_cd);--이것도 동일컬럼의 별칭 쓰지 않음

-- # JOIN ON절
-- 1. 조인 조건 서술부(ON절)와 일반 조건 서술부(WHERE절)를 분리해서 작성하는 방법입니다.
-- 2. ON절을 사용하면 JOIN이후에 논리 연산이나 서브쿼리와 같은 추가 서술을 할 수 있습니다.

SELECT 
    A.emp_no, A.emp_nm, D.dept_nm, B.acqu_de, B.certi_cd, C.certi_nm
FROM tb_emp A, tb_emp_certi B, tb_certi C, tb_dept D
WHERE A.emp_no = B.emp_no
    AND B.certi_cd = C.certi_cd
    AND A.dept_cd = D.dept_cd
;

SELECT
E.emp_no, E.emp_nm, E.addr, E.dept_cd, D.dept_nm 
FROM tb_emp E 
JOIN tb_dept D --FROM 과 WHERE사이에 씀
ON E.dept_cd = D.dept_cd
WHERE addr LIKE '%용인%'
ORDER BY E.emp_no;

-- SELECT [DISTINCT] { 열이름 .... } 
-- FROM  테이블 또는 뷰 이름
-- JOIN  테이블 또는 뷰 이름
-- ON    조인 조건
-- WHERE 조회 조건
-- GROUP BY  열을 그룹화 -- HAVING하고 순서바뀔 수 있음
-- HAVING    그룹화 조건
-- ORDER BY  정렬할 열 [ASC | DESC];









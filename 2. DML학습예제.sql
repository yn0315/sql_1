--DML: 데이터 조작어
--SESECT, INSERT, UPDATE, DELETE

--데이터 삽입
INSERT INTO BOARD
(BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
(1,'안녕', '재미있는 내용입니다.', '마이콜', SYSDATE);


--NOT NULL 제약조건에 걸림(TITLE)
INSERT INTO BOARD
(BNO, CONTENT, WRITER, REG_DATE)
VALUES
(2, '재미있는 내용입니다.', '마이콜', SYSDATE);

--PK 제약조건으로 글번호 중복
INSERT INTO BOARD
(BNO, TITLE, WRITER, REG_DATE)
VALUES
(1, '새로운 글이야', '도우너', SYSDATE);

INSERT INTO BOARD
(BNO, TITLE, WRITER, REG_DATE)
VALUES
(2, '새로운 글이야', '도우너', SYSDATE);

--테이블의 모든 컬럼을 순서대로 다 채울 경우 컬럼지정을 생략가능
INSERT INTO BOARD
VALUES
(3, '3번 글','글 내용 에베베베베', '둘리', SYSDATE);

SELECT * FROM BOARD;

COMMIT;--SAVE 기능

--데이터 수정
UPDATE BOARD
SET writer = '수정된 철수'
WHERE bno = 2;

UPDATE board
SET content = '에베베베ㅔㅂ'
WHERE bno = 2;

UPDATE board
SET TITLE = '수정된 제목이야'
    ,content = '수정수정수정'
WHERE BNO = 1;

--UPDATE절에서 WHERE가 생략되면 전체수정되므로 주의
UPDATE board
SET content = '메롱';

--데이터삭제 -- DELETE FROM은 가운데 아무것도 안 들어감 붙여씀
DELETE FROM board
WHERE bno = 2;

ROLLBACK;

COMMIT;

INSERT INTO BOARD
(BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
(4,'임시테스트', '메롱메롱', '박테스트', SYSDATE);

SELECT * FROM BOARD;

ROLLBACK;--최종커밋 시점으로 롤백하는 것


INSERT INTO BOARD
(BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
(5,'임시테스트', '메롱메롱', '박테스트', SYSDATE);

INSERT INTO BOARD
(BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
(6,'임시테스트', '메롱메롱', '박테스트', SYSDATE);


INSERT INTO BOARD
(BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
(7,'임시테스트', '메롱메롱', '박테스트', SYSDATE);

COMMIT;

--전체데이터삭제
--1.WHERE절을 생략한 DELETE절 (ROLLBACK가능)
DELETE FROM BOARD;
SELECT * FROM BOARD;
ROLLBACK;

--위험!!!!
--2. TRUNCATE TABLE을 사용한 방법(ROLLBACK불가능)/테이블 구조는 삭제되지 않음
TRUNCATE TABLE BOARD;

--3. DROP TABLE(ROLLBACK불가능/테이블 구조도 삭제)

DROP TABLE BOARD;











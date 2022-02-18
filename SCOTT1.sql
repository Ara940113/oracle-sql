-- 1. 데이터베이스는 테이블의 모임
-- 2. 테이블은 데이터의 모임
-- 3. 테이블은 행(레코드)과 열(칼럼-제목/프로젝션-칼럼밑에있는 데이터들)의 가진다.
-- 4. 오라클을 설치하면 DBS와 DBMS가 세팅이 된다.
-- 5. DBMS의 SQL을 전송하려면 툴을 SqlDevelop을 설치하면 좋다. 
-- 6. 검색은 SELECT
-- 7. 검색을 위한 조건이 테이블을 퍼올려야 한다. (하드-> 메모리) FROM
-- 8. 스키마 보는 법 : DESC 테이블명
-- 9. 특정 레코드 보는 법 WHERE(조건절, 필터절)
-- 10. FROM 1번 WHERE 2번 SELECT 3번

SELECT job
FROM emp;

SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno
FROM emp;

SELECT *
FROM emp;

SELECT deptno,dname,loc
FROM dept;

DESC dept

SELECT *
FROM emp
WHERE sal = 800;

SELECT *
FROM emp
WHERE  job = 'MANAGER';

-- 문자는 홑따옴표로 감싸야한다.



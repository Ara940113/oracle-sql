--SLECT 문법
-- 1. distinct 중복제거
SELECT DISTINCT job
FROM   emp;

DESC emp;

-- 2. 결합 연산자 ||
SELECT '나의 이름은 '|| ename FROM emp;

-- 3. 별칭 as : 칼럼의 이름을 내가 원하는대로 쓸 수 있다. as와""(쌍따옴표)는 생략 가능
SELECT '나의 이름은 '|| ename as "자기소개" FROM emp;
SELECT '나의 이름은 '|| ename  자기소개 FROM emp;
SELECT sal*12 연봉 FROM emp;

-- 4. NVL null값 변경하기 
-- DB는 null에 숫자를 더하면 null 이 나온다(null 이 들어가 있으면 연산이 안된다)
-- null을 0으로 바꿔주는게 NVL 함수! (인수가 2개 필요하다)
-- 첫번째 인수 무엇을 할지 칼럼, 두번째 인수는 무엇으로 바꿀지
SELECT ename, sal+comm, nvl(comm,0) FROM emp; --둘다 넘버타입이어야 연산가능! 
SELECT ename 이름 , sal+nvl(comm,0) 월급 FROM emp;

-- 5. decode (조건문)
SELECT decode (comm, null, 0,comm) 보너스 FROM emp;
-- comm이 null이면 0, 아니면 그대로 갈게.

DESC student;

SELECT name || ' ID : ' || id ||', ' ||'WEIGHT is : '|| weight || 'kg' "ID AND WEIGHT" FROM student;

SELECT ename ||'('|| job || ')  , ' ||ename ||''''|| job||'''' "NAME AND JOB"  FROM emp;

SELECT ename ||' ''s sal is $' || sal "Name and Sal" FROM emp;




-- WHERE

-- 1. = 같다  
SELECT* FROM emp WHERE empno = 7900;

-- 2. < > <= >= 크다, 작다
SELECT * FROM emp WHERE sal < 3000;

-- 3. 문자열 검색 ''(홑따옴표)
SELECT * FROM emp WHERE ename = 'SMITH';

-- 4. 부정 != 같지않다. <> 같지않다.
SELECT * FROM emp WHERE ename !='SMITH';
SELECT * FROM emp WHERE ename <>'SMITH';

-- 5. OR , IN
SELECT * FROM emp WHERE job = 'MANAGER' or job = 'CLERK';
SELECT * FROM emp WHERE job in ('MANAGER' , 'CLERK');

-- 6. AND , BETWEEN-AND
-- tip ! 날짜 (date타입) /,- 둘다 가능
SELECT hiredate FROM emp WHERE hiredate >= '1981/02/20' AND hiredate <= '1982/02/22'; 
-- 보이는 것만 81년도이기 때문에 4글자 다 적어주기
SELECT hiredate FROM emp WHERE hiredate BETWEEN '1981/02/20' AND '1982/02/22'; 


-- 7. NULL 찾는 법
SELECT * FROM emp WHERE comm is null;
SELECT * FROM emp WHERE comm is not null;

-- 8. 연산된 데이터를 찾는 법
SELECT sal*12 연봉 FROM emp WHERE sal*12 > 9000; -- 같은 상태를 비교


-- LIKE (네이버 검색같은..) 비슷한 문자열 검색하기
 SELECT * FROM emp WHERE ename LIKE 'S%'; --S% : S 뒤로는 뭐든 상관없다
 SELECT * FROM emp WHERE ename LIKE '%M%'; -- : 앞뒤 상관없이 M이 포함되어있는걸 찾아라
 SELECT * FROM emp WHERE ename LIKE '_M%'; -- : 두번째글짜가 M이고 뒤로는 상관없는걸 찾아달라
 SELECT * FROM emp WHERE ename LIKE '%H'; -- : 앞에 상관없이 마지막이 H
 SELECT * FROM emp WHERE ename LIKE '__I%'; -- : 세번째 글자가 I인거 찾기


-- ORDER BY 정렬 : 무조건 제일 마지막 실행
-- ASC :오름차순(디폴트) , DESC : 내림차순
SELECT *
FROM emp
WHERE job = 'MANAGER'
ORDER BY ename ASC; 

SELECT sal,ename,empno
FROM emp
ORDER BY sal DESC, ename ASC;

SELECT mod(sal, 500), ename --mod 나머지 연산자 
FROM emp
ORDER BY 2; -- 컬럼의 순서


-- 그룹 연산자 max, count, min, sum, avg (프로젝션 연산) 
-- 프로젝션 연산은 연산된 결과 값을 들고오기 때문에 옆에 ename같은걸 쓸 수 없다.

SELECT max(sal) FROM emp; -- 단독으로만 쓰인다!
SELECT min(sal) FROM emp; -- 단독으로만 쓰인다!

SELECT sum(sal) FROM emp;
SELECT avg(sal) FROM emp;
SELECT count(ename) FROM emp; -- count는 그냥 갯수를 나타낸다.

SELECT sum(sal) FROM emp WHERE job = 'MANAGER';
SELECT max(sal) FROM emp WHERE job = 'MANAGER';

-- 집합 연산자 UNION ALL (두개의 집합 더하기 - 조건 : 칼럼의 갯수가 같아야 한다. 보통 null을 추가)
SELECT empno, ename, sal FROM emp WHERE job = 'SALESMAN' 
UNION ALL 
SELECT null, null, sum(sal) FROM emp WHERE job = 'SALESMAN';









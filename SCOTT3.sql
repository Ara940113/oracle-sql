
 
 
 CREATE TABLE "USERTBL" 
   (	
        ID NUMBER NOT NULL ENABLE,  -- 컬럼명, 타입, null
        USERNAME VARCHAR2(20 BYTE) NOT NULL ENABLE, 
        PASSWORD VARCHAR2(13 BYTE) NOT NULL ENABLE, 
        GENDER CHAR(3 BYTE), 
         CONSTRAINT "USERTBL_PK" PRIMARY KEY ("ID") --프라이머리키가 없으면 안된다, 프라이머리키는 무조건 not null
   )  ;
   
   ALTER TABLE USERTBL MODIFY PASSWORD CHAR(3);
   
   UPDATE USERTBL SET GENDER = '여' WHERE ID = 3;
   
INSERT INTO USERTBL (ID, USERNAME, PASSWORD, GENDER  ) VALUES(1, 'ssar', 'ssar1234', '남');

INSERT INTO USERTBL (ID, USERNAME, PASSWORD, GENDER  ) VALUES(2, 'cos', 'cos1234', '여');

INSERT INTO USERTBL (ID, USERNAME, PASSWORD) VALUES(3, 'love', 'love1234','여');

INSERT INTO USERTBL (NO, USERNAME, PASSWORD) VALUES(4, 'hello'); -- password가 not null 이라서 

ALTER TABLE USERTBL ADD UNIQUE (username); --username은 중복되면 안되니까 유니크 설정

INSERT INTO USERTBL (NO, USERNAME, PASSWORD) VALUES(4, 'love', 'love1234'); -- 3번이랑 username 중복이라 입력안됨
   
   
  drop table postTbl;  
   
CREATE TABLE postTbl
(
    ID NUMBER,
    TITLE VARCHAR2(100 BYTE) NOT NULL,
    CONTENT CLOB NOT NULL,
    USERID NUMBER,
    CONSTRAINT "postTbl_PK" PRIMARY KEY ("ID"),
    CONSTRAINT postTbl_FK foreign key("USERID") references userTbl (id)
);
   
select * from posttbl;

delete from posttbl;

ALTER TABLE postTbl ADD (CONTENT CLOB);

--시퀀스 : 가장 마지막 번호를 읽어서 ++해주는것
CREATE SEQUENCE SEQ_POSTTBL INCREMENT BY 1 START WITH 1; 

INSERT INTO postTbl (ID, TITLE, CONTENT, USERID  ) VALUES(SEQ_POSTTBL.nextval, '제목1', '내용1', 1);
INSERT INTO postTbl (ID, TITLE, CONTENT, USERID  ) VALUES(SEQ_POSTTBL.nextval, '제목2', '내용2', 2);
INSERT INTO postTbl (ID, TITLE, CONTENT, USERID  ) VALUES(SEQ_POSTTBL.nextval, '제목3', '내용3', 2);
INSERT INTO postTbl (ID, TITLE, CONTENT, USERID  ) VALUES(SEQ_POSTTBL.nextval, '제목4', '내용4', 55); -- 유효성 검사


select * from userTbl;
select * from postTbl;

select *
from userTbl u inner join posttbl p
on u.id = p.userid;

select *
from userTbl u left outer join posttbl p
on u.id = p.userid;

-- user(1),post(n) - 드라이빙, fk 
-- 바꾸는 작업 = 튜닝
select *
from posttbl p right outer join userTbl u
on p.userid =u.id ;




select *
from student;


-- 1. student  (deptno2=fk) 테이블과 department 테이블 (deptno=pk) 로 연결 -> 동일조인
select *
from student s inner join department d
on s.deptno2 = d.deptno;

-- 2. 모든 학생을 다 출력하고 연관된 부전공 정보도 조인해서 보여주세요.
select *
from student s left outer join department d
on s.deptno2 = d.deptno;

-- 3. 모든 학과를 출력하고 연관된 학생의 정보를 조인해서 보여주세요. 
select *
from department d right outer join student s
on d.deptno = s.deptno2;

SELECT *
FROM STUDENT S right outer JOIN DEPARTMENT d
ON s.deptno2 = d.deptno;



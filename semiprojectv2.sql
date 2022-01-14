create table advmember (
   mno int primary key,
   userid varchar(18) unique not null,
   passwd varchar(18) not null,
   name varchar(15) not null,
   jumin1 varchar(6) not null,
   jumin2 varchar(7) not null,
   zipcode char(7) not null,
   addr varchar(150) not null,
   etcaddr varchar(150) not null,
   email varchar(100) not null,
   tel varchar(15) not null,
   regdate timestamp default sysdate
);

-- abc123, 987xyz, 빅데이터, 123456, 1234567, 123-456,
-- 서울 구로구 구로동, 123-456, abc123@987xyz.com,
-- 010-1234-5678

insert into advmember
    (mno, userid, passwd, name, jumin1, jumin2, zipcode, addr, etcaddr, email, tel)
values (MBSEQ.nextval,'abc123', '987xyz', '빅데이터', '123456', '1234567',
    '123-456', '서울 구로구 구로동', '123-456', 'abc123@987xyz.com', '010-1234-5678');


commit;
rollback;

select * from advmember;

delete from advmember where name = '33,33';

-- 아이디 존재여부 확인
select count(userid) cnt from ADVMEMBER where userid = 'abc123';

select count(userid) cnt from ADVMEMBER where userid = '987xyz';


-- 게시판 테이블
create table board (
   bno int primary key,
   title varchar(150) not null,
   userid varchar(18) not null,
   regdate timestamp default sysdate,
   thumbs int default 0,
   views int default 0,
   contents clob not null
);

create sequence bdseq nocache;

DECLARE
    cnt number := 1;

begin
    loop
        insert into board (bno, title, userid, contents)
        values (bdseq.nextval, '이것은 첫번째 글입니다!', 'abc123', '아잉~ 냉무~ 제곧내~');

        insert into board (bno, title, userid, contents)
        values (bdseq.nextval, '이것은 두번째 글입니다!', '987xyz', '스프링4 이클립스 인텔리제이');

        insert into board (bno, title, userid, contents)
        values (bdseq.nextval, '이것은 세번째 글입니다!', 'abcxyz', 'JSP EL JSTL Oracle');

        exit when cnt > 1110;
        cnt := cnt + 1;
    end loop;
end;

select * from board;

select count(bno) from board;


-- 게시판 페이징

-- ex) 한 페이지당 10개의 게시물 출력
-- limit startpage, count (mysql/mariadb)
-- select * from board limit 0, 10 -- 1page
-- select * from board limit 10, 10 -- 2page
-- select * from board limit 20, 10 -- 3page
-- select * from board limit ??, 10 -- npage
-- startpage = (cpage - 1) * 10

-- 오라클에서의 페이징 처리
-- top N query (rownum)
-- ex)가장 최근에 입사한 사원 10명 조회
-- 가장 최근에 입사한 사원 조회
select * from Employees order by HIRE_DATE desc;

select * from (
    select * from Employees order by HIRE_DATE desc
) where ROWNUM <= 10;

select seq, EMPLOYEE_ID, FIRST_NAME, HIRE_DATE from(
    select ROWNUM as seq, EMPLOYEE_ID, FIRST_NAME, HIRE_DATE from (
        select * from EMPLOYEES order by HIRE_DATE desc
    )
) where seq >= 1 and seq <= 10;


-- row limit 절 (오라클 12c부터 지원)
-- offset m rows fetch first n rows only
select * from Employees order by HIRE_DATE desc
offset 0 rows fetch first 10 rows only;

-- ex)가장 최근에 입사한 사원들 중 11번째 ~ 20번째 사원 조회
select seq, EMPLOYEE_ID, FIRST_NAME, HIRE_DATE from(
    select ROWNUM as seq, EMPLOYEE_ID, FIRST_NAME, HIRE_DATE from (
        select * from EMPLOYEES order by HIRE_DATE desc
    )
) where seq >= 11 and seq <= 20;

select * from Employees order by HIRE_DATE desc
offset 10 rows fetch first 10 rows only;

-- 게시판 페이징

-- ex) 한 페이지당 10개의 게시물 출력
-- limit startpage, count (mysql/mariadb)
-- select * from board limit 0, 10 -- 1page
-- select * from board limit 10, 10 -- 2page
-- select * from board limit 20, 10 -- 3page
-- select * from board limit ??, 10 -- npage
-- startpage = (cpage - 1) * 10

-- 오라클에서의 페이징 처리
-- top N query (rownum)
-- ex)가장 최근에 입사한 사원 10명 조회
-- 가장 최근에 입사한 사원 조회
select * from Employees order by HIRE_DATE desc;

select * from (
    select * from Employees order by HIRE_DATE desc
) where ROWNUM <= 10;

select seq, EMPLOYEE_ID, FIRST_NAME, HIRE_DATE from(
    select ROWNUM as seq, EMPLOYEE_ID, FIRST_NAME, HIRE_DATE from (
    select * from EMPLOYEES order by HIRE_DATE desc
    )
) where seq >= 1 and seq <= 10;


-- row limit 절 (오라클 12c부터 지원)
-- offset m rows fetch first n rows only
select * from Employees order by HIRE_DATE desc
offset 0 rows fetch first 10 rows only;

-- ex)가장 최근에 입사한 사원들 중 11번째 ~ 20번째 사원 조회
select seq, EMPLOYEE_ID, FIRST_NAME, HIRE_DATE from(
    select ROWNUM as seq, EMPLOYEE_ID, FIRST_NAME, HIRE_DATE from (
    select * from EMPLOYEES order by HIRE_DATE desc
    )
) where seq >= 11 and seq <= 20;

select * from Employees order by HIRE_DATE desc
offset 10 rows fetch first 10 rows only;

-- 게시판 목록 페이징하기 (한 페이지당 출력할 게시물 수 : 25)
-- 1page
select bno, title, userid, regdate, thumbs, views from board
order by bno desc
offset 1 rows fetch first 25 rows only;

-- 2page
select bno, title, userid, regdate, thumbs, views from board
order by bno desc
offset 26 rows fetch first 25 rows only;

-- 3page
select bno, title, userid, regdate, thumbs, views from board
order by bno desc
offset 51 rows fetch first 25 rows only;

-- 총 게시물 수 조회
select count(bno) cnt from board;

-- 한 페이지당 출력할 게시물 수가 25일 때 총 페이지 수 조회

select ceil(count(bno) / 25) pages from board;

-- 작성자가 abc123인 게시글을 조회
select * from board where userid like '%abc123%' order by bno desc;

-- 글제목이 '두번째'인 게시글을 조회
select * from board where title like '%두번째%' order by bno desc;


-- reply
create table Reply (
                       rno    int   primary key, -- 댓글번호
                       cno    int   not null,    -- 대댓글번호
                       bno    int   not null,    -- 게시글번호
                       reply  clob  not null,    -- 댓글/대댓글 내용
                       userid varchar(16)   not null,
                       regdate  timestamp default sysdate
);

alter table Reply add constraint fk_mr
    foreign key (userid) references Member(userid);
-- 비식별키를 이용한 외래키

alter table Reply add constraint fk_br
    foreign key (bno) references Board(bno);
-- 식별키를 이용한 외래키

create sequence rp_seq nocache;

-- insert
insert into Reply (rno, cno, bno, userid, reply)
values (rp_seq.nextval,1, 10003, 'user1', '오늘은 날씨가...');

insert into Reply (rno, cno, bno, userid, reply)
values (rp_seq.nextval,2, 10003, 'user2', '점심메뉴는...');

insert into Reply (rno, cno, bno, userid, reply)
values (rp_seq.nextval,3, 10003, 'user3', '월요병이 도졌나.....');

insert into Reply (rno, cno, bno, userid, reply)
values (rp_seq.nextval,1, 10003, 'user10', '비올꺼 같아요...');

insert into Reply (rno, cno, bno, userid, reply)
values (rp_seq.nextval,5, 10003, 'user25', '블라블라...');

insert into Reply (rno, cno, bno, userid, reply)
values (rp_seq.nextval,1, 10003, 'user9', '블라블라블라블라...');

insert into Reply (rno, cno, bno, userid, reply)
values (rp_seq.nextval,7, 10003, 'user23', '블라블라블라블라...');

-- 댓글 작성시             : rno와 cno가 동일
-- 댓글에 대한 대댓글 작성시 : 대댓글 작성시 해당 댓글의 rno가 cno에 저장

-- 댓글번호  대댓글번호  글번호  작성자   댓글내용
-- 1        1         10009  user1   오늘은 날씨가...   (댓글)
-- 2        2         10009  user2   점심메뉴는...      (댓글)
-- 3        3         10009  user3   월요병이 도졌나.....(댓글)
-- 4        1         10009  user10  비올꺼 같아요...    (대댓글)
-- 5        5         10009  user25  블라블라...        (댓글)

select * from Reply order by cno, rno;
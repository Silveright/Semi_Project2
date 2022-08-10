create table notice(
notice_num	number(5) primary key,
notice_id	varchar2(20),	--admin id
notice_title	varchar2(300),
notice_file		varchar2(50),
notice_date		date default sysdate,
notice_content	varchar2(4000)
);

select * from notice;

drop table notice purge;
create table notice(
notice_num	number(5) primary key,
notice_id	varchar2(20),	--admin id
notice_title	varchar2(300),
notice_content	varchar2(4000),
notice_file		varchar2(50),
notice_re_ref	number,
notice_re_lev	number,
notice_re_seq	number,
notice_date		date default sysdate,
notice_readcount number
);

select * from notice;

drop table notice purge;

select nvl(max(notice_num),0)+1 from notice;

delete from notice
where notice_num = 3;



insert into notice (notice_num, notice_title, notice_id, notice_re_ref) values(1, '첫번째 공지','admin' , 1);
insert into notice (notice_num, notice_title, notice_id, notice_re_ref) values(2, '두번째 공지','admin' , 2);
insert into notice (notice_num, notice_title, notice_id, notice_re_ref) values(3, '세번째 공지','admin' , 3);
insert into notice (notice_num, notice_title, notice_id, notice_re_ref) values(4, '네번째 공지','admin' , 3);
insert into notice (notice_num, notice_title, notice_id, notice_re_ref) values(5, '다섯번째 공지','admin' , 3);
insert into notice (notice_num, notice_title, notice_id, notice_re_ref) values(6, '여섯번째 공지','admin' , 3);


	

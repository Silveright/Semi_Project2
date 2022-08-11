create table review(
	review_num number,
	review_name varchar2(30) references customer(id),
	review_pass varchar2(30),
	review_subject varchar2(300),
	review_content varchar2(4000),
	review_file varchar2(50),
	review_re_ref number,
	review_re_lev number,
	review_re_seq number,
	review_readcount number,
	product_name varchar2(200),
	review_date date default sysdate,
	primary key(review_num)
);

create sequence review_seq;

insert into review (review_num, review_subject, review_name, review_re_ref) VALUES (1,'처음','admin',1);
insert into review (review_num, review_subject, review_name, review_re_ref) VALUES (2,'둘째','admin',2);
insert into review (review_num, review_subject, review_name, review_re_ref) VALUES (3,'셋째','admin',3);

delete from review;
drop table review purge;
drop sequence review_seq;
select * from review;
select review_pass from review where review_num =1;


select * 
from 
(select rownum rnum, review_num, review_name, 
review_pass, review_subject,review_content, 
review_file, review_re_ref, review_re_lev,  review_re_seq, 
review_readcount, review_date from 
(SELECT * FROM review
where review_name='id'
ORDER BY review_re_ref DESC, 
 review_re_seq ASC)
where rownum<=10) 
 where rnum>=1 and rnum<=10

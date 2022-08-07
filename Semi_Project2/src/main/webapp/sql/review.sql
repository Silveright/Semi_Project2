create table review(
	review_num number,
	review_name varchar2(30),
	review_pass varchar2(30),
	review_subject varchar2(300),
	review_content varchar2(4000),
	review_file varchar2(50),
	review_re_ref number,
	review_re_lev number,
	review_re_seq number,
	review_readcount number,
	review_date date default sysdate,
	primary key(review_num)
);

create sequence review_seq;

insert into review (review_num, review_subject, review_name, review_re_ref) VALUES (1,'처음','admin',1);
insert into review (review_num, review_subject, review_name, review_re_ref) VALUES (2,'둘째','admin',2);
insert into review (review_num, review_subject, review_name, review_re_ref) VALUES (3,'셋째','admin',3);
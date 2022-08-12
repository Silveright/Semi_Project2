create table qna(
qna_num		number(5) primary key,
id 			varchar2(20)  references customer(id),
q_cate		varchar2(20),
q_title		varchar2(20),
q_content	varchar2(4000),
q_product_name	varchar2(200),
q_date			date
)

select * from qna;

select * from customer;
insert into qna
values(1, 'sangmin', '상품문의', '문의합니다', '문의입니다content','나이키상의', sysdate);


select * from notice
order by notice_num desc


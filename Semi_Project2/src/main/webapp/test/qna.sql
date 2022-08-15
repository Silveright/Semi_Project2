create table qna(
qna_num		number(5) primary key,
id 			varchar2(20)  references customer(id),
qna_cate		varchar2(20),
qna_title		varchar2(20),
qna_content	varchar2(4000),
qna_product_name	varchar2(200),
qna_date			date,
qna_re_ref	number,
qna_re_lev	number,
qna_re_seq	number
)

select * from qna;

select * from customer;
insert into qna
values(1, 'sangmin', '상품문의', '문의합니다', '문의입니다content','나이키상의', sysdate);


delete * from qna;

select * from notice
order by notice_num desc


--상품옵션, 카테고리
--create table product_option(
--	opt_code number,
--	product_code number references product(product_code),
--	opt_color varchar2,
--	opt_size varchar2
--)

drop table product purge;
drop table product_category;
drop sequence product_seq;
drop sequence product_category_seq;

create table product(
	product_code number(5),
	product_name varchar2(200),
	product_price number(10),
	product_image varchar2(50),--이미지 파일 이름
	category_code number(5) references product_category(category_code),
	primary key(product_code)
)
create sequence product_seq;


create table product_category(
	category_code number(5),
	class1 varchar2(20),
	class2 varchar2(20),
	primary key(category_code)
)
create sequence product_category_seq;
select * from product;
select * from product_category;

--상품을 직접 insert (image : image경로에 들어갈 파일명)
insert into product_category(category_code, class1, class2) VALUES (product_category_seq.nextval,'top','long-sleeve');
insert into product_category(category_code, class1, class2) VALUES (product_category_seq.nextval,'top','short-sleeve');
insert into product_category(category_code, class1, class2) VALUES (product_category_seq.nextval,'bottom','jean');
insert into product_category(category_code, class1, class2) VALUES (product_category_seq.nextval,'outer','coat');
insert into product_category(category_code, class1, class2) VALUES (product_category_seq.nextval,'accessory','shoe');


insert into product VALUES (product_seq.nextval,'시그니처 로고 티','48000','signature_logo_tee',2); 
insert into product VALUES (product_seq.nextval,'나이키 신발','98000','nike_shoe',5); 
insert into product VALUES (product_seq.nextval,'나이키 티셔츠','50000','nike_tshirt',2); 
insert into product VALUES (product_seq.nextval,'코트','150000','coat',4); 
insert into product VALUES (product_seq.nextval,'청바지','90000','jean',3); 

select * 
from product where product_code=1

장바구니번호  -시퀀스   
상품코드 - 
수량
사이즈
색상
아이디  - 세션에서 가져오기

create table cart( -- 장바구니
    cart_code      number(5)    primary key,
    id             varchar2(20) references customer(id),
    product_code   number(5)    references product(product_code),
    cart_count     number(3),
    opt_color      varchar2(10),
	opt_size       varchar2(10)
)

create sequence cart_seq;
drop table cart
alter sequence cart_seq nocache

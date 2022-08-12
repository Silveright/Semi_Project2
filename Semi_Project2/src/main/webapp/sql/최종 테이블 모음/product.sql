create table product(
	product_code number(5),
	product_name varchar2(200),
	product_price number(10),
	product_image varchar2(50),--이미지 파일 이름
	category_code number(5) references product_category(category_code),
	primary key(product_code)
)
create sequence product_seq start with 1 increment by 1;

--상품옵션, 카테고리
--create table product_option(
--	opt_code number,
--	product_code number references product(product_code),
--	opt_color varchar2,
--	opt_size varchar2
--)

create table product_category(
	category_code number(5),
	class1 varchar2(20),
	class2 varchar2(20),
	primary key(category_code)
)

create sequence product_category_seq;
select * from product;
drop table product;

--상품을 직접 insert (image : image경로에 들어갈 파일명)
insert into product (product_code, product_name, product_price, product_image) VALUES (product_seq.nextval,'시그니처 로고 티','48000','signature_logo_tee'); 
insert into product_category(category_code, class1, class2) VALUES (product_category_seq.nextval,'top','long-sleeve');

insert into product (product_code, product_name, product_price, product_image) VALUES (product_seq.nextval,'나이키 신발','98000','nike_shoe'); 
insert into product_category(category_code, class1, class2) VALUES (product_category_seq.nextval,'accessory','shoe');

insert into product (product_code, product_name, product_price, product_image) VALUES (product_seq.nextval,'나이키 티셔츠','50000','nike_tshirt'); 
insert into product_category(category_code, class1, class2) VALUES (product_category_seq.nextval,'top','short-sleeve');

insert into product (product_code, product_name, product_price, product_image) VALUES (product_seq.nextval,'코트','150000','coat'); 
insert into product_category(category_code, class1, class2) VALUES (product_category_seq.nextval,'outer','coat');

insert into product (product_code, product_name, product_price, product_image) VALUES (product_seq.nextval,'청바지','90000','jean'); 
insert into product_category(category_code, class1, class2) VALUES (product_category_seq.nextval,'bottom','jean');
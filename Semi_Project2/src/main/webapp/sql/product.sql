create table product(
	product_code number,
	product_name varchar2(200),
	product_price number,
	product_image varchar2(50),--이미지 파일 이름
	category_code varchar2 references product_category(category_code),
	primary key(product_code)
);
create sequence product_seq;

--상품옵션, 카테고리
--create table product_option(
--	opt_code number,
--	product_code number references product(product_code),
--	opt_color varchar2,
--	opt_size varchar2
--)

create table product_category(
	category_code number,
	class1 varchar2 varchar2(20),
	class2 varchar2 varchar2(20)
)
create sequence product_category;

--상품을 직접 insert (image : image경로에 들어갈 파일명)
insert into product (product_code, product_name, product_price, product_image) VALUES (product_seq.nextval,'SIGNATURE_LOGO_TEE','48000','signature_logo_tee'); 
insert into product_category(category_code number, class1 varchar2, class2 varchar2) VALUES (product_category.nextval,'top','long-sleeve');
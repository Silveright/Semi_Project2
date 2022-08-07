create table product(
	product_code number,
	product_name varchar2(200),
	product_price number,
	product_image varchar2(50),--이미지 파일 이름
	primary key(product_code)
);

create sequence product_seq;

--상품을 직접 insert
insert into product (product_code, product_name, product_price, product_image) VALUES (product_seq.nextval,'','','');
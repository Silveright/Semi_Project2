
create table wisglist( -- 관심상품
    wishlist_code  number(5)    primary key,
    id             varchar2(20) references customer(id),
    product_code   number(5)    references product(product_code),
)

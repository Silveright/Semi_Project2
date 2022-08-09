
--order_code
-- - vam_order 테이블의 기본키입니다. 
--receiver 
--- 배송을 받는 사람 이름입니다.
--id
-- - 주문하는 사람의 아이디입니다.
--post 우편번호
--address1,2
-- - 주문한 사람이 배송받을 주소입니다.
--orderstate
-- - 주문 상태입니다.
-- - '배송 준비', '배송 취소'(, '배송 중', '배송 완료) 값이 들어갈 것입니다.
-- - 주문을 하게 되면 '배송준비' 상태가 되고, 주문 취소를 하면 '배송취소'상태가 됩니다. >> 주문서 작성페이지 input type hidden으로 배송준비 값을 받아와 넘겨주기
--delivercost 
-- - 배송비입니다.
--usePoint
-- - 주문 시 회원이 사용한 포인트입니다.
--orderDate 
-- - 주문한 날짜입니다.
create table order_info(
    order_code number primary key,
    receiver varchar2(50) not null,
    id varchar2(20)  references customer(id),
    post number not null,
    address1 varchar2(100) not null,
    address2 varchar2(100) not null,
    orderstate varchar2(30) not null,
    delivercost number not null,
    usepoint number not null,
    orderDate date default sysdate,
);

--orderitem_code
-- - order_item 테이블의 기본키입니다.
-- - DB에서 생성해주는 기본키 기능을 사용할 것입니다.

--order_code
-- - vma_order의 기본키 값이 들어가는 외래 키입니다.

--product_code 
-- - vam_book의 기본키 값이 들어가는 외래 키입니다.

--bookCount
-- - 주문한 상품의 수량입니다.

--bookPrice
-- - 주문한 상품 한 개의 가격입니다. (할인 적용 X)

--bookDiscount
-- - 주문한 상품의 할인율입니다.
create table order_info(--하나의 주문정보를 담는 테이블
    order_code number primary key,
    receiver varchar2(50) not null,
    id varchar2(20)  references member(id),
    post number not null,
    address1 varchar2(100) not null,
    address2 varchar2(100) not null,
    orderstate varchar2(30) not null default '배송 준비',
    order_cost number not null,
    orderDate date default sysdate,
);

create table order_item(--한 주문에서 각 상품의 정보를 담는 테이블
    orderitem_code number primary key,
    order_code number,
    product_code number,
    productcount number not null,
    productprice number not null,
    FOREIGN KEY (order_code) REFERENCES order_info(order_code),
    FOREIGN KEY (product_code) REFERENCES product(product_code)
);
--주문내역 보는 쿼리문
select * from order_item
inner join order_info
on order_item.order_code = order_info.order_code
inner join product
on product.product_code = order_item.product_code
where order_info id=?;
  
  
--상품 테이블 예시
  PRODUCT_CODE PRODUCT_NA PRODUCT_PRICE PRODUCT_IM
------------ ---------- ------------- ----------
           1 반팔                5000 사진
           2 긴팔                6000 사진1
--주문 정보 테이블 예시
ORDER_CODE RECEIVER   ID               POST ADDRESS1   ADDRESS2   ORDERSTATE ORDER_COST ORDERDAT
---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- --------
         1 홍길방     test            12345 서울시     행복도시   배송전          16000 22/08/08
--주문 상품 테이블 예시         
ORDERITEM_CODE ORDER_CODE PRODUCT_CODE PRODUCTCOUNT PRODUCTPRICE
-------------- ---------- ------------ ------------ ------------
             1          1            1            2        10000
             2          1            2            1         6000
             
             
             
ORDERITEM_CODE ORDER_CODE PRODUCT_CODE PRODUCTCOUNT PRODUCTPRICE ORDER_CODE RECEIVER   ID               POST ADDRESS1   ADDRESS2   ORDERSTATE ORDER_COST ORDERDAT PRODUCT_CODE PRODUCT_NA PRODUCT_PRICE PRODUCT_IM
-------------- ---------- ------------ ------------ ------------ ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- -------- ------------ ---------- ------------- ----------
             1          1            1            2        10000          1 홍길방     test            12345 서울시     행복도시   배송전          16000 22/08/08            1 반팔                5000 사진
             2          1            2            1         6000          1 홍길방     test            12345 서울시     행복도시   배송전          16000 22/08/08            2 긴팔                6000 사진1
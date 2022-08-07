
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

create table order_item(
    orderitem_code number primary key,
    order_code number,
    product_code number,
    productcount number not null,
    productprice number not null,
    productdiscount number not null,
    FOREIGN KEY (order_code) REFERENCES order_info(order_code),
    FOREIGN KEY (product_code) REFERENCES product(product_code)
);

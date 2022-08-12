create table customer(
	id					varchar2(20) primary key,
	password			varchar2(20),
	name				varchar2(15),
	jumin				varchar2(14),
	gender				char(1)  check(gender in ('m','f')), 
	post				varchar2(5),
	address				varchar2(150),
	phone				varchar2(11),   --변수명 phone, varcher(11)로 수정함 (01012345678)
	address_detail		varchar2(100),	-- 8/12 상세주소 컬럼 추가
	email				varchar2(30),
	register_date		date default sysdate,
	grade				char(1) -- S,A,B,C
)

	--seconhand_board 테이블 생성후에 추가해줄것
	secondhand_code		number(5) references secondhand_board(secondhand_code) on delete cascade

select * from customer
	


--예시

insert into customer
values('test', '1234', '가나다', '111111-1111111', 'm', '12345', '서울시 서울구', '01012341234', '서울 아파트 101동 101호 ' 'test@naver.com', sysdate, 'S' );



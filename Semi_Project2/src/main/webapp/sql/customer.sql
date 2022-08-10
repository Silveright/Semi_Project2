create table customer(
	id					varchar2(20) primary key,
	password			varchar2(20),
	name				varchar2(15),
	jumin				varchar2(14),
	gender				char(1),
	post				varchar2(5),
	address				varchar2(150),
	phone				varchar2(11)),   --변수명 phone, varcher(11)로 수정함 (01012345678)
	email				varchar2(30),
	register_date		date default sysdate,
	grade				char(1)
)

	--seconhand_board 테이블 생성후에 추가해줄것
	secondhand_code		number(5) references secondhand_board(secondhand_code) on delete cascade
	
select * from customer;


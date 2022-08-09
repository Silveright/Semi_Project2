create table customer(
	id					varchar2(20) primary key,
	password			varchar2(20),
	name				varchar2(15),
	jumin				varchar2(14),
	gender				char(1),
	post				varchar2(5),
	address				varchar2(150),
	tel					varchar2(8),
	email				varchar2(30),
	register_date		date default sysdate,
	grade				char(1),
	secondhand_code		number(5) foreign key references secondhand_board(secondhand_code) on delete cascade,
);

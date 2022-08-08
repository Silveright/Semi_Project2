create table addresslist(
	address_id varchar2(20) references customer(id) on delete cascade,
	address_name varchar2,
	address_receiver number,
	address_post number,
	address_phone varchar2,
	address_address number,
);

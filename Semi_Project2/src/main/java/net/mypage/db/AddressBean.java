package net.mypage.db;

public class AddressBean {
	private String address_id;
	private String address_name;
	private String address_receiver;
	private String address_phone;
	private int address_post;
	
	public int getAddress_post() {
		return address_post;
	}
	public void setAddress_post(int address_post) {
		this.address_post = address_post;
	}
	private String address;
	
	public String getAddress_id() {
		return address_id;
	}
	public void setAddress_id(String address_id) {
		this.address_id = address_id;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	public String getAddress_receiver() {
		return address_receiver;
	}
	public void setAddress_receiver(String address_receiver) {
		this.address_receiver = address_receiver;
	}
	public String getAddress_phone() {
		return address_phone;
	}
	public void setAddress_phone(String address_phone) {
		this.address_phone = address_phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}

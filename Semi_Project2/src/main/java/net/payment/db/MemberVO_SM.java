package net.payment.db;

public class MemberVO_SM {
	
	private String name; 				// 회원명
	private String post;				// 우편번호
	private String address; 			// 주소
	private String email; 				// 이메일 
	private String tel; 				// 연락처 
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
}
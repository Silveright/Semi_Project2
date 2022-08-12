package net.product.db;

public class CartDTO {
	public int cart_code;
    public String id;      
    public int product_code;
    public int cart_count;
    public String opt_color;
	public String opt_size;
	
    public int getCart_code() {
		return cart_code;
	}
	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getProduct_code() {
		return product_code;
	}
	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}
	public int getCart_count() {
		return cart_count;
	}
	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}
	public String getOpt_color() {
		return opt_color;
	}
	public void setOpt_color(String opt_color) {
		this.opt_color = opt_color;
	}
	public String getOpt_size() {
		return opt_size;
	}
	public void setOpt_size(String opt_size) {
		this.opt_size = opt_size;
	}
}

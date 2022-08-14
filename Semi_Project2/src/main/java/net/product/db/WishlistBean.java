package net.product.db;

public class WishlistBean {
	private int wishlist_code;
	private String id;
	private int product_code;
	private String opt_color;
	private String opt_size;
	
	public int getWishlist_code() {
		return wishlist_code;
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
	public void setWishlist_code(int wishlist_code) {
		this.wishlist_code = wishlist_code;
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

}

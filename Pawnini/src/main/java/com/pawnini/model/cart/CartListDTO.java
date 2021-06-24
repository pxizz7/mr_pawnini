package com.pawnini.model.cart;

public class CartListDTO {
	private int cart_id;
	private int cart_amount;
	private int product_id;
	private String member_id;
	//카트목록용 추가 변수
	private int cart_rnum;
	private String product_name;
	private int product_price;
	private String product_thumb_img;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getCart_rnum() {
		return cart_rnum;
	}
	public void setCart_rnum(int cart_rnum) {
		this.cart_rnum = cart_rnum;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_thumb_img() {
		return product_thumb_img;
	}
	public void setProduct_thumb_img(String product_thumb_img) {
		this.product_thumb_img = product_thumb_img;
	}
	@Override
	public String toString() {
		return "CartListDTO [cart_id=" + cart_id + ", cart_amount=" + cart_amount + ", product_id=" + product_id
				+ ", member_id=" + member_id + ", cart_rnum=" + cart_rnum + ", product_name=" + product_name
				+ ", product_price=" + product_price + ", product_thumb_img=" + product_thumb_img + "]";
	}
	
	
	
}

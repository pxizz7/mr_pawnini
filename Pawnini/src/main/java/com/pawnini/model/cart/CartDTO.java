package com.pawnini.model.cart;

public class CartDTO {
	private int cart_id;
	private int cart_amount;
	private int product_id;
	private String member_id;
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
	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", cart_amount=" + cart_amount + ", product_id=" + product_id
				+ ", member_id=" + member_id + "]";
	}
	
	
}

package com.pawnini.model.product;

import java.sql.Date;

public class ProductDTO {
	private int product_id;
	private String product_f_code;
	private String product_s_code;
	private String product_t_code;
	private String product_t_code2;
	private String product_brand;
	private String product_name;
	private String product_option;
	private String product_img;
	private String product_thumb_img;
	private String product_desc;
	private int product_stock;
	private int price;
	private Date product_date;
	private int product_hits;
	private int product_price;
	private int product_c_price;

	

	
	
	public String getProduct_option() {
		return product_option;
	}

	public void setProduct_option(String product_option) {
		this.product_option = product_option;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_f_code() {
		return product_f_code;
	}

	public void setProduct_f_code(String product_f_code) {
		this.product_f_code = product_f_code;
	}

	public String getProduct_s_code() {
		return product_s_code;
	}

	public void setProduct_s_code(String product_s_code) {
		this.product_s_code = product_s_code;
	}

	public String getProduct_t_code() {
		return product_t_code;
	}

	public void setProduct_t_code(String product_t_code) {
		this.product_t_code = product_t_code;
	}

	public String getProduct_t_code2() {
		return product_t_code2;
	}

	public void setProduct_t_code2(String product_t_code2) {
		this.product_t_code2 = product_t_code2;
	}

	public String getProduct_brand() {
		return product_brand;
	}

	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	public String getProduct_thumb_img() {
		return product_thumb_img;
	}

	public void setProduct_thumb_img(String product_thumb_img) {
		this.product_thumb_img = product_thumb_img;
	}

	public String getProduct_desc() {
		return product_desc;
	}

	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}

	public int getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getProduct_date() {
		return product_date;
	}

	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}

	public int getProduct_hits() {
		return product_hits;
	}

	public void setProduct_hits(int product_hits) {
		this.product_hits = product_hits;
	}

	public int getProduct_c_price() {
		return product_c_price;
	}

	public void setProduct_c_price(int product_c_price) {
		this.product_c_price = product_c_price;
	}

	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", product_f_code=" + product_f_code + ", product_s_code="
				+ product_s_code + ", product_t_code=" + product_t_code + ", product_t_code2=" + product_t_code2
				+ ", product_brand=" + product_brand + ", product_name=" + product_name + ", product_option="
				+ product_option + ", product_img=" + product_img + ", product_thumb_img=" + product_thumb_img
				+ ", product_desc=" + product_desc + ", product_stock=" + product_stock + ", price=" + price
				+ ", product_date=" + product_date + ", product_hits=" + product_hits + ", product_price="
				+ product_price + ", product_c_price=" + product_c_price + "]";
	}

}

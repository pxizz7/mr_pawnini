package com.pawnini.model.paws;

import java.sql.Date;

// 입양할 동물 정보 데이터
public class PawsDTO {
	private int paws_id;
	private String paws_f_code;
	private String paws_s_code;
	private String paws_name;
	private String paws_age;
	private String paws_desc;
	private String paws_img;
	private Date paws_regdate;
	private String paws_sex;
	private char paws_is_neutered;
	private String paws_health;
	private String paws_thumb_img;
	private String searchKeyword;
	
	
	
	public String getSearchKeyword() {
		return searchKeyword;
	}


	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	public String getPaws_thumb_img() {
		return paws_thumb_img;
	}


	public void setPaws_thumb_img(String paws_thumb_img) {
		this.paws_thumb_img = paws_thumb_img;
	}


	public int getPaws_id() {
		return paws_id;
	}


	public void setPaws_id(int paws_id) {
		this.paws_id = paws_id;
	}


	public String getPaws_f_code() {
		return paws_f_code;
	}


	public void setPaws_f_code(String paws_f_code) {
		this.paws_f_code = paws_f_code;
	}


	public String getPaws_s_code() {
		return paws_s_code;
	}


	public void setPaws_s_code(String paws_s_code) {
		this.paws_s_code = paws_s_code;
	}


	public String getPaws_name() {
		return paws_name;
	}


	public void setPaws_name(String paws_name) {
		this.paws_name = paws_name;
	}


	public String getPaws_age() {
		return paws_age;
	}


	public void setPaws_age(String paws_age) {
		this.paws_age = paws_age;
	}


	public String getPaws_desc() {
		return paws_desc;
	}


	public void setPaws_desc(String paws_desc) {
		this.paws_desc = paws_desc;
	}


	public String getPaws_img() {
		return paws_img;
	}


	public void setPaws_img(String paws_img) {
		this.paws_img = paws_img;
	}


	public Date getPaws_regdate() {
		return paws_regdate;
	}


	public void setPaws_regdate(Date paws_regdate) {
		this.paws_regdate = paws_regdate;
	}


	public String getPaws_sex() {
		return paws_sex;
	}


	public void setPaws_sex(String paws_sex) {
		this.paws_sex = paws_sex;
	}


	public char getPaws_is_neutered() {
		return paws_is_neutered;
	}


	public void setPaws_is_neutered(char paws_is_neutered) {
		this.paws_is_neutered = paws_is_neutered;
	}


	public String getPaws_health() {
		return paws_health;
	}


	public void setPaws_health(String paws_health) {
		this.paws_health = paws_health;
	}


	@Override
	public String toString() {
		return "pawsDTO [paws_id=" + paws_id + ", paws_f_code=" + paws_f_code + ", paws_s_code=" + paws_s_code
				+ ", paws_name=" + paws_name + ", paws_age=" + paws_age + ", paws_desc=" + paws_desc + ", paws_img="
				+ paws_img + ", paws_regdate=" + paws_regdate + ", paws_sex=" + paws_sex + ", paws_is_neutered="
				+ paws_is_neutered + ", paws_health=" + paws_health + "]";
	}
	
	
}

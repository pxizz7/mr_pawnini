package com.pawnini.model.product_inq;

import java.sql.Date;

import javax.xml.bind.annotation.XmlTransient;

public class Product_inqDTO {
	private int inq_id;  // 제품문의 게시판 번호
	private String inq_name; //제품문의 게시판 작성자
	private String inq_title; //제품문의 게시판 글제목
	private String inq_content; //제품문의 게시판 글내용
	private Date inq_date; //제품문의 게시판 글 작성일
	private String inq_show; //제품문의 게시판 노출여부
	private String inq_image; // 제품문의 게시판 이미지
	private String member_id; // pawnini 회원 아이디
	private int product_id; 	//제품 번호	
	
	private String inq_thumb; // 썸네일
	public String getInq_thumb() {
		return inq_thumb;
	}
	public void setInq_thumb(String inq_thumb) {
		this.inq_thumb = inq_thumb;
	}
	@XmlTransient
	private String searchCondition; //검색 범위
	@XmlTransient
	private String searchKeyword; 	//검색어
	
	private String inq_ans;
	
	public String getInq_ans() {
		return inq_ans;
	}
	public void setInq_ans(String inq_ans) {
		this.inq_ans = inq_ans;
	}
	public int getInq_id() {
		return inq_id;
	}
	public void setInq_id(int inq_id) {
		this.inq_id = inq_id;
	}
	public String getInq_name() {
		return inq_name;
	}
	public void setInq_name(String inq_name) {
		this.inq_name = inq_name;
	}
	public String getInq_title() {
		return inq_title;
	}
	public void setInq_title(String inq_title) {
		this.inq_title = inq_title;
	}
	public String getInq_content() {
		return inq_content;
	}
	public void setInq_content(String inq_content) {
		this.inq_content = inq_content;
	}
	public Date getInq_date() {
		return inq_date;
	}
	public void setInq_date(Date inq_date) {
		this.inq_date = inq_date;
	}
	public String getInq_show() {
		return inq_show;
	}
	public void setInq_show(String inq_show) {
		this.inq_show = inq_show;
	}
	public String getInq_image() {
		return inq_image;
	}
	public void setInq_image(String inq_image) {
		this.inq_image = inq_image;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	@Override
	public String toString() {
		return "Product_inqDTO [inq_id=" + inq_id + ", inq_name=" + inq_name + ", inq_title=" + inq_title
				+ ", inq_content=" + inq_content + ", inq_date=" + inq_date + ", inq_show=" + inq_show + ", inq_image="
				+ inq_image + ", member_id=" + member_id + ", product_id=" + product_id + ", inq_thumb=" + inq_thumb
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", inq_ans=" + inq_ans
				+ "]";
	}
	
	
	
}

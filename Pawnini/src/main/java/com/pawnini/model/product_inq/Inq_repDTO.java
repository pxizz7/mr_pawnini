package com.pawnini.model.product_inq;

import java.util.Date;

public class Inq_repDTO {
	
	private int inq_rep_id;   //상품문의 답변 번호
	private String inq_rep_name; //상품문의 답변  작성자
	private String inq_rep_title; //상품문의 답변 제목
	private String inq_rep_content; //상품문의 답변 내용
	private Date inq_rep_date; //상품문의 답변 작성일
	private int inq_id; //상품문의 글 번호
	public int getInq_rep_id() {
		return inq_rep_id;
	}
	public void setInq_rep_id(int inq_rep_id) {
		this.inq_rep_id = inq_rep_id;
	}
	public String getInq_rep_name() {
		return inq_rep_name;
	}
	public void setInq_rep_name(String inq_rep_name) {
		this.inq_rep_name = inq_rep_name;
	}
	public String getInq_rep_title() {
		return inq_rep_title;
	}
	public void setInq_rep_title(String inq_rep_title) {
		this.inq_rep_title = inq_rep_title;
	}
	public String getInq_rep_content() {
		return inq_rep_content;
	}
	public void setInq_rep_content(String inq_rep_content) {
		this.inq_rep_content = inq_rep_content;
	}
	public Date getInq_rep_date() {
		return inq_rep_date;
	}
	public void setInq_rep_date(Date inq_rep_date) {
		this.inq_rep_date = inq_rep_date;
	}
	public int getInq_id() {
		return inq_id;
	}
	public void setInq_id(int inq_id) {
		this.inq_id = inq_id;
	}
	@Override
	public String toString() {
		return "Inq_repDTO [inq_rep_id=" + inq_rep_id + ", inq_rep_name=" + inq_rep_name + ", inq_rep_title="
				+ inq_rep_title + ", inq_rep_content=" + inq_rep_content + ", inq_rep_date=" + inq_rep_date
				+ ", inq_id=" + inq_id + "]";
	}
	
	
}

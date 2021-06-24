package com.pawnini.model.cs;

import java.util.Date;

public class Cs_replyDTO {
	private int cs_reply_id; //댓글 번호
	private String cs_reply_title;
	private String cs_reply_writer; //댓글 작성자
	private char cs_reply_show;
	private String cs_reply_content;
	private String cs_reply_img;
	private Date cs_reply_regdate;
	private int cs_id; //cs 번호
	public int getCs_reply_id() {
		return cs_reply_id;
	}
	public void setCs_reply_id(int cs_reply_id) {
		this.cs_reply_id = cs_reply_id;
	}
	public String getCs_reply_title() {
		return cs_reply_title;
	}
	public void setCs_reply_title(String cs_reply_title) {
		this.cs_reply_title = cs_reply_title;
	}
	public String getCs_reply_writer() {
		return cs_reply_writer;
	}
	public void setCs_reply_writer(String cs_reply_writer) {
		this.cs_reply_writer = cs_reply_writer;
	}
	public char getCs_reply_show() {
		return cs_reply_show;
	}
	public void setCs_reply_show(char cs_reply_show) {
		this.cs_reply_show = cs_reply_show;
	}
	public String getCs_reply_content() {
		return cs_reply_content;
	}
	public void setCs_reply_content(String cs_reply_content) {
		this.cs_reply_content = cs_reply_content;
	}
	public String getCs_reply_img() {
		return cs_reply_img;
	}
	public void setCs_reply_img(String cs_reply_img) {
		this.cs_reply_img = cs_reply_img;
	}
	public Date getCs_reply_regdate() {
		return cs_reply_regdate;
	}
	public void setCs_reply_regdate(Date cs_reply_regdate) {
		this.cs_reply_regdate = cs_reply_regdate;
	}
	public int getCs_id() {
		return cs_id;
	}
	public void setCs_id(int cs_id) {
		this.cs_id = cs_id;
	}
	@Override
	public String toString() {
		return "Cs_replyDTO [cs_reply_id=" + cs_reply_id + ", cs_reply_writer=" + cs_reply_writer + ", cs_reply_title="
				+ cs_reply_title + ", cs_reply_show=" + cs_reply_show + ", cs_reply_content=" + cs_reply_content
				+ ", cs_reply_img=" + cs_reply_img + ", cs_reply_regdate=" + cs_reply_regdate + ", cs_id=" + cs_id
				+ "]";
	}
	
	
}

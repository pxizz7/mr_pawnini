package com.pawnini.model.review;

import java.sql.Date;

public class ReviewReplyDTO {
	private int rev_id;
	private int rev_com_id;
	private String rev_com_writer;
	private String rev_com_content;
	private Date rev_com_date;
	private String rev_com_show;
	private int rev_com_like;
	private Date rev_com_moddate;
	private String member_id;
	public int getRev_id() {
		return rev_id;
	}
	public void setRev_id(int rev_id) {
		this.rev_id = rev_id;
	}
	public int getRev_com_id() {
		return rev_com_id;
	}
	public void setRev_com_id(int rev_com_id) {
		this.rev_com_id = rev_com_id;
	}
	public String getRev_com_writer() {
		return rev_com_writer;
	}
	public void setRev_com_writer(String rev_com_writer) {
		this.rev_com_writer = rev_com_writer;
	}
	public String getRev_com_content() {
		return rev_com_content;
	}
	public void setRev_com_content(String rev_com_content) {
		this.rev_com_content = rev_com_content;
	}
	public Date getRev_com_date() {
		return rev_com_date;
	}
	public void setRev_com_date(Date rev_com_date) {
		this.rev_com_date = rev_com_date;
	}
	public String getRev_com_show() {
		return rev_com_show;
	}
	public void setRev_com_show(String rev_com_show) {
		this.rev_com_show = rev_com_show;
	}
	public int getRev_com_like() {
		return rev_com_like;
	}
	public void setRev_com_like(int rev_com_like) {
		this.rev_com_like = rev_com_like;
	}
	public Date getRev_com_moddate() {
		return rev_com_moddate;
	}
	public void setRev_com_moddate(Date rev_com_moddate) {
		this.rev_com_moddate = rev_com_moddate;
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "ReviewReplyDTO [rev_id=" + rev_id + ", rev_com_id=" + rev_com_id + ", rev_com_writer=" + rev_com_writer
				+ ", rev_com_content=" + rev_com_content + ", rev_com_date=" + rev_com_date + ", rev_com_show="
				+ rev_com_show + ", rev_com_like=" + rev_com_like + ", rev_com_moddate=" + rev_com_moddate
				+ ", member_id=" + member_id + "]";
	}
	
	
}

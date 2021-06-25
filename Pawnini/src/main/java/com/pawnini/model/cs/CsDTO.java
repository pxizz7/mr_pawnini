package com.pawnini.model.cs;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class CsDTO {
	private int cs_id;
	private int cs_parent_cs_id;
	private int cs_re_group;
	private int cs_re_order;
	private int cs_re_depth;
	private String cs_title;
	private String cs_writer;
	private String cs_show;
	private String cs_content;
	private Date cs_regdate;
	private int cs_hit;
	private String cs_fileName;
	private String member_id;
	
	private MultipartFile cs_uploadFile;
	private int prev_cs_id;
	private int next_cs_id;
	private String prev_cs_title;
	private String next_cs_title;

	
	public int getCs_id() {
		return cs_id;
	}
	public void setCs_id(int cs_id) {
		this.cs_id = cs_id;
	}
	
	public int getCs_parent_cs_id() {
		return cs_parent_cs_id;
	}
	public void setCs_parent_cs_id(int cs_parent_cs_id) {
		this.cs_parent_cs_id = cs_parent_cs_id;
	}
	public int getCs_re_group() {
		return cs_re_group;
	}
	public void setCs_re_group(int cs_re_group) {
		this.cs_re_group = cs_re_group;
	}
	public int getCs_re_order() {
		return cs_re_order;
	}
	public void setCs_re_order(int cs_re_order) {
		this.cs_re_order = cs_re_order;
	}
	public int getCs_re_depth() {
		return cs_re_depth;
	}
	public void setCs_re_depth(int cs_re_depth) {
		this.cs_re_depth = cs_re_depth;
	}
	public int getCs_hit() {
		return cs_hit;
	}
	public void setCs_hit(int cs_hit) {
		this.cs_hit = cs_hit;
	}
	public String getCs_title() {
		return cs_title;
	}
	public void setCs_title(String cs_title) {
		this.cs_title = cs_title;
	}
	public String getCs_writer() {
		return cs_writer;
	}
	public void setCs_writer(String cs_writer) {
		this.cs_writer = cs_writer;
	}
	public String getCs_show() {
		return cs_show;
	}
	public void setCs_show(String cs_show) {
		this.cs_show = cs_show;
	}
	public String getCs_content() {
		return cs_content;
	}
	public void setCs_content(String cs_content) {
		this.cs_content = cs_content;
	}
	public Date getCs_regdate() {
		return cs_regdate;
	}
	public void setCs_regdate(Date cs_regdate) {
		this.cs_regdate = cs_regdate;
	}
	public String getCs_fileName() {
		return cs_fileName;
	}
	public void setCs_fileName(String cs_fileName) {
		this.cs_fileName = cs_fileName;
	}
	public MultipartFile getCs_uploadFile() {
		return cs_uploadFile;
	}
	public void setCs_uploadFile(MultipartFile cs_uploadFile) {
		this.cs_uploadFile = cs_uploadFile;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}	
	public int getPrev_cs_id() {
		return prev_cs_id;
	}
	public void setPrev_cs_id(int prev_cs_id) {
		this.prev_cs_id = prev_cs_id;
	}
	public int getNext_cs_id() {
		return next_cs_id;
	}
	public void setNext_cs_id(int next_cs_id) {
		this.next_cs_id = next_cs_id;
	}
	public String getPrev_cs_title() {
		return prev_cs_title;
	}
	public void setPrev_cs_title(String prev_cs_title) {
		this.prev_cs_title = prev_cs_title;
	}
	public String getNext_cs_title() {
		return next_cs_title;
	}
	public void setNext_cs_title(String next_cs_title) {
		this.next_cs_title = next_cs_title;
	}
	
	@Override
	public String toString() {
		return "CsDTO [cs_id=" + cs_id + ", cs_parent_cs_id=" + cs_parent_cs_id + ", cs_re_group=" + cs_re_group
				+ ", cs_re_order=" + cs_re_order + ", cs_re_depth=" + cs_re_depth + ", cs_title=" + cs_title
				+ ", cs_writer=" + cs_writer + ", cs_show=" + cs_show + ", cs_content=" + cs_content + ", cs_regdate=" + cs_regdate + ", cs_hit=" + cs_hit + ", cs_fileName="
				+ cs_fileName + ", cs_uploadFile=" + cs_uploadFile + ", prev_cs_id=" + prev_cs_id
				+ ", next_cs_id=" + next_cs_id + ", prev_cs_title=" + prev_cs_title + ", next_cs_title=" + next_cs_title
				+ ", member_id=" + member_id + "]";
	}	
}

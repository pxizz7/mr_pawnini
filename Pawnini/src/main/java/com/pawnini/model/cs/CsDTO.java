package com.pawnini.model.cs;

import java.util.Date;

import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

public class CsDTO {
	private int cs_id;
	private String cs_title;
	private String cs_writer;
	private String cs_show;
	private String cs_content;
	private String cs_img;
	private Date cs_regdate;
	private String cs_file;
	private String member_id;

	@XmlTransient
	private String searchCondition;
	@XmlTransient
	private String searchKeyword;
	
	@XmlTransient
	private MultipartFile uploadedFile;

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
	public MultipartFile getUploadedFile() {
		return uploadedFile;
	}
	public void setUploadedFile(MultipartFile uploadedFile) {
		this.uploadedFile = uploadedFile;
	}
	public int getCs_id() {
		return cs_id;
	}
	public void setCs_id(int cs_id) {
		this.cs_id = cs_id;
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
	public String getCs_img() {
		return cs_img;
	}
	public void setCs_img(String cs_img) {
		this.cs_img = cs_img;
	}
	public Date getCs_regdate() {
		return cs_regdate;
	}
	public void setCs_regdate(Date cs_regdate) {
		this.cs_regdate = cs_regdate;
	}
	public String getCs_file() {
		return cs_file;
	}
	public void setCs_file(String cs_file) {
		this.cs_file = cs_file;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	@Override
	public String toString() {
		return "CsDTO [cs_id=" + cs_id + ", cs_writer=" + cs_writer + ", cs_title=" + cs_title + ", cs_show=" + cs_show
				+ ", cs_content=" + cs_content + ", cs_img=" + cs_img + ", cs_regdate=" + cs_regdate + ", cs_file="
				+ cs_file + ", member_id=" + member_id + "]";
	}
	
}

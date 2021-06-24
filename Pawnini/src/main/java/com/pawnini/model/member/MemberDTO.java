package com.pawnini.model.member;

import java.sql.Date;

public class MemberDTO {
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_nickname;
	private String member_email;
	private String member_phone;
	private int member_grade;
	private Date member_regdate;
	private int member_mileage;
	private int member_postcode;
	private String member_f_addr;
	private String member_s_addr;

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public int getMember_grade() {
		return member_grade;
	}

	public void setMember_grade(int member_grade) {
		this.member_grade = member_grade;
	}

	public int getMember_mileage() {
		return member_mileage;
	}

	public void setMember_mileage(int member_mileage) {
		this.member_mileage = member_mileage;
	}

	public int getMember_postcode() {
		return member_postcode;
	}

	public void setMember_postcode(int member_postcode) {
		this.member_postcode = member_postcode;
	}

	public String getMember_f_addr() {
		return member_f_addr;
	}

	public void setMember_f_addr(String member_f_addr) {
		this.member_f_addr = member_f_addr;
	}

	public String getMember_s_addr() {
		return member_s_addr;
	}

	public void setMember_s_addr(String member_s_addr) {
		this.member_s_addr = member_s_addr;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public Date getMember_regdate() {
		return member_regdate;
	}

	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}

	@Override
	public String toString() {
		return "MemberDTO [member_id=" + member_id + ", member_pwd=" + member_pwd + ", member_name=" + member_name
				+ ", member_nickname=" + member_nickname + ", member_email=" + member_email + ", member_phone="
				+ member_phone + ", member_grade=" + member_grade + ", member_regdate=" + member_regdate
				+ ", member_mileage=" + member_mileage + ", member_postcode=" + member_postcode + ", member_f_addr="
				+ member_f_addr + ", member_s_addr=" + member_s_addr + "]";
	}

	
}

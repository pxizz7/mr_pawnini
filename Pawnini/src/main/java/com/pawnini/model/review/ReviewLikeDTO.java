package com.pawnini.model.review;

public class ReviewLikeDTO {
	private int rev_like_id;
	private int rev_id;
	private String member_id;
	public int getRev_like_id() {
		return rev_like_id;
	}
	public void setRev_like_id(int rev_like_id) {
		this.rev_like_id = rev_like_id;
	}
	public int getRev_id() {
		return rev_id;
	}
	public void setRev_id(int rev_id) {
		this.rev_id = rev_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "ReviewLikeDTO [rev_like_id=" + rev_like_id + ", rev_id=" + rev_id + ", member_id=" + member_id + "]";
	}

}

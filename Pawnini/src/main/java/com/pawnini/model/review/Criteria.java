package com.pawnini.model.review;

public class Criteria {
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 12;
	}
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 120) {
			this.perPageNum = 12;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	// 생략 가능
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
}

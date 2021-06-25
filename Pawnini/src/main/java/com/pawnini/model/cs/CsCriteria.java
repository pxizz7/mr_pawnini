package com.pawnini.model.cs;

import org.springframework.web.util.UriComponentsBuilder;

public class CsCriteria {
	private int curPage; //현재 페이지 번호
	private int perPageNum;  //한 페이지당 보여줄 게시글의 갯수 CsPagination 에 주석처리된 PAGE_SCALE 와 같음
	private int start;
	private int end;
	
	
	//현제 페이지의 게시글 시작 번호 = (현재 페이지 번호 -1)*페이지당 보여줄 게시글 갯수 
	//getPerPageNum = (this.curPage - 1) * perPageNum
	

	public CsCriteria() {// 기본 섹팅
		this.curPage = 1;
		this.perPageNum = 12;
	}
	
	public int getStart() {
		start = ((curPage - 1)* perPageNum) +1;
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		end = start + perPageNum -1;
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPageStart() { //특정 페이지의 게시글 시작 번호, 게시글 시작 행 번호 
		return (this.curPage - 1) *perPageNum;
	}
	
	
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		if (curPage <= 0 || curPage > 120) {
			this.curPage = 1;
			return;
		} 
			this.curPage = curPage;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0) {
			this.perPageNum = 12;
			return;
		}	
		this.perPageNum = perPageNum;
	}
	
	public String makeQuery() {
		return UriComponentsBuilder.newInstance()
				.queryParam("curPage", curPage)
				.queryParam("perPageNum", this.perPageNum)
				.build().encode().toString();
	}

	@Override
	public String toString() {
		return "CsCriteria [curPage=" + curPage + ", perPageNum=" + perPageNum + ", start=" + start + ", end=" + end
				+ "]";
	}
	
	
}

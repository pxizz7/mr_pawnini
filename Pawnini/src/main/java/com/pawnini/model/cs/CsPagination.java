package com.pawnini.model.cs;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

//getter/setter 
public class CsPagination {
		private CsCriteria cri;
		private int totalCount;
		private int startPage;
		private int endPage;
		private boolean prev;
		private boolean next;
		private int displayPageNum = 10;
		private int firstPage;
		
		
		public CsPagination() {
			this.firstPage = 1;
		}
		public int getFirstPage() {
			return firstPage;
		}
		public void setFirstPage(int firstPage) {
			this.firstPage = firstPage;
		}
		public CsCriteria getCri() {
			return cri;
		}
		public void setCri(CsCriteria cri) {
			this.cri = cri;
		}
		public int getTotalCount() {
			return totalCount;
		}
		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
			calcData();
		}
		private void calcData() {
			endPage = (int) (Math.ceil(cri.getCurPage()/ (double) displayPageNum) * displayPageNum);
			startPage = (endPage - displayPageNum) + 1;
			
			int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
			if (endPage > tempEndPage) endPage = tempEndPage;
		
			prev = startPage == 1 ? false : true;  ///no prev page when curPage = 1
			next = endPage * cri.getPerPageNum() >= totalCount ? false :true; //at the very last page no more next page
		}
		
		public String makeQuery(int curPage) {
			UriComponents uriComponents  = UriComponentsBuilder.newInstance()
					.queryParam("curPage",  curPage)
					.queryParam("perPageNum",cri.getPerPageNum())
					.build();
			return uriComponents.toUriString();
		}
		
		//검색
		public String makeSearch(int curPage) {
			UriComponents uriComponents = UriComponentsBuilder.newInstance()
					.queryParam("curPage", curPage)
					.queryParam("perPageNum", cri.getPerPageNum())
					.queryParam("searchOption", ((CsSearchCriteria) cri).getSearchOption())
					.queryParam("searchKeyword", encoding(((CsSearchCriteria) cri).getSearchKeyword()))
					.build();
			return uriComponents.toUriString();
		}
		
		private String encoding(String searchKeyword) {
			if(searchKeyword == null || searchKeyword.trim().length() == 0) {
				return "";
			}
			try {
				return URLEncoder.encode(searchKeyword, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				return "";
			}
		}
		
		public int getStartPage() {
			return startPage;
		}
		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}
		public boolean isPrev() {
			return prev;
		}
		public void setPrev(boolean prev) {
			this.prev = prev;
		}
		public boolean isNext() {
			return next;
		}
		public void setNext(boolean next) {
			this.next = next;
		}
		public int getDisplayPageNum() {
			return displayPageNum;
		}
		public void setDisplayPageNum(int displayPageNum) {
			this.displayPageNum = displayPageNum;
		}
		public int getEndPage() {
			return endPage;
		}
		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}
}

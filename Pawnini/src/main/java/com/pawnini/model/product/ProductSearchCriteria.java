package com.pawnini.model.product;

public class ProductSearchCriteria extends Criteria{

		// 검색용 (DB x)
		private String searchOption="";
		private String searchKeyword="";
		private String searchKeyword2="";
		private String searchKeyword3="";
		
		public String getSearchKeyword3() {
			return searchKeyword3;
		}
		public void setSearchKeyword3(String searchKeyword3) {
			this.searchKeyword3 = searchKeyword3;
		}
		public String getSearchKeyword2() {
			return searchKeyword2;
		}
		public void setSearchKeyword2(String searchKeyword2) {
			this.searchKeyword2 = searchKeyword2;
		}
		public String getSearchOption() {
			return searchOption;
		}
		public void setSearchOption(String searchOption) {
			this.searchOption = searchOption;
		}
		public String getSearchKeyword() {
			return searchKeyword;
		}
		public void setSearchKeyword(String searchKeyword) {
			this.searchKeyword = searchKeyword;
		}
		@Override
		public String toString() {
			return "ProductSearchCriteria [searchOption=" + searchOption + ", searchKeyword=" + searchKeyword + "]";
		}
		
		
		
		
}

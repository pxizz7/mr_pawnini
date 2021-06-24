package com.pawnini.model.product_inq;

import java.util.List;

import com.pawnini.model.review.SearchCriteria;

public interface Product_inqService {
	
	//  등록
	void insertProduct_inq(Product_inqDTO dto) throws Exception;
	
	//  수정
	void updateProduct_inq(Product_inqDTO dto) throws Exception;
	
	//  삭제
	void deleteProduct_inq(Product_inqDTO dto) throws Exception;
	
	//  리스트
	List<Product_inqDTO> getProduct_inqList(SearchCriteria scri) throws Exception;
	
	//  상세 정보 조회
	Product_inqDTO getProduct_inq(Product_inqDTO dto) throws Exception;
	
	// 레코드 카운트
	int countProduct_inq(SearchCriteria scri) throws Exception;
	// 답변 상태 변환
	void updateInq_ans(Product_inqDTO dto) throws Exception;
	
	void cancleInq_ans(Product_inqDTO dto) throws Exception;
	
}

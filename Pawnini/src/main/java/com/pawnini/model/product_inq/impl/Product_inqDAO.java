package com.pawnini.model.product_inq.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.product_inq.Product_inqDTO;
import com.pawnini.model.review.SearchCriteria;


@Repository
public class Product_inqDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 등록
	public void insertProduct_inq(Product_inqDTO dto) throws Exception {
		System.out.println("mybatis/inserting...");
		System.out.println(dto.toString());
		mybatis.insert("Product_inqDAO.insertProduct_inq",dto);
		System.out.println("mybatis/insertProduct_inq 실행완료");
	}
	// 수정
	public void updateProduct_inq(Product_inqDTO dto) throws Exception {
		System.out.println("수정중입니다...");
		mybatis.update("Product_inqDAO.updateProduct_inq",dto);
	}
	//삭제 
	public void deleteProduct_inq(Product_inqDTO dto) throws Exception {
		System.out.println("삭제중입니다...");
		mybatis.delete("Product_inqDAO.deleteProduct_inq",dto);
	}
	//상세보기
	public Product_inqDTO getProduct_inq(Product_inqDTO dto)throws Exception {
		System.out.println("상세보기중입니다...");
		
		return (Product_inqDTO) mybatis.selectOne("Product_inqDAO.getProduct_inq",dto);
	}
	//글 목록 조회
	public List<Product_inqDTO> getProduct_inqList(SearchCriteria scri) throws Exception {
		System.out.println("목록 불러오기 중입니다...");
		
		return mybatis.selectList("Product_inqDAO.getProduct_inqList",scri);
	}
	//레코드 갯수 계산
	public int countProduct_inq(SearchCriteria scri) throws Exception{
		System.out.println("레코드 수 카운팅 중입니다...");
		
		return mybatis.selectOne("Product_inqDAO.countProduct_inq", scri);
	}
	//답변상태 변환
	public void updateInq_ans(Product_inqDTO dto) throws Exception{
		System.out.println("답변상태를 변환중입니다 Y...");
		mybatis.update("Product_inqDAO.updateInq_ans", dto); 
	}
	public void cancleInq_ans(Product_inqDTO dto) throws Exception{
		System.out.println("답변상태를 변환중입니다 N...");
		mybatis.update("Product_inqDAO.cancleInq_ans" , dto);
	}
	
}

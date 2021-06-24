package com.pawnini.model.review.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.review.ReviewDTO;
import com.pawnini.model.review.ReviewLikeDTO;
import com.pawnini.model.review.SearchCriteria;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 후기 등록
	public void insertReview(ReviewDTO dto) throws Exception {
		System.out.println("Mybatis/insertReview() 기능처리 시작");
		System.out.println(dto.toString());
		mybatis.insert("ReviewDAO.insertReview", dto);
		System.out.println("Mybatis/insertReview() 기능처리 완료");
	}
	
	//후기 수정
	public void updateReview(ReviewDTO dto) throws Exception {
		System.out.println("Mybatis/updateReview() 기능처리");
		mybatis.update("ReviewDAO.updateReview", dto);
	}
	
	//후기 삭제
	public void deleteReview(ReviewDTO dto) throws Exception {
		System.out.println("Mybatis/deleteReview() 기능처리");
		mybatis.update("ReviewDAO.deleteReview", dto);
	}
	
	//후기 목록
	public List<ReviewDTO> getReviewList(SearchCriteria scri) throws Exception {
		System.out.println("Mybatis/getReviewList() 기능처리");
		return mybatis.selectList("ReviewDAO.getReviewList", scri);
	}
	
	//게시물 총 갯수
	public int countReviewList(SearchCriteria scri) throws Exception {
		System.out.println("Mybatis/countReviewList() 기능처리");
		return mybatis.selectOne("ReviewDAO.countReviewList", scri);
	}
	
	//후기 상세보기
	public ReviewDTO getReview(ReviewDTO dto) throws Exception {
		System.out.println("Mybatis/getReview() 기능처리");
		return (ReviewDTO) mybatis.selectOne("ReviewDAO.getReview", dto);
	}
	
	//후기 댓글 개수 구하기
	public void updateReplyCount(int rev_id) throws Exception {
		System.out.println("Mybatis/updateReplyCount() 기능처리");
		mybatis.update("ReviewDAO.updateReplyCount", rev_id);
	}
	

}

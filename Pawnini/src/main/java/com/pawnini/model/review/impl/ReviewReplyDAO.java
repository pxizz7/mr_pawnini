package com.pawnini.model.review.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.review.ReviewReplyDTO;

@Repository
public class ReviewReplyDAO {
		
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//댓글 목록 불러오기
	public List<ReviewReplyDTO> readReply(int rev_id) throws Exception{
		return mybatis.selectList("ReviewReplyDAO.readReviewReply", rev_id);
	}
	//댓글 삽입
	public void insertReviewReply(ReviewReplyDTO dto) throws Exception{
		mybatis.insert("ReviewReplyDAO.insertReviewReply", dto);
	}
	//댓글 수정
	public void updateReviewReply(ReviewReplyDTO dto) throws Exception{
		mybatis.update("ReviewReplyDAO.updateReviewReply", dto);
	}
	//댓글 삭제
	public void deleteReviewReply(ReviewReplyDTO dto) throws Exception{
		mybatis.delete("ReviewReplyDAO.deleteReviewReply", dto);
	}
	
	//선택한 댓글 조회
	public ReviewReplyDTO getReviewReply(int rev_com_id) throws Exception{
		return mybatis.selectOne("ReviewReplyDAO.getReviewReply", rev_com_id);
	}
	

}

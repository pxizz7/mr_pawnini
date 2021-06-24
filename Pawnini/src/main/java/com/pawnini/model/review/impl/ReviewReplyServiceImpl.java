package com.pawnini.model.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.review.ReviewReplyDTO;
import com.pawnini.model.review.ReviewReplyService;

@Service("reviewReplyService")
public class ReviewReplyServiceImpl implements ReviewReplyService {
	
	@Autowired
	private ReviewReplyDAO reviewReplyDAO;
	
	@Override
	public List<ReviewReplyDTO> readReply(int rev_id) throws Exception {
		System.out.println("댓글 조회");
		return reviewReplyDAO.readReply(rev_id);
	}

	@Override
	public void insertReviewReply(ReviewReplyDTO dto) throws Exception {
		System.out.println("댓글 삽입");
		reviewReplyDAO.insertReviewReply(dto);
	}

	@Override
	public void updateReviewReply(ReviewReplyDTO dto) throws Exception {
		System.out.println("댓글 수정");
		reviewReplyDAO.updateReviewReply(dto);
	}

	@Override
	public void deleteReviewReply(ReviewReplyDTO dto) throws Exception {
		System.out.println("댓글 삭제");
		reviewReplyDAO.deleteReviewReply(dto);
	}

	@Override
	public ReviewReplyDTO getReviewReply(int rev_com_id) throws Exception {
		System.out.println("선택한 댓글 조회");
		return reviewReplyDAO.getReviewReply(rev_com_id);
	}

}

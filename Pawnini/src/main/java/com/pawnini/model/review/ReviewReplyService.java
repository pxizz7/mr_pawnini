package com.pawnini.model.review;

import java.util.List;

public interface ReviewReplyService {

	public List<ReviewReplyDTO> readReply(int rev_id) throws Exception;

	public void insertReviewReply(ReviewReplyDTO dto) throws Exception;

	public void updateReviewReply(ReviewReplyDTO dto) throws Exception;

	public void deleteReviewReply(ReviewReplyDTO dto) throws Exception;
	
	public ReviewReplyDTO getReviewReply(int rev_com_id) throws Exception;
}

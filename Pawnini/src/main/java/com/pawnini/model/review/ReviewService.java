package com.pawnini.model.review;
import java.util.List;


public interface ReviewService {
	//후기 등록
	public void insertReview(ReviewDTO dto) throws Exception;
	
	//후기 수정
	public void updateReview(ReviewDTO dto) throws Exception;

	//후기 삭제
	public void deleteReview(ReviewDTO dto) throws Exception;
	
	//후기 목록
	public List<ReviewDTO> getReviewList(SearchCriteria scri) throws Exception;
	
	//후기 총 갯수
	public int countReviewList(SearchCriteria scri) throws Exception;
	
	//후기 상세보기
	public ReviewDTO getReview(ReviewDTO dto) throws Exception;
	
	//후기 댓글 개수 구하기
	public void updateReplyCount(int rev_id) throws Exception;
	
}

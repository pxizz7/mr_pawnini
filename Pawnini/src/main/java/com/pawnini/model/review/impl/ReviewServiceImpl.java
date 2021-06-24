package com.pawnini.model.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.review.ReviewDTO;
import com.pawnini.model.review.ReviewLikeDTO;
import com.pawnini.model.review.ReviewService;
import com.pawnini.model.review.SearchCriteria;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public void insertReview(ReviewDTO dto) throws Exception {
		System.out.println("후기 작성");
		
		reviewDAO.insertReview(dto);
	}

	@Override
	public void updateReview(ReviewDTO dto) throws Exception {
		System.out.println("후기 수정");
		
		reviewDAO.updateReview(dto);
	}
	
	@Override
	public void deleteReview(ReviewDTO dto) throws Exception {
		System.out.println("후기 삭제");
		
		reviewDAO.deleteReview(dto);
	}

	@Override
	public ReviewDTO getReview(ReviewDTO dto) throws Exception {
		System.out.println("후기 상세보기");
		
		return reviewDAO.getReview(dto);
	}

	@Override
	public List<ReviewDTO> getReviewList(SearchCriteria scri) throws Exception {
		System.out.println("후기 목록");
		
		return reviewDAO.getReviewList(scri);
	}

	@Override
	public int countReviewList(SearchCriteria scri) throws Exception {
		System.out.println("Pagination - 후기 목록 갯수 세기");
		
		return reviewDAO.countReviewList(scri);
	}

	@Override
	public void updateReplyCount(int rev_id) throws Exception {
		System.out.println("후기 목록 갯수 세기");
		
		reviewDAO.updateReplyCount(rev_id);
	}

}

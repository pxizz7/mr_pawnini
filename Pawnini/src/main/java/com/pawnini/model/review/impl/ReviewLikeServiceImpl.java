package com.pawnini.model.review.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.review.ReviewLikeDTO;
import com.pawnini.model.review.ReviewLikeService;

@Service("reviewLikeService")
public class ReviewLikeServiceImpl implements ReviewLikeService {
	
	@Autowired
	private ReviewLikeDAO reviewLikeDAO;
	
	@Override
	public void insertReviewLike(ReviewLikeDTO dto) throws Exception {
		System.out.println("후기 좋아요 생성");
		
		reviewLikeDAO.insertReviewLike(dto);
		reviewLikeDAO.updateReviewLike(dto.getRev_id());
	}

	@Override
	public void deleteReviewLike(ReviewLikeDTO dto) throws Exception {
		System.out.println("후기 좋아요 삭제");
		
		reviewLikeDAO.deleteReviewLike(dto);
		reviewLikeDAO.updateReviewLike(dto.getRev_id());
	}

	@Override
	public int getReviewLike(ReviewLikeDTO dto) throws Exception {
		System.out.println("후기 좋아요 개수 불러오기");
		return reviewLikeDAO.getReviewLike(dto);
	}

	@Override
	public int getReviewLikeTotal(ReviewLikeDTO dto) throws Exception {
		System.out.println("후기 좋아요 총 개수 불러오기");
		return reviewLikeDAO.getReviewLikeTotal(dto);
	}
	
}

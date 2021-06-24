package com.pawnini.model.review;

public interface ReviewLikeService {
		//후기 좋아요 생성
		public void insertReviewLike(ReviewLikeDTO reviewLikeDTO) throws Exception;

		//후기 좋아요 삭제
		public void deleteReviewLike(ReviewLikeDTO reviewLikeDTO) throws Exception;
			
		//후기 좋아요 개수 구하기 (ID 중복 방지용)
		public int getReviewLike(ReviewLikeDTO reviewLikeDTO) throws Exception;
		
		//후기 좋아요 총 개수 구하기
		public int getReviewLikeTotal(ReviewLikeDTO reviewLikeDTO) throws Exception;
}

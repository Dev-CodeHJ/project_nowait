package ezen.nowait.board.service;

import java.util.List;

import ezen.nowait.board.domain.ReviewVO;

public interface ReviewService {
	
	public List<ReviewVO> getList(String name, String value);

	public void insertReview(ReviewVO rVO);
	
	public ReviewVO getReview(int reviewNum);
	
	public boolean updateReview(ReviewVO rVO);
	
	public int deleteReview(int reviewNum);
	
	public ReviewVO getReview2(String reviewContent);
	
	public int reviewSet(String name, String value);
}

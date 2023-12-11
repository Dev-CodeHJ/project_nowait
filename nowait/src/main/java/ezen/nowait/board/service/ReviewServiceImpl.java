package ezen.nowait.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.nowait.board.domain.ReviewVO;
import ezen.nowait.board.mapper.ReviewMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReviewServiceImpl implements ReviewService {
	@Setter(onMethod_=@Autowired)
	private ReviewMapper reviewmapper;
	
	@Override
	public void insertReview(ReviewVO rVO) {
		System.out.println("insert...." + rVO);
		reviewmapper.insertReview(rVO);
	}
	
	@Override
	public ReviewVO getReview(int reviewNum) {
		System.out.println("get...." + reviewNum);
		return reviewmapper.getReview(reviewNum);
	}
	
	@Override
	public boolean updateReview(ReviewVO rVO) {
		System.out.println("update...." + rVO);
		return reviewmapper.updateReview(rVO)==1;
	}
	
	@Override
	public int deleteReview(int reviewNum) {
		System.out.println("delete...." + reviewNum);
		return reviewmapper.deleteReview(reviewNum);
	}
	
	@Override
	public List<ReviewVO> getList(String userId) {
		return reviewmapper.getList(userId);
	}

	
	@Override
	public ReviewVO getReview2(String reviewContent) {
		return reviewmapper.getReview2(reviewContent);
	}
	
	
}

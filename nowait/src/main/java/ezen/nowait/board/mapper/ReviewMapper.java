package ezen.nowait.board.mapper;

import java.util.List;
import java.util.Map;

import ezen.nowait.board.domain.ReviewVO;

public interface ReviewMapper {
		
//	public List<ReviewVO> getList(String userId);
	public List<ReviewVO> getList(Map<String, Object> map);
	
	public void insertReview(ReviewVO rVO);
	
	public ReviewVO getReview(int reviewNum);
	
	public int deleteReview(int reviewNum);
	
	public int updateReview(ReviewVO rVO);
	
	public ReviewVO getReview2(String reviewContent);

	//public List<ReviewVO> getListWithPaging(int rVO);
}

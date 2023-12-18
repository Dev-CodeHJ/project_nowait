package ezen.nowait.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.nowait.board.domain.ReplyVO;
import ezen.nowait.board.domain.ReviewVO;
import ezen.nowait.board.mapper.ReplyMapper;
import ezen.nowait.store.domain.StoreVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{
	
	@Setter(onMethod_=@Autowired)
	private ReplyMapper replyMapper;
	
	
	@Override
	public int insertReply(ReplyVO pVO) {
		System.out.println("댓글 등록..." + pVO);;
		return replyMapper.insertReply(pVO);
	}
	
	@Override
	public ReplyVO getReply(int reviewNum) {
		System.out.println("리뷰조회..." + reviewNum);
		return replyMapper.getReply(reviewNum);
	}
	
	@Override
	public int deleteReply(int replyNum) {
		System.out.println("댓글삭제..." + replyNum);
		return replyMapper.deleteReply(replyNum);
	}
	
	@Override
	public boolean updateReply(ReplyVO pVO) {
		System.out.println("댓글수정..." + pVO);
		return replyMapper.updateReply(pVO) == 1;
	}

}

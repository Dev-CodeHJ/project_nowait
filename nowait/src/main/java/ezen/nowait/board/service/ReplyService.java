package ezen.nowait.board.service;

import java.util.List;

import ezen.nowait.board.domain.ReplyVO;
import ezen.nowait.board.domain.ReviewVO;

public interface ReplyService {
	
	public int insertReply(ReplyVO pVO);
	
	public ReplyVO getReply(int reviewNum);
	
	public boolean updateReply(ReplyVO pVO);
	
	public int deleteReply(int rno);
	
}

package ezen.nowait.board.mapper;

import java.util.List;
import java.util.Map;

import ezen.nowait.board.domain.ReplyVO;
import ezen.nowait.board.domain.ReviewVO;
import ezen.nowait.store.domain.StoreVO;

public interface ReplyMapper {

	public int insertReply(ReplyVO pVO);
	
	public ReplyVO getReply(int replyNum);
	
	public int deleteReply(int replyNum);
	
	public int updateReply(ReplyVO replyContent);

}

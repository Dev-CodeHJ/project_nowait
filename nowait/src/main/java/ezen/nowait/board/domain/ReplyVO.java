package ezen.nowait.board.domain;

import java.util.Date;

import lombok.Data;
@Data
public class ReplyVO {
	private int replyNum;
	private int reviewNum;
	private String replyContent;
	private Date replyRegdate;
	private Date updateRegdate;
}

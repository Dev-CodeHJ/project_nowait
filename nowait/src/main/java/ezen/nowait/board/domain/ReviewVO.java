package ezen.nowait.board.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private int reviewNum;
	private String userId;
	private String crNum;
	private int orderNum;
	private String reviewContent;
	private Date reviewRegdate;
	private Date reviewUpdatedate;
	private byte[] reviewImg;
}

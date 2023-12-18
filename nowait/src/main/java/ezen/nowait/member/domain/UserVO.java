package ezen.nowait.member.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {

	private String userId;
	private String userPw;
	private String userName;
	private String userBirth;
	private String userPhone;
	private String userEmail;
	private String userAddr;
	private int grade;
	private Date userRegdate;
}

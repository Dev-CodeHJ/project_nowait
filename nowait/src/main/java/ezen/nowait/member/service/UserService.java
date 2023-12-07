package ezen.nowait.member.service;

import ezen.nowait.member.domain.UserVO;

public interface UserService {
	
	public UserVO userGet(String userId);
	
	public int userInsert(UserVO uVO);
	
	public int userIdCheck(String userId);
	
	public int userLogin(String userId, String userPw);
}

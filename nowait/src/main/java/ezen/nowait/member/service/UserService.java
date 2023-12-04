package ezen.nowait.member.service;

import ezen.nowait.member.domain.UserVO;

public interface UserService {

	public UserVO userGet(String userId);

	public int userModify(UserVO uVO) ;

	public int userCheckPw(String userId, String userPw);

	public int userIdCheck(String id);
	
	public int userInsert(UserVO uVO);
	
	public int userLogin(String userId, String userPw);

	public int userRemove(String userId, String userPw);
}

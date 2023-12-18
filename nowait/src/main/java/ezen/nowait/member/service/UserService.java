package ezen.nowait.member.service;

import ezen.nowait.member.domain.UserVO;


public interface UserService {
	
	public UserVO userGet(String userId);
<<<<<<< HEAD

	public int userModify(UserVO uVO) ;

	public int userCheckPw(String userId, String userPw);

	public int userIdCheck(String id);
	
	public void userInsert(UserVO uVO);
=======
	
	public int userInsert(UserVO uVO);
	
	public int userIdCheck(String userId);
>>>>>>> main
	
	public int userLogin(String userId, String userPw);
	
	public int userModify(UserVO uVO);
	
	public int userRemove(String userId, String userPw);
	
	public int userCheckPw(String userId, String userPw);
	
}



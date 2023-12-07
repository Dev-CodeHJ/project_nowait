package ezen.nowait.member.mapper;

import ezen.nowait.member.domain.UserVO;

public interface UserMapper {

	public UserVO userGet(String userId);
	
	public int userInsert(UserVO userId);

	public int userDelete(String userId);

	public int userUpdate(UserVO uVO);
	//아이디중복검사
	public int idCheck(String userId);

}

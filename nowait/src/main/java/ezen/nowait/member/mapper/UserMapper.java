package ezen.nowait.member.mapper;

import ezen.nowait.member.domain.UserVO;

public interface UserMapper {

	public UserVO userGet(String userId);
	
	public void userInsert(UserVO userId);
	
	public int userDelete(String userId);
	
	public int userUpdate(UserVO userId);
	
}

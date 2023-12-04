package ezen.nowait.member.mapper;

import ezen.nowait.member.domain.UserVO;

public interface UserMapper {

	public UserVO userGet(String userId);
	
	public int userInsert(UserVO uVO);
	
	public int userDelete(String userId);

	public int userUpdate(UserVO uVO);
	
	public int idCheck(String userId);

}

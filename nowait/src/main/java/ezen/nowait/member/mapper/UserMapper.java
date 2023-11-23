package ezen.nowait.member.mapper;

import ezen.nowait.member.domain.UserVO;

public interface UserMapper {

	public UserVO selectOne(String userId);
	
	public void insert (UserVO userId);
	
	public int delete(String userId);
	
	public int update(UserVO userId);
}

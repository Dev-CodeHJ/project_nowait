package ezen.nowait.member.mapper;

import ezen.nowait.member.domain.UserVO;

public interface UserMapper {

	public UserVO selectOne(String userId);
}

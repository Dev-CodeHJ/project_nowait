package ezen.nowait.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import ezen.nowait.member.domain.UserVO;
import ezen.nowait.member.mapper.UserMapper;
import lombok.AllArgsConstructor;

@Repository
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public int userInsert(UserVO uVO){
		return userMapper.userInsert(uVO);		
	}	
	
<<<<<<< HEAD
	//아이디 중복체크
		@Override
		public int userIdCheck(String userId) {
			int result = userMapper.idCheck(userId);
			return result;
		}

		@Override
		public int userLogin(String userId, String userPw) {
			
			UserVO uVO = userMapper.userGet(userId);
			
			if(uVO != null){
				if(uVO.getUserPw().equals(userPw)) {
					return 1;
				} else {
					return 0;
				}
			} else {
				return -1;
=======
	@Override
	public int userIdCheck(String userId) {
		int result = userMapper.idCheck(userId);
		return result;
	}
	
	@Override
	public int userLogin(String userId, String userPw) {
		UserVO uVO = userMapper.userGet(userId);
		if(uVO != null) {
			if(uVO.getUserPw().equals(userPw)) {
				System.out.println("로그인성공");
				return 1;
			} 
			if(uVO.getUserPw()!=(userPw)) {
				System.out.println("비번틀림");
				return 0;
>>>>>>> main
			}
		}
		System.out.println("아이디없음");
		return -1;	
	} 			
	
	@Override
	public UserVO userGet(String userId) {
		UserVO uVO = userMapper.userGet(userId);
		return uVO;
	}

	@Override
	public int userModify(UserVO uVO) {
		System.out.println("modify.........." + uVO);
		return userMapper.userUpdate(uVO);
	}
	
	@Override
	public int userRemove(String userId, String userPw) {
		UserVO uVO = userMapper.userGet(userId);
		if(uVO != null) {
			if(uVO.getUserPw().equals(userPw)) {
				return userMapper.userDelete(userId);
			}
		}
		return 0;
	}

	@Override
	public int userCheckPw(String userId, String userPw) {
		System.out.println("checkPw................");
		UserVO uVO = userMapper.userGet(userId);
		if(uVO.getUserId() != null && uVO.getUserId() != "") {
			System.out.println("id ok................");
			if(uVO.getUserPw().equals(userPw)) {
				System.out.println("pw ok................");
				return 1;
			} else {
				System.out.println("pw fail................");
				return 0;
			}
		} else {
			System.out.println("id fail................");
			return -1;
		}
	}
}



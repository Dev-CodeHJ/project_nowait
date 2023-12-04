package ezen.nowait.member.service;

import org.springframework.stereotype.Service;

import ezen.nowait.member.domain.OwnerVO;
import ezen.nowait.member.domain.UserVO;
import ezen.nowait.member.mapper.UserMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	
	private UserMapper userMapper;
	
	@Override
	public int userInsert(UserVO uVO){
		return userMapper.userInsert(uVO);		
	}	
	
	//아이디 중복체크
		@Override
		public int userIdCheck(String userId) {
			int result = userMapper.idCheck(userId);
			return result;
		}

		@Override
		public int userLogin(String userId, String userPw) {
			UserVO uVO = userMapper.userGet(userId);
			if(uVO.getUserId() != null && uVO.getUserId() != "") {
				if(uVO.getUserPw().equals(userPw)) {
					return 1;
				} else {
					return 0;
				}
			} else {
				return -1;
			}
		}


	@Override
	public UserVO userGet(String userId) {

		UserVO uVO = userMapper.userGet(userId);
		return uVO;
	}

	
	
	
	
	@Override
	public int userModify(UserVO uVO) {
		log.info("modify.........." + uVO);
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
		log.info("checkPw................");
		UserVO uVO = userMapper.userGet(userId);
		if(uVO.getUserId() != null && uVO.getUserId() != "") {
			log.info("id ok................");
			if(uVO.getUserPw().equals(userPw)) {
				log.info("pw ok................");
				return 1;
			} else {
				log.info("pw fail................");
				return 0;
			}
		} else {
			log.info("id fail................");
			return -1;
		}
	}
}
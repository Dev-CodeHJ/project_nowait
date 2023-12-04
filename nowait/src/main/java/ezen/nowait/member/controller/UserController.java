package ezen.nowait.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.nowait.member.domain.UserVO;
import ezen.nowait.member.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {

	private final UserService userservice;
	

	//손님,사장 로그인 회원가입 초이스 페이지로 이동
	@GetMapping("/choice")
	public void choice() {}
		
	//손님회원가입 페이지로 이동 
	@GetMapping("/userJoinForm")
	public void join() {}
	
	//회원가입 완료 후 페이지 이동
	@PostMapping("/userJoinForm")
	public String join(UserVO uVO) {
		userservice.userInsert(uVO);
		return "/userLogin";
	}
	
	@PostMapping("/choice")
	public String userInsert(UserVO uVO, RedirectAttributes rttr) {
		
		log.info("choice:" + uVO);
		
		userservice.userInsert(uVO);
		
		rttr.addFlashAttribute("result", uVO.getUserId());
		
		return "redirect:/user/userLogin";
	}			
	
	//손님로그인 페이지로 이동 
	@GetMapping("/userLogin")
	public void login() {}
	
	//손님로그인 후 처리페이지로 이동
	@PostMapping("/userLogin")
	public String login(String userId, String userPw, HttpServletRequest request, Model model) {
      
      log.info("id : " + userId);
      log.info("pw : " + userPw);
      
      HttpSession session = request.getSession();
      int result = userservice.userLogin(userId, userPw);
      session.setAttribute("result", result);
      
      if(result == 1) {   /* ownerService.loginOwner(ownerId, ownerPw)
                           1 : 로그인 성공
                           0 : 비밀번호 불일치
                           -1 : 아이디 불일치 */
   
         UserVO uVO = userservice.userGet(userId);
         session.setAttribute("member", uVO);
         session.setAttribute("result", 2);
         System.out.println("로그인 성공");
         return "/user/userHome";
      } else {
    	  System.out.println("로그인 실패");
    	  return "/user/userLogin";    	  
      }
    }
	
	//손님 로그아웃 처리 페이지이동
	@GetMapping("userLogout")
	   public String logout(HttpServletRequest request) {
	      HttpSession session = request.getSession(false);
	      if(session != null) {
	         session.invalidate();
	      }
	      return "redirect:/";
	   }
	
	//회원가입 아이디 중복체크
	 @PostMapping("userIdCheck")
	 @ResponseBody
	   public String userIdCheck(String id) {
	      
	      String result = "";
	      int count = userservice.userIdCheck(id);
	      if(count==0) {
	         result = "YES";
	      } else {
	         result = "NO";
	      }
	      return result;
	      
	   }

	
		
	@GetMapping("/userGet")
	public void userget(String userId, Model model, HttpServletRequest request) {
		System.out.println("회원 정보 불러오기");
		
		HttpSession session = request.getSession();
		UserVO uVO = userservice.userGet(userId);
		session.setAttribute("uVO", uVO);
	}

	
	@GetMapping(value = "/userRemove")
	public void userRemove(@RequestParam(value="userId", required=false) String userId, HttpServletRequest request){

		HttpSession session = request.getSession();
		session.setAttribute("uVO", userservice.userGet(userId));
	}
	
	@GetMapping({"/serviceCenter"})
	public void get(@RequestParam(value="/serviceCenter", required=false) String serviceCenter) {
		log.info("/servicecenter");
	}

	/* 주문내역
	@GetMapping({"/serviceCenter"})
	public void get(@RequestParam(value="/serviceCenter", required=false) String serviceCenter) {
		log.info("/servicecenter");
	}
	
	//리뷰내역
	@GetMapping({"/serviceCenter"})
	public void get(@RequestParam(value="/serviceCenter", required=false) String serviceCenter) {
		log.info("/servicecenter");
	}
	*/
	
	@GetMapping("userModify")
	public void userModify() {
		System.out.println("수정조회!!!");
	}

	@PostMapping("/user/userModify")
	public String userModify(UserVO uVO) {
		System.out.println("회원정보 수정페이지");

		int chk = userservice.userModify(uVO);
	    if(chk==1) {
	    	System.out.println("수정 성공");
	        
	        return "/user/userLogout"; //정보 업데이트 성공 시 로그아웃으로
	    }else {
	    	System.out.println("수정 실패");
	        return "/user/userGet";
	    }

	}

	@PostMapping("/userRemove")
	public String userDelete(String userId, String userPw,  HttpServletRequest request) {
		HttpSession session = request.getSession();
		int result = userservice.userCheckPw(userId,userPw);
		
		if(result==1) {
			userservice.userRemove(userId);
			return "redirect:/choice";
			//맞으면 삭제 후 유저초이스 페이지로
		} else {
			session.setAttribute("result", result);

		        return "redirect:/user/userGet";
		}
		
	}
}

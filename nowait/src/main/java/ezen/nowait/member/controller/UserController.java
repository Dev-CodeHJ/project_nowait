package ezen.nowait.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.nowait.member.domain.OwnerVO;
import ezen.nowait.member.domain.UserVO;
import ezen.nowait.member.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	
	private UserService userservice;
	
	//손님,사장 로그인 회원가입 초이스 페이지로 이동
	@GetMapping("/choice")
	public void choice() {}
		
	//손님회원가입 페이지로 이동 
	@GetMapping("/userJoinForm")
	public void join() {}
	
	//회원가입 완료 후 페이지 이동
	@PostMapping("/userJoinForm")
	public String join(UserVO uVO, HttpServletRequest request) {
		
		System.out.println("userJoin................");
		
		HttpSession session = request.getSession();
		
		int result = userservice.userInsert(uVO);
		session.setAttribute("result", result);
		
		if(result == 1) {
			return "/user/userLogin";
		}
		return "/choice";
	}
	
	//손님로그인 페이지로 이동 
	@GetMapping("/userLogin")
	public void login() {}
	
	//손님로그인 후 처리페이지로 이동
	@PostMapping("/userLogin")
	public String login(String userId, String userPw, HttpServletRequest request, RedirectAttributes rttr) {
      
      log.info("id : " + userId);
      log.info("pw : " + userPw);
      
      HttpSession session = request.getSession();
      
      int result = userservice.userLogin(userId, userPw);
      System.out.println("result : " + result);
      
      if(result == 1) {   /* ownerService.loginOwner(userId, userPw)
                           1 : 로그인 성공
                           0 : 비밀번호 불일치
                           -1 : 아이디 불일치 */
         session.setAttribute("member", userservice.userGet(userId));
         session.setAttribute("result", result+1);         
         System.out.println("로그인 성공");
         return "redirect:/";
      } else {
    	  rttr.addFlashAttribute("result", result);
    	  System.out.println("로그인 실패");
    	  return "redirect:/user/userLogin";    	  
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
}

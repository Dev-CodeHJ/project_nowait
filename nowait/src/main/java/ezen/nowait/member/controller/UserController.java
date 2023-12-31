package ezen.nowait.member.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.nowait.member.domain.UserVO;
import ezen.nowait.member.service.UserService;
import ezen.nowait.order.service.OrderService;
import ezen.nowait.store.domain.MenuVO;
import ezen.nowait.store.domain.StoreVO;
import ezen.nowait.store.service.MenuService;
import ezen.nowait.store.service.StoreService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

	private final UserService userservice;
	
	private final OrderService orderservice;
	
	private final StoreService storeService;
	
	private final MenuService menuService;
	
	HttpSession	session;
		
	//손님이 홈에서 가게메뉴보기 페이지 이동
	@GetMapping("/menuOrder")
	public void menuOrder() {}
	
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
	
	public String join(UserVO uVO) {
		userservice.userInsert(uVO);
		return "user/userLogin";
	}
	
	//손님로그인 페이지로 이동 
	@GetMapping("/userLogin")
	public void login() {}
	
	//손님로그인 후 처리페이지로 이동
	@PostMapping("/userLogin")
	public String login(String userId, String userPw, HttpServletRequest request, RedirectAttributes rttr) {
      
      log.info("id : " + userId);
      log.info("pw : " + userPw);
      
      session = request.getSession();
      
      int result = userservice.userLogin(userId, userPw);
      System.out.println("result : " + result);
      
      if(result == 1) {   /* ownerService.loginOwner(userId, userPw)
                           1 : 로그인 성공
                           0 : 비밀번호 불일치
                           -1 : 아이디 불일치 */
         session.setAttribute("member", userservice.userGet(userId));
         session.setAttribute("result", result+1);         
         System.out.println("로그인 성공");
         return "redirect:/user/userHome";
      } else {
    	  rttr.addFlashAttribute("result", result);
    	  System.out.println("로그인 실패");
    	  return "redirect:/user/userLogin";    	  
      }
    }

	//손님 홈 이동
	@GetMapping("/userHome")
	public void userHome(Model model) {
		
		List<StoreVO> storeList = storeService.findAll();
		List<MenuVO> menuList;
		
		
		model.addAttribute("list", storeList);
		
		for(int i=0; i<storeList.size(); i++) {
			
			String crNum = storeList.get(i).getCrNum();
			
			menuList = menuService.findMenuList(crNum);
			
		}
	}

	//손님 리뷰관리 이동
	@GetMapping("/userReview")
	public void userReview() {
		System.out.println("zzzz");
	}
	
	//손님 로그아웃 처리 페이지이동
	@GetMapping("/userLogout")
	   public String logout(HttpServletRequest request) {
	      HttpSession session = request.getSession(false);
	      if(session != null) {
	         session.invalidate();
	      }
	      return "redirect:/";
	   }

	//회원가입 아이디 중복체크
	 @PostMapping("/userIdCheck")
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

	//손님 정보조회
	@GetMapping("/userGet")
	public void userget() {	}

	//손님 수정조회페이지로
	@GetMapping("/userModify")
	public void userModify() {
		System.out.println("수정조회!!!");
	}
	
	//손님 수정 후 업데이트
	@PostMapping("/userModify")
	public String Modify(UserVO uVO) {
		System.out.println("회원정보 수정페이지");

		int result = userservice.userModify(uVO);
	    if(result==1) {
	    	System.out.println("수정 성공");
	        
	        return "redirect:/user/userLogout"; //정보 업데이트 성공 시 로그아웃으로
	    }else {
	    	System.out.println("수정 실패");
	        return "/user/userModify";
	    }
	}

	//회원탈퇴페이지로
	@GetMapping("/userRemove")
	public void userRemove() {}
	
	//회원탈퇴
	@Transactional
	@PostMapping("/userRemove")
	public String userRemove(String userId, String userPw, RedirectAttributes rttr) {
		int deleteOk = userservice.userRemove(userId, userPw);
		System.out.println("deleteOk : " + deleteOk);
		System.out.println("userId : " + userId);
		System.out.println("userPw : " + userPw);
		rttr.addFlashAttribute("deleteOk", deleteOk);
		return "redirect:/user/userRemove";
	}
	
	//고객센터
	@GetMapping({"/serviceCenter"})
	public void get(@RequestParam(value="/serviceCenter", required=false) String serviceCenter) {
		log.info("/servicecenter");
	}

}

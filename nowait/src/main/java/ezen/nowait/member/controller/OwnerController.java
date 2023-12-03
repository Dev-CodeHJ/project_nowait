package ezen.nowait.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.nowait.member.domain.OwnerVO;
import ezen.nowait.member.service.OwnerService;
import ezen.nowait.store.service.StoreService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/owner")
@AllArgsConstructor
public class OwnerController {

	private OwnerService ownerService;
	
	private StoreService storeService;
	
	@GetMapping("/ownerLogin")
	public void login() {}
	
	@PostMapping("/ownerLogin")
	public String login(String ownerId, String ownerPw, HttpServletRequest request) {
		
		log.info("id : " + ownerId);
		log.info("pw : " + ownerPw);
		
		HttpSession session = request.getSession();
		
		int result = ownerService.loginOwner(ownerId, ownerPw);
		session.setAttribute("result", result);
		
		if(result == 1) {	/* ownerService.loginOwner(ownerId, ownerPw)
									1 : 로그인 성공
									0 : 비밀번호 불일치
									-1 : 아이디 불일치 */
			session.setAttribute("member", ownerService.findOwner(ownerId));
			session.setAttribute("list", storeService.findByOwnerId(ownerId));
			return "/owner/ownerHome";
		}
		return "/owner/ownerLogin";
		
	}
	
	@GetMapping("/ownerLogout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
	@GetMapping("/ownerJoin")
	public void join() {}
	
	@PostMapping("/ownerJoin")
	public String join(OwnerVO oVO, HttpServletRequest request) {
		
		log.info("ownerJoin................");
		
		HttpSession session = request.getSession();
		
		int result = ownerService.addOwner(oVO);
		session.setAttribute("result", result);
		
		if(result == 1) {
			return "/owner/ownerLogin";
		}
		return "/owner/ownerJoin";
	}
	
	@PostMapping("/ownerIdCheck")
	@ResponseBody
	public String ownerIdCheck(String id) {
		
		String result = "";
		int count = ownerService.idChk(id);
		if(count==0) {
			result = "YES";
		} else {
			result = "NO";
		}
		return result;
		
	}
	
	@GetMapping("/ownerMypage")
	public void ownerMypage() {}
	
	@GetMapping("/ownerUpdate")
	public void update() {}
	
	@PostMapping("/ownerUpdate")
	public String update(OwnerVO oVO) {

		log.info("ownerUpdate................");
		
		int result = ownerService.updateOwner(oVO);
		if(result == 1) {
			return "redirect:/owner/ownerLogout";
		}
		return "/owner/ownerUpdate";
	}
}

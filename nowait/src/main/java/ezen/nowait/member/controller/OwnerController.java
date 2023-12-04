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
	
	@GetMapping("/ownerHome")
	public void home() {}
	
	@GetMapping("/ownerLogin")
	public void login() {}
	
	@PostMapping("/ownerLogin")
	public String login(String ownerId, String ownerPw, HttpServletRequest request, Model model, RedirectAttributes rttr) {
		
		log.info("id : " + ownerId);
		log.info("pw : " + ownerPw);
		
		HttpSession session = request.getSession();
		
		int result = ownerService.loginOwner(ownerId, ownerPw);
		
		if(result == 1) {	/* ownerService.loginOwner(ownerId, ownerPw)
									1 : 로그인 성공
									0 : 비밀번호 불일치
									-1 : 아이디 불일치 */
			session.setAttribute("member", ownerService.findOwner(ownerId));
			session.setAttribute("result", result);
			model.addAttribute("list", storeService.findByOwnerId(ownerId));
			return "/owner/ownerHome";
		}
		rttr.addFlashAttribute("result", result);
		return "redirect:/owner/ownerLogin";
		
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
	public String join(OwnerVO oVO) {
		
		log.info("ownerJoin................");
		
		int result = ownerService.addOwner(oVO);
		
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
	
	@GetMapping("/ownerDelete")
	public void delete() {}
	
	@PostMapping("/ownerDelete")
	public String delete(String ownerId, String ownerPw, RedirectAttributes rttr) {
		int deleteOk = ownerService.deleteOwner(ownerId, ownerPw);
		System.out.println("deleteOk : " + deleteOk);
		System.out.println("ownerId : " + ownerId);
		System.out.println("ownerPw : " + ownerPw);
		rttr.addFlashAttribute("deleteOk", deleteOk);
		return "redirect:/owner/ownerDelete";
	}
}

package ezen.nowait.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.nowait.member.service.OwnerService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/owner/*")
@AllArgsConstructor
public class OwnerController {

	private OwnerService ownerService;
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(String ownerId, String ownerPw, RedirectAttributes rttr) {
		log.info("id : " + ownerId);
		log.info("pw : " + ownerPw);
		if(ownerService.loginOwner(ownerId, ownerPw)==1) {
			rttr.addFlashAttribute("result", ownerService.findOwner(ownerId));
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("result", "login fail");
			return "redirect:/owner/login";
		}
	}
}

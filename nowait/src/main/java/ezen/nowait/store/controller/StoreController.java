package ezen.nowait.store.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.nowait.member.domain.OwnerVO;
import ezen.nowait.store.domain.StoreVO;
import ezen.nowait.store.service.StoreService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/store/*")
@AllArgsConstructor
public class StoreController {

	private StoreService storeService;
	
	HttpSession session;
	
	@GetMapping({"/storeUserGet", "/storeOwnerGet"})
	public void storeGet(Model model, String crNum) {
		model.addAttribute("store", storeService.findByCrNum(crNum));
	}
	
//	@GetMapping("/getByCategory")
//	public void getByCategory(Model model, int storeCategory) {
//		log.info("getByCategory");
//		model.addAttribute("getByCategory", storeService.findByCategory(storeCategory));
//	}
//	@GetMapping("/getByOwnerId")
//	public void getByOwnerId(Model model, String ownerId) {
//		log.info("getByOwnerId");
//		model.addAttribute("list", storeService.findByOwnerId(ownerId));
//	}
	@GetMapping("/storeNewRegister")
	public void register() {}
	
	@PostMapping("storeNewRegister")
	public String register(@RequestParam("ownerId")String ownerId, StoreVO sVO) {
		System.out.println("ownerId : " + ownerId);
		System.out.println("crNum : " + sVO.getCrNum());
		
		int result = storeService.addStore(sVO);
		
		if(result == 1) {
			String crNum = (String)sVO.getCrNum();
			System.out.println("crNum : " + crNum);
			
			int result2 = storeService.addOwnerStore(ownerId, crNum, sVO.getSecretCode());
			System.out.println("result2 : " + result2);
			if(result2 == 1) {
				return "redirect:/owner/ownerHome";
			}
		}
		return "/store/storeNewRegister";
	}
	
	@GetMapping("/storeExistRegister")
	public void load() {}
	
	@PostMapping("storeExistRegister")
	public String load(String crNum, String secretCode, HttpServletRequest request) {
		
		session = request.getSession();
		OwnerVO oVO = (OwnerVO)session.getAttribute("member");
		
		System.out.println("OwnerId : "+ oVO.getOwnerId());
		int result = storeService.addOwnerStore(oVO.getOwnerId(), crNum, secretCode);
		
		if(result == 1) {
			return "redirect:/owner/ownerHome";
		}
		return "/store/storeExistRegister";
	}
}

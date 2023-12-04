package ezen.nowait.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@GetMapping({"/storeUserGet", "/storeOwnerGet"})
	public void storeGet(Model model, String crNum) {
		log.info("storeHome");
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
	public String register(StoreVO sVO) {
		
		int result = storeService.addStore(sVO);
		
		if(result == 1) {
			return "/owner/ownerHome";
		}
		return "/store/storeNewRegister";
	}
	
	@GetMapping("/storeExistRegister")
	public void load() {}
	
	@PostMapping("storeExistRegister")
	public String load(String ownerId, String crNum, String secretCode) {
		
		int result = storeService.addOwnerStore(ownerId, crNum, secretCode);
		
		if(result == 1) {
			return "/owner/ownerHome";
		}
		return "/store/storeExistRegister";
	}
}

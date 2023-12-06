package ezen.nowait.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.nowait.code.domain.CodeVO;
import ezen.nowait.code.service.CodeService;
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
	
	private CodeService codeService;
	
	HttpSession session;
	
//	@GetMapping({"/storeUserGet", "/storeOwnerGet", "/storeUpdate"})
//	public void storeGet(Model model, String crNum) {
//		System.out.println("crNum : " + crNum);
//		model.addAttribute("store", storeService.findByCrNum(crNum));
//	}
	
	@GetMapping(path = "/storeUserGet/{crNum}")
	public String userGet(@PathVariable String crNum, Model model) {
		System.out.println("crNum : " + crNum);
		model.addAttribute("store", storeService.findByCrNum(crNum));
		return "/store/storeUserGet";
	}
	
	@GetMapping(path = "/storeOwnerGet/{crNum}")
	public String ownerGet(@PathVariable String crNum, Model model) {
		System.out.println("crNum : " + crNum);
		
		StoreVO sVO = storeService.findByCrNum(crNum);
		model.addAttribute("store", sVO);
		
		CodeVO cVO = codeService.findOne("store_category", sVO.getStoreCategory());
		model.addAttribute("storeCategory", cVO);
		
		return "/store/storeOwnerGet";
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
	
	@GetMapping(path = "/storeUpdate/{crNum}")
	public String update(@PathVariable String crNum, Model model) {
		System.out.println("crNum : " + crNum);
		
		StoreVO sVO = storeService.findByCrNum(crNum);
		model.addAttribute("store", sVO);
		
		List<CodeVO> categoryList = codeService.findList("store_category");
		model.addAttribute("categoryList", categoryList);
		
		return "/store/storeUpdate";
	}
	
	@PostMapping("/storeUpdate")
	public String update(@RequestParam("ownerId")String ownerId, StoreVO sVO) {
		
		int result = storeService.updateStore(sVO);
		
		if(result == 1) {
			return "redirect:/owner/ownerHome";
		}
		return "/store/storeUpdate";
	}
	
	@GetMapping("/storeDelete")
	public void deleteStore() {}
	
	@PostMapping("/storeDelete")
	public String deleteStore(String crNum, String secretCode) {
		
		int result = storeService.deleteStore(crNum, secretCode);
		
		if(result == 1) {
			return "redirect:/owner/ownerHome";
		}
		return "/store/storeDelete";
	}
	
	@PostMapping("/ownerStoreDelete")
	public String deleteOwnerStore(String crNum, String secretCode, HttpServletRequest request) {
		
		session = request.getSession();
		OwnerVO oVO = (OwnerVO) session.getAttribute("member");
		
		int result = storeService.deleteOwnerStoreOneByOwnerId(oVO.getOwnerId(), crNum, secretCode);
		
		if(result == 1) {
			return "redirect:/owner/ownerHome";
		}
		return "/store/storeDelete";
	}
}

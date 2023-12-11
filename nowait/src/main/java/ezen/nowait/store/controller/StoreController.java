package ezen.nowait.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.nowait.code.domain.CodeVO;
import ezen.nowait.code.service.CodeService;
import ezen.nowait.member.domain.OwnerVO;
import ezen.nowait.store.domain.StoreVO;
import ezen.nowait.store.service.StoreService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/store")
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
	
	@GetMapping("/storeUserGet")
	public void userGet(String crNum, Model model) {
		System.out.println("crNum : " + crNum);
		model.addAttribute("store", storeService.findByCrNum(crNum));
	}
	
	@GetMapping("/storeOwnerGet")
	public void ownerGet(String crNum, Model model) {
		System.out.println("crNum : " + crNum);
		
		StoreVO sVO = storeService.findByCrNum(crNum);
		model.addAttribute("store", sVO);
		
		CodeVO cVO = codeService.findOne("store_category", sVO.getStoreCategory());
		model.addAttribute("storeCategory", cVO);
	}
	
	@GetMapping("/storeNewRegister")
	public void register() {}
	
	@PostMapping("storeNewRegister")
	public String register(@RequestParam("ownerId")String ownerId, StoreVO sVO, RedirectAttributes rttr) {
		System.out.println("ownerId : " + ownerId);
		System.out.println("crNum : " + sVO.getCrNum());
		
		int insertOk = storeService.addStore(ownerId, sVO);
		
		rttr.addFlashAttribute("insertOk", insertOk);
		
		return "redirect:/owner/ownerHome";
	}
	
	@GetMapping("/storeExistRegister")
	public void load() {}
	
	@PostMapping("storeExistRegister")
	public String load(String crNum, String secretCode, HttpServletRequest request, RedirectAttributes rttr) {
		
		System.out.println("storeExistRegister crNum : " + crNum);
		System.out.println("storeExistRegister secretCode : " + secretCode);
		
		session = request.getSession();
		OwnerVO oVO = (OwnerVO)session.getAttribute("member");
		
		System.out.println("OwnerId : "+ oVO.getOwnerId());
		int loadOk = storeService.addOwnerStore(oVO.getOwnerId(), crNum, secretCode);
		
		rttr.addFlashAttribute("loadOk", loadOk);
		rttr.addAttribute("crNum", crNum);
		
		return "redirect:/owner/ownerHome";
	}
	
	//@GetMapping(path = "/storeUpdate/{crNum}")
	@GetMapping("/storeUpdate")
	public void update(String crNum, Model model) {
		
		System.out.println("crNum : " + crNum);
		
		StoreVO sVO = storeService.findByCrNum(crNum);
		model.addAttribute("store", sVO);
		
		List<CodeVO> categoryList = codeService.findList("store_category");
		model.addAttribute("categoryList", categoryList);
	}
	
	@PostMapping("/storeUpdate")
	public String update(@RequestParam("ownerId")String ownerId, StoreVO sVO, RedirectAttributes rttr) {
		
		int updateOk = storeService.updateStore(sVO);

		rttr.addFlashAttribute("updateOk", updateOk);
		rttr.addAttribute("crNum", sVO.getCrNum());
		
		return "redirect:/store/storeOwnerGet";
	}
	
//	@GetMapping(path = "/storeDelete/{crNum}")
	@GetMapping("/storeDelete")
	public void deleteStore(String crNum, Model model) {
		
		System.out.println("storeDelete enter");
		System.out.println("crNum : " + crNum);
		model.addAttribute("crNum", crNum);
	}
	
	@GetMapping(path = "/storeDeleteAction/{crNum}")
	public String storeDeleteAction(@PathVariable String crNum, Model model) {
		
		System.out.println("deleteStoreAction enter");
		System.out.println("crNum : " + crNum);
		
		model.addAttribute("crNum", crNum);
		
		return "/store/storeDeleteAction";
	}
	
	@PostMapping("/storeDelete")
	public String deleteStore(@RequestParam("crNum") String crNum, String crNum2, String secretCode, Model model, RedirectAttributes rttr) {
		
		System.out.println("가게삭제--- PostMapping enter");
		System.out.println("crNum : " + crNum);
		System.out.println("crNum2 : " + crNum2);
		System.out.println("secretCode : " + secretCode);
		
		int deleteOk = storeService.deleteStore(crNum, crNum2, secretCode);
		
		System.out.println("deleteOk" + deleteOk);
		
		model.addAttribute("crNum", crNum);
		rttr.addFlashAttribute("deleteOk", deleteOk);
		
		return "redirect:/store/storeDeleteAction/"+crNum;
	}
	
	@PostMapping("/ownerStoreDelete")
	public String deleteOwnerStore(@RequestParam("crNum") String crNum,  String crNum2, String secretCode, HttpServletRequest request, Model model, RedirectAttributes rttr) {
		
		System.out.println("내 가게 목록에서 가게삭제 PostMapping enter");
		System.out.println("crNum : " + crNum);
		System.out.println("crNum2 : " + crNum2);
		System.out.println("secretCode : " + secretCode);
		
		session = request.getSession();
		OwnerVO oVO = (OwnerVO) session.getAttribute("member");
		
		System.out.println("OwnerId : " + oVO.getOwnerId());
		
		int deleteOk = storeService.deleteOwnerStoreOneByOwnerId(oVO.getOwnerId(), crNum, crNum2, secretCode);
		
		System.out.println("deleteOk" + deleteOk);
		
		model.addAttribute("crNum", crNum);
		System.out.println("controller post crNum : " + crNum);
		
		rttr.addFlashAttribute("deleteOk", deleteOk);
		
		return "redirect:/store/storeDeleteAction/"+crNum;
	}
}

package ezen.nowait.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.nowait.code.domain.CodeVO;
import ezen.nowait.code.service.CodeService;
import ezen.nowait.store.domain.MenuVO;
import ezen.nowait.store.service.MenuService;
import ezen.nowait.store.service.StoreService;
import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/menu")
@AllArgsConstructor
public class MenuController {

	private MenuService menuService;
	
	private StoreService storeService;
	
	private CodeService codeService;
	
	HttpSession session;
	
	@GetMapping("/menuList")
	public void list(String crNum, Model model) {
		
		System.out.println("/menu/menulist crNum : " + crNum);
		
		List<MenuVO> menuList = menuService.findMenuList(crNum);
		
		model.addAttribute("crNum", crNum);
		model.addAttribute("menuList", menuList);
	}
	
	@GetMapping("/menuRegister")
	public void menuRegister(String crNum, Model model) {
		
		System.out.println("/menu/menuRegister crNum : " + crNum);
		
		List<CodeVO> list = codeService.findListByCrNum(crNum);
		List<CodeVO> popularityList = codeService.findList("popularity");
		List<CodeVO> menuStatusList = codeService.findList("menu_status");
		
		model.addAttribute("menuCategoryList", list);
		model.addAttribute("popularityList", popularityList);
		model.addAttribute("menuStatusList", menuStatusList);
		model.addAttribute("crNum", crNum);
	}
	
	@PostMapping("/menuRegister")
	public String menuRegister(MenuVO mVO, Model model) {
		
		System.out.println("--post--/menu/menuRegister");
		
		int result = menuService.addMenu(mVO);
		
		List<MenuVO> menuList = menuService.findMenuList(mVO.getCrNum());
		
		model.addAttribute("menuList", menuList);
		
		return "/menu/menuList";
	}
	
	@GetMapping("/menuCategory")
	public void category(String crNum, Model model) {
		
		System.out.println("/menu/menuCategory crNum : " + crNum);
		
		List<CodeVO> list = codeService.findListByCrNum(crNum);
		
		model.addAttribute("menuCategoryList", list);
		model.addAttribute("crNum", crNum);
	}
	
	@GetMapping("/categoryRegister")
	public void categoryRegister(String crNum, Model model) {
		
		System.out.println("/menu/categoryRegister crNum : " + crNum);
		
		model.addAttribute("crNum", crNum);
	}
	
	@PostMapping("/categoryRegister")
	public String categoryRegister(CodeVO cVO, RedirectAttributes rttr) {
		
		System.out.println("--post--/menu/categoryRegister");
		
		int insertOk = codeService.insertMenuCategory(cVO);
		
		System.out.println("insertOk : " + insertOk);
		
		rttr.addFlashAttribute("insertOk", insertOk);
		rttr.addAttribute("crNum", cVO.getCrNum());
		
		return "redirect:/menu/menuCategory";
	}
	
	@GetMapping("/menuUpdate")
	public void update(int menuNum, Model model) {
		
		System.out.println("/menu/menuUpdate menuNum : " + menuNum);
		
		MenuVO mVO = menuService.findMenu(menuNum);
		
		List<CodeVO> list = codeService.findListByCrNum(mVO.getCrNum());
		List<CodeVO> popularityList = codeService.findList("popularity");
		List<CodeVO> menuStatusList = codeService.findList("menu_status");
		
		model.addAttribute("menuCategoryList", list);
		model.addAttribute("popularityList", popularityList);
		model.addAttribute("menuStatusList", menuStatusList);
		model.addAttribute("menu", mVO);
	}
	
	@GetMapping("/menuDelete")
	public void delete(int menuNum) {
		
		System.out.println("/menu/menuDelete menuNum : " + menuNum);
		
		int result = menuService.deleteMenu(menuNum);
	}
}

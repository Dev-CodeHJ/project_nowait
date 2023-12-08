package ezen.nowait.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	HttpSession session;
	
	@GetMapping("/menuList")
	public void list(String crNum, Model model) {
		
		System.out.println("/menu/menulist crNum : " + crNum);
		
		List<MenuVO> menuList = menuService.findMenuList(crNum);
		
		model.addAttribute("menuList", menuList);
	}
	
	@GetMapping("/menuUpdate")
	public void update(int menuNum, Model model) {
		
		System.out.println("/menu/menuUpdate menuNum : " + menuNum);
		
		MenuVO mVO = menuService.findMenu(menuNum);
		
		model.addAttribute("menu", mVO);
	}
	
	@GetMapping("/menuDelete")
	public void delete(int menuNum) {
		
		System.out.println("/menu/menuDelete menuNum : " + menuNum);
		
		int result = menuService.deleteMenu(menuNum);
	}
}

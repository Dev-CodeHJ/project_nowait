package ezen.nowait.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.nowait.store.domain.MenuOptionVO;
import ezen.nowait.store.domain.MenuVO;
import ezen.nowait.store.service.MenuOptionService;
import ezen.nowait.store.service.MenuService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/option")
@RequiredArgsConstructor
public class MenuOptionController {

	private final MenuOptionService optionService;
	
	private final MenuService menuService;
	
	@GetMapping("/menuOptionRegister")
	public void register(int menuNum, Model model) {
		
		System.out.println("menuOptionRegister menuNum : " + menuNum);
		
		MenuVO mVO = menuService.findMenu(menuNum);
		
		model.addAttribute("menuNum", menuNum);
		model.addAttribute("crNum", mVO.getCrNum());
	}
	
	@PostMapping("/menuOptionRegister")
	public String register(MenuOptionVO moVO, RedirectAttributes rttr) {
		
		System.out.println("--post-- Register moVO : " + moVO);
		
		int menuNum = moVO.getMenuNum();
		
		MenuVO mVO = menuService.findMenu(menuNum);
		int insertOk = optionService.addOption(moVO);
		
		rttr.addAttribute("menuNum", menuNum);
		rttr.addFlashAttribute("insertOk", insertOk);
		
		return "redirect:/menu/menuGet";
	}
	
	@GetMapping("/menuOptionUpdate")
	public void update(int menuOptionNum, String crNum, Model model) {
		
		System.out.println("menuOptionUpdate menuOptionNum : " + menuOptionNum);
		
		MenuOptionVO moVO = optionService.findOption(menuOptionNum);
		
		model.addAttribute("option", moVO);
		model.addAttribute("crNum", crNum);
	}
	
	@PostMapping("/menuOptionUpdate")
	public String update(MenuOptionVO moVO, RedirectAttributes rttr) {
		
		System.out.println("--post-- update moVO : " + moVO);
		
		int updateOk = optionService.updateOption(moVO);
		
		rttr.addAttribute("menuNum", moVO.getMenuNum());
		rttr.addFlashAttribute("updateOk", updateOk);
		
		return "redirect:/menu/menuGet";
	}
	
	@GetMapping("/menuOptionDelete")
	public String delete(int menuOptionNum, int menuNum, RedirectAttributes rttr) {
		
		System.out.println("menuOptionDelete menuOptionNum : " + menuOptionNum);
		System.out.println("menuOptionDelete menuNum : " + menuNum);
		
		int deleteOk = optionService.deleteOption(menuOptionNum);
		
		rttr.addAttribute("menuNum", menuNum);
		rttr.addFlashAttribute("deleteOk", deleteOk);
		
		return "redirect:/menu/menuGet";
	}
}

package ezen.nowait.store.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.nowait.code.domain.CodeVO;
import ezen.nowait.code.service.CodeService;
import ezen.nowait.order.domain.OrderMenuVO;
import ezen.nowait.store.domain.MenuOptionVO;
import ezen.nowait.store.domain.MenuVO;
import ezen.nowait.store.domain.UploadFile;
import ezen.nowait.store.service.FileStore;
import ezen.nowait.store.service.MenuOptionService;
import ezen.nowait.store.service.MenuService;
import ezen.nowait.store.service.StoreService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/menu")
@RequiredArgsConstructor
public class MenuController {

	private final MenuService menuService;
	
	private final MenuOptionService optionService;
	
	private final StoreService storeService;
	
	private final CodeService codeService;
	
	private final FileStore	fileStore;
	
	HttpSession session;
	
	@GetMapping("/menuList")
	public void list(String crNum, Model model) {
		
		System.out.println("/menu/menulist crNum : " + crNum);
		
		List<MenuVO> menuList = menuService.findMenuList(crNum);
		
		List<CodeVO> list = codeService.findListByCrNum(crNum);
		List<CodeVO> popularityList = codeService.findList("popularity");
		
		model.addAttribute("menuCategoryList", list);
		model.addAttribute("popularityList", popularityList);
		model.addAttribute("crNum", crNum);
		model.addAttribute("menuList", menuList);
	}
	
	@GetMapping("/menuGet")
	public void get(int menuNum, Model model) {
		
		System.out.println("/menu/menuGet menuNum : " + menuNum);
		
		MenuVO mVO = menuService.findMenu(menuNum);
		List<MenuOptionVO> optionList = optionService.findOptionList(menuNum);
		
		List<CodeVO> list = codeService.findListByCrNum(mVO.getCrNum());
		List<CodeVO> popularityList = codeService.findList("popularity");
		
		model.addAttribute("menu", mVO);
		model.addAttribute("optionList", optionList);
		
		model.addAttribute("menuCategoryList", list);
		model.addAttribute("popularityList", popularityList);
	}
	
	@GetMapping("/menuUserGet")
	public void userGet(int menuNum, Model model) {
		
		System.out.println("/menu/menuUserGet menuNum : " + menuNum);
		
		MenuVO mVO = menuService.findMenu(menuNum);
		List<MenuOptionVO> optionList = optionService.findOptionList(menuNum);
		
		List<CodeVO> list = codeService.findListByCrNum(mVO.getCrNum());
		List<CodeVO> popularityList = codeService.findList("popularity");
		
		model.addAttribute("menu", mVO);
		model.addAttribute("optionList", optionList);
		
		model.addAttribute("menuCategoryList", list);
		model.addAttribute("popularityList", popularityList);
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping("/menuUserGet")
	public String userGet(OrderMenuVO omVO, RedirectAttributes rttr, HttpServletRequest request) {
		
		System.out.println("--post--menuUserGet omVO : " + omVO);
		
		session = request.getSession();
		
		//장바구니에 담은 메뉴PK
		int menuNum = omVO.getMenuNum();
		int menuOptionNum = omVO.getMenuOptionNum();
		
		//해당 메뉴의 옵션리스트
		List<MenuOptionVO> optionList = optionService.findOptionList(menuNum);
		//해당 메뉴정보객체
		MenuVO mVO = menuService.findMenu(menuNum);
		MenuOptionVO moVO = optionService.findOption(menuOptionNum);
		
		omVO.setOrderMenuPrice(mVO.getPrice()+moVO.getOptionPrice());
		System.out.println("setOrderMenuPrice : " + omVO.getOrderMenuPrice());
		
		//주문한 가게PK
		String crNum = mVO.getCrNum();
		
		//session에 저장할 장바구니List
		List<Map<String, Object>> cart;
		//cart에는 메뉴, 메뉴에 있는 옵션리스트, 주문수량, 주문가격이 담긴다
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("orderMenu", omVO);
		map.put("menu", mVO);
		map.put("optionList", optionList);
		
		if(session.getAttribute("cart") != null) {
			cart = (List<Map<String, Object>>) session.getAttribute("cart");
			System.out.println("exist cart session : " + cart.size());
		} else {
			cart = new ArrayList<Map<String,Object>>();
			System.out.println("new cart : " + cart);
		}
		
		boolean addOk = cart.add(map);
		System.out.println("addOk : " + addOk);
		System.out.println("add after cart : " + cart.size());
		
		if(addOk) {
			
			session.setAttribute("cart", cart);
		}
		
		rttr.addAttribute("crNum", crNum);
		rttr.addFlashAttribute("addOk", addOk);
		
		return "redirect:/store/storeUserGet";
	}
	
	@GetMapping("/menuRegister")
	public void menuRegister(String crNum, Model model) {
		
		System.out.println("/menu/menuRegister crNum : " + crNum);
		
		List<CodeVO> list = codeService.findListByCrNum(crNum);
		List<CodeVO> popularityList = codeService.findList("popularity");
		
		model.addAttribute("menuCategoryList", list);
		model.addAttribute("popularityList", popularityList);
		model.addAttribute("crNum", crNum);
	}
	
	@PostMapping("/menuRegister")
	public String menuRegister(@ModelAttribute MultipartFile file, MenuVO mVO, RedirectAttributes rttr) throws IOException {
		
		System.out.println("--post--/menu/menuRegister");
		
		if (!file.isEmpty()) {
			
            UploadFile uploadFile = fileStore.storeFile(file);
            System.out.println("uploadFile : " + uploadFile);
            
//            mVO.setMenuImg("/resources/images/"+uploadFile.getStoreFileName());
            mVO.setUploadFileName(uploadFile.getUploadFileName());
            mVO.setStoreFileName(uploadFile.getStoreFileName());
        }
		
		int insertOk = menuService.addMenu(mVO);
		
		System.out.println("insertOk : " + insertOk);
		
		rttr.addFlashAttribute("insertOk", insertOk);
		rttr.addAttribute("crNum", mVO.getCrNum());
		
		return "redirect:/menu/menuList";
	}
	
//	@ResponseBody
//    @GetMapping("/images/{filename}")
//    public Resource downloadImage(@PathVariable String filename) throws MalformedURLException {
//        return (Resource) new UrlResource("file:" + fileStore.getFullPath(filename));
//    }
	
	@GetMapping("/menuUpdate")
	public void menuUpdate(int menuNum, Model model) {
		
		System.out.println("/menu/menuUpdate menuNum : " + menuNum);
		
		MenuVO mVO = menuService.findMenu(menuNum);
		
		List<CodeVO> list = codeService.findListByCrNum(mVO.getCrNum());
		List<CodeVO> popularityList = codeService.findList("popularity");
		
		model.addAttribute("menuCategoryList", list);
		model.addAttribute("popularityList", popularityList);
		model.addAttribute("menu", mVO);
	}
	
	@PostMapping("/menuUpdate")
	public String menuUpdate(@ModelAttribute MultipartFile file, MenuVO mVO, RedirectAttributes rttr) throws IOException {
		
		System.out.println("--post--/menu/menuUpdate");
		
		if (!file.isEmpty()) {
			
            UploadFile uploadFile = fileStore.storeFile(file);
            System.out.println("uploadFile : " + uploadFile);
            
//            mVO.setMenuImg("/resources/images/"+uploadFile.getStoreFileName());
            mVO.setUploadFileName(uploadFile.getUploadFileName());
            mVO.setStoreFileName(uploadFile.getStoreFileName());
        }
		
		System.out.println("category : " + mVO.getMenuCategory());
		
		int updateOk = menuService.updateMenu(mVO);
		
		System.out.println("updateOk : " + updateOk);
		
		rttr.addFlashAttribute("updateOk", updateOk);
		rttr.addAttribute("crNum", mVO.getCrNum());
		
		return "redirect:/menu/menuList";
	}
	
	@GetMapping("/menuDelete")
	public String menuDelete(int menuNum, RedirectAttributes rttr) {
		
		System.out.println("/menu/menuDelete menuNum : " + menuNum);
		
		rttr.addAttribute("crNum", menuService.findMenu(menuNum).getCrNum());
		
		int deleteOk = menuService.deleteMenu(menuNum);
		
		rttr.addFlashAttribute("deleteOk", deleteOk);
		
		return "redirect:/menu/menuList";
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
	
	@GetMapping("/categoryUpdate")
	public void categoryRegister(String crNum, int name, Model model) {
		
		System.out.println("/menu/categoryUpdate crNum : " + crNum);
		System.out.println("/menu/categoryUpdate name : " + name);
		
		CodeVO cVO = codeService.findMenuCategory(crNum, name);
		
		model.addAttribute("category", cVO);
	}
	
	@PostMapping("/categoryUpdate")
	public String categoryUpdate(int getName, CodeVO cVO, RedirectAttributes rttr) {
		
		System.out.println("/menu/categoryUpdate getName : " + getName);
		
		int updateOk = codeService.updateMenuCategory(getName, cVO);
		
		System.out.println("updateOk : " + updateOk);
		
		rttr.addFlashAttribute("updateOk", updateOk);
		rttr.addAttribute("crNum", cVO.getCrNum());
		
		return "redirect:/menu/menuCategory";
	}
	
	@GetMapping("/categoryDelete")
	public String categoryDelete(String crNum, int name, RedirectAttributes rttr) {
		
		System.out.println("/menu/categoryDelete");
		
		int deleteOk = codeService.deleteMenuCategory(crNum, name);

		System.out.println("deleteOk : " + deleteOk);
		
		rttr.addFlashAttribute("deleteOk", deleteOk);
		rttr.addAttribute("crNum", crNum);
		
		return "redirect:/menu/menuCategory";
	}
}

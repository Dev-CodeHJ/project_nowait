package ezen.nowait.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ezen.nowait.store.service.StoreService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/store/*")
@AllArgsConstructor
public class StoreController {

	private StoreService storeService;
	
	@GetMapping("/getAll")
	public void getAll(Model model) {
		log.info("getAll");
		model.addAttribute("list", storeService.findAll());
	}
	
	@GetMapping("/getByCategory")
	public void getByCategory(Model model, int storeCategory) {
		log.info("getByCategory");
		model.addAttribute("getByCategory", storeService.findByCategory(storeCategory));
	}
	
	@GetMapping("/getByOwnerId")
	public void getByOwnerId(Model model, String ownerId) {
		log.info("getByOwnerId");
		model.addAttribute("getByOwnerId", storeService.findByOwnerId(ownerId));
	}
	
	@GetMapping("/getByCrNum")
	public void getByCrNum(Model model, String crNum) {
		log.info("getByCrNum");
		model.addAttribute("getByCrNum", storeService.findByCrNum(crNum));
	}
}

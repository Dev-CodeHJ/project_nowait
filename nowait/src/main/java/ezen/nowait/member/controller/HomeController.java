package ezen.nowait.member.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ezen.nowait.store.domain.StoreVO;
import ezen.nowait.store.service.StoreService;
import lombok.AllArgsConstructor;

/**
 * Handles requests for the application home page.
 */
@Controller
@AllArgsConstructor
public class HomeController {
	
	private StoreService storeService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("home..............");
		
		List<StoreVO> sVO = storeService.findAll();
		model.addAttribute("list", sVO);
		
		return "home";
	}
}
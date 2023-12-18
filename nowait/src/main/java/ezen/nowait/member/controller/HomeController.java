package ezen.nowait.member.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

<<<<<<< HEAD
import ezen.nowait.store.domain.StoreVO;
import ezen.nowait.store.service.StoreService;
import lombok.RequiredArgsConstructor;
=======
import ezen.nowait.member.service.UserService;
import ezen.nowait.store.domain.StoreVO;
import ezen.nowait.store.service.StoreService;
import lombok.AllArgsConstructor;

>>>>>>> main

/**
 * Handles requests for the application home page.
 */
@Controller
<<<<<<< HEAD
@RequiredArgsConstructor
public class HomeController {
	
	private final StoreService storeService;
	
=======
@AllArgsConstructor
public class HomeController {
	
	private StoreService storeService;
	
	private UserService userservice;
	

>>>>>>> main
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<StoreVO> list = storeService.findAll();
		model.addAttribute("list", list);
		
		return "home";
	}
	
	@GetMapping("/choice")
	public void choice() {}
}

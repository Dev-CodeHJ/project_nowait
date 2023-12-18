package ezen.nowait.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.nowait.board.domain.ReplyVO;
import ezen.nowait.board.domain.ReviewVO;
import ezen.nowait.board.service.ReplyService;
import ezen.nowait.board.service.ReviewService;
import ezen.nowait.store.service.StoreService;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@RequestMapping("/reply/*")
@Controller
public class ReplyController {
	
	private ReviewService reviewservice;
	
	private ReplyService replyservice;
	
	private StoreService storeService;
	
	HttpSession session;
	
	//가게에 달린 리뷰리스트
	@GetMapping("/storeReply")
	public void storeReply(Model model, String crNum) {
		System.out.println("crNum:" + crNum);
		
		model.addAttribute("store", storeService.findByCrNum(crNum));		

		List<ReviewVO> list = reviewservice.getList("cr_num",crNum);		
		
		model.addAttribute("StoreReviewList", list);
	}
	
	@GetMapping({"/storeReadReview","/updateReply"})
	public void getStoreReview(@RequestParam("reviewNum") int reviewNum, Model model) {
		System.out.println("read or update");
		model.addAttribute("storeReview",reviewservice.getReview(reviewNum));
	}
	
	//댓글수정 컨트롤러
	@PostMapping("/updateReply")
	public String updateReply(@RequestParam("reviewNum") int reviewNum, ReplyVO pVO,RedirectAttributes rttr) {
		System.out.println("updateReply:" + pVO);
		if(replyservice.updateReply(pVO)) {
			rttr.addAttribute("reviewNum", reviewNum);
			rttr.addFlashAttribute("update","success");
		}
		return "redirect:/reply/storeReadReview";
	}
	
	@GetMapping("/insertReply")
	public void insertReply(int reviewNum,Model model) {
		ReviewVO rVO = reviewservice.getReview(reviewNum);
		model.addAttribute("review",rVO);
	}
	
	@PostMapping("/insertReply")
	public String storeInsertReply(@RequestParam("reviewNum") int reviewNum, ReplyVO pVO, RedirectAttributes rttr) {
		System.out.println("insertReply:" + pVO);
		
		replyservice.insertReply(pVO);
		rttr.addAttribute("reviewNum", reviewNum);
		
		return "redirect:/reply/storeReadReview";
	}
	
	@PostMapping("/deleteReply")
	public String deleteReply(String crNum, int replyNum, HttpServletRequest request, RedirectAttributes rttr) {
		
		System.out.println("delete....." + replyNum);
		
		int result = replyservice.deleteReply(replyNum);
		rttr.addAttribute("crNum",crNum);
		
		if(result == 1) {
			
			return "redirect:/reply/storeReply";
		}
		return "/reply/storeReadReview";
	}		
	
}

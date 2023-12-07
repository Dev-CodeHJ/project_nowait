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

import ezen.nowait.board.domain.ReviewVO;
import ezen.nowait.board.service.ReviewService;
import ezen.nowait.member.domain.UserVO;
import ezen.nowait.member.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class ReviewController {
	
	private UserService userservice;
	
	private ReviewService reviewservice;
	
	HttpSession session;

	
	@GetMapping("/insertReview")
	public void insertReview() {}
	
	@PostMapping("/insertReview")
	public String insertReview(ReviewVO rVO, RedirectAttributes rttr) {
		log.info("insertReview:" + rVO);
		
		reviewservice.insertReview(rVO);
		
		rttr.addFlashAttribute("result", rVO.getReviewNum());
		
		return "redirect:/board/userReview";
	}
	
	//손님리뷰조회페이지로 이동
	@GetMapping("/userReview")
	public void userReviewList(Model model, HttpServletRequest request) {
		
		session = request.getSession();
		UserVO uVO = (UserVO) session.getAttribute("member");
		List<ReviewVO> list = reviewservice.getList(uVO.getUserId());
		
		model.addAttribute("rVO", list);
	}
	
	//get으로 reviewNum값 불러오기
	@GetMapping({"/readReview","/updateReview"})
	public void getReview(@RequestParam("reviewNum") int reviewNum, Model model) {
		System.out.println("read or update");
		model.addAttribute("review",reviewservice.getReview(reviewNum));
	}
	//리뷰 상세보기 컨트롤러
	@PostMapping("/readReview")
	public String deleteReview(int reviewNum, HttpServletRequest request) {
		
		System.out.println("delete....." + reviewNum);
		
		int result = reviewservice.deleteReview(reviewNum);
		
		if(result == 1) {
			
			return "/board/userReview";
		}
		return "/board/readReview";
	}	
	//리뷰수정 컨트롤러
	@PostMapping("/updateReview")
	public String updateReview(ReviewVO rVO,RedirectAttributes rttr) {
		System.out.println("updateReview:" + rVO);
			if(reviewservice.updateReview(rVO)) {
				rttr.addFlashAttribute("update","success");
			}
			return "redirect:/board/userReview";
		}

}

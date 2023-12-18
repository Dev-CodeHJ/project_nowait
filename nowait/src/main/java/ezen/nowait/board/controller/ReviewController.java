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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.nowait.board.domain.ReviewVO;
import ezen.nowait.board.service.ReviewService;
import ezen.nowait.member.domain.UserVO;
import ezen.nowait.member.service.UserService;
import ezen.nowait.order.domain.OrderVO;
import ezen.nowait.order.service.OrderService;
import ezen.nowait.store.service.StoreService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class ReviewController {
	
	private UserService userservice;
	
	private ReviewService reviewservice;
	
	private OrderService orderservice;
	
	private StoreService storeService;
	
	HttpSession session;

	
//	@GetMapping("/insertReview")
//	public void insertReview(int orderNum,int reviewNum, Model model) {
//		
//		OrderVO oVO = orderservice.getOrderDetailList(orderNum);
//		StoreVO sVO = storeService.findByCrNum(oVO.getCrNum());
//		ReviewVO rVO = reviewservice.getReview(reviewNum);
//		sVO.getStoreName();
//		model.addAttribute("order",oVO);
//		model.addAttribute("storeName", sVO.getStoreName());
//		model.addAttribute("review",rVO);
//	}
	
	@GetMapping("/insertReview")
	public void insertReview(int orderNum,Model model) {
		
		OrderVO oVO = orderservice.getOrderDetailList(orderNum);
		model.addAttribute("order",oVO);
	}
	
	@PostMapping("/insertReview")
	public String insertReview(ReviewVO rVO, RedirectAttributes rttr) {
		System.out.println("insertReview:" + rVO);
		
		reviewservice.insertReview(rVO);
		
		// 리뷰내용으로 리뷰를 검색해 있으면 T 없으면 F를 리턴 
		ReviewVO rVO2 = reviewservice.getReview2(rVO.getReviewContent());
		
		if(rVO2.getReviewContent().equals(rVO.getReviewContent())) {
			rttr.addFlashAttribute("message", "T");
		}else {
			rttr.addFlashAttribute("message", "F");
		}		
		
		return "redirect:/order/userOrderList";
	}

	//손님 리뷰 리스트 페이지로 이동
	@GetMapping("/userReview")
	public void userReviewList(Model model, HttpServletRequest request) {
		
		session = request.getSession();
		UserVO uVO = (UserVO) session.getAttribute("member");
		List<ReviewVO> list = reviewservice.getList("user_id", uVO.getUserId());
		
		model.addAttribute("rVO", list);
	}
	
	//get으로 reviewNum값 불러오기
	@GetMapping({"/readReview","/updateReview"})
	public void getReview(@RequestParam("reviewNum") int reviewNum, Model model) {
		System.out.println("read or update");
		model.addAttribute("review",reviewservice.getReview(reviewNum));
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
	
	//리뷰 상세보기에서 리뷰삭제 컨트롤러
	@PostMapping("/readReview")
	public String deleteReview(int reviewNum, HttpServletRequest request) {
		
		System.out.println("delete....." + reviewNum);
		
		int result = reviewservice.deleteReview(reviewNum);
		
		if(result == 1) {
			
			return "redirect:/board/userReview";
		}
		return "/board/userOderList";
	}		
	
}

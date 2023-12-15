package ezen.nowait.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ezen.nowait.member.domain.UserVO;
import ezen.nowait.member.service.UserService;
import ezen.nowait.order.domain.OrderMenuVO;
import ezen.nowait.order.domain.OrderVO;
import ezen.nowait.order.service.OrderService;
import ezen.nowait.store.domain.MenuOptionVO;
import ezen.nowait.store.domain.MenuVO;
import ezen.nowait.store.service.MenuService;
import ezen.nowait.store.service.StoreService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order")
@RequiredArgsConstructor
public class OrderController {

	private final OrderService orderservice;
	
	private final UserService userservice;
	
	private final StoreService storeService;
	
	private final MenuService menuService;
	
	HttpSession session;
	
	//손님 장바구니 이동
	@SuppressWarnings("unchecked")
	@GetMapping("/orderCart")
	public void userOrder(HttpServletRequest request) {
		
		session = request.getSession();
		
		List<OrderMenuVO> orderList = new ArrayList<OrderMenuVO>();
		List<MenuVO> menuList = new ArrayList<MenuVO>();
		List<MenuOptionVO> optionList = new ArrayList<MenuOptionVO>();
		MenuVO mVO;
		
		if(session.getAttribute("cart") == null) {
			
			orderList = new ArrayList<OrderMenuVO>();
			
		} else {
			
			orderList = (List<OrderMenuVO>) session.getAttribute("cart");
			
			for(int i=0; i<orderList.size(); i++) {
				
				int menuNum = orderList.get(i).getMenuNum();
				mVO = menuService.findMenu(menuNum);
				menuList.add(mVO);
				
				int menuOptionNum = orderList.get(i).getMenuOptionNum();
			}
		}
		
		
	}

	 
	//손님 주문목록 이동
	@GetMapping("/userOrderList")
	public void userOrderList(Model model, HttpServletRequest request) {
		
		session = request.getSession();
		
		 UserVO uVO = (UserVO) session.getAttribute("member");
		 List<OrderVO> orderlist = orderservice.getOrderList(uVO.getUserId());
		 
		 System.out.println("주문목록");
		
		 model.addAttribute("orderlist", orderlist);
	}
	
	//손님 주문별 상세조회 이동
	@GetMapping("/orderDetailList")
	public void orderDetailList(Model model, HttpServletRequest request) {
		
		session = request.getSession();
 		 UserVO uVO = (UserVO) session.getAttribute("member");
  		 
 		List<OrderVO> orderDetail = orderservice.getOrderDetailList(uVO.getUserId());
 		 System.out.println("주문상세조회");
 		 
		model.addAttribute("orderDetail", orderDetail);
	}

	//손님상세페이지에서 리뷰쓰기페이지 이동
  	@PostMapping("/orderDetailList")
 
	public String OrderDetailList(Model model, HttpServletRequest request) {

		return "redirect:/user/insertReview";
	}
	
  	
  //손님 주문완료영수증 페이지 이동
  	@GetMapping("/orderBill")
  	public void orderBill() {
  		System.out.println("주문영수증");
  	}
  	
  //손님 주문완료영수증-주문목록인서트 후 유저주문목록 이동
  	@PostMapping("/orderBill")
	public String orderBill(OrderVO odVO ,Model model, HttpServletRequest request) {

  		System.out.println("주문영수증확인");
  		
  		session = request.getSession();
		UserVO uVO = (UserVO) session.getAttribute("member");
		orderservice.orderInsert(odVO);
		
		return "redirect:/order/userOrderList";
	}

	//손님이 홈에서 가게메뉴보기 페이지 이동
	@GetMapping("/choiceMenu")
	public void choiceMenu(String crNum, Model model) {
		
		List<MenuVO> menuList = menuService.findMenuList(crNum);
		
		model.addAttribute("menuList", menuList);
	}

	//손님이 홈에서 가게메뉴보기 페이지 이동
	@GetMapping("/choiceDetailMenu")
	public void choiceDetailMenu() {}
	
	//장바구니-주문
	@PostMapping("/orderCart")
	public String orderPagePost(OrderVO odVO, HttpServletRequest request) {
		
		System.out.println(odVO);		
		
		return "/orderView";
	}
	
	//손님 장바구니-주문 이동
	@GetMapping("/orderView")
	public void orderView() {}
	
	 @RequestMapping(value = "/orderView",method=RequestMethod.POST)
	  public String orderView(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			  OrderVO orderVO, Model model,int totalPrice) throws Exception{
		  
	  session.setAttribute("orderlist", orderVO);
	  session.setAttribute("totalPrice", totalPrice);

		  return "/orderBill";
	  }
	
	//메뉴담기시 장바구니세션
	 @PostMapping("/orderInsert")
	  public String orderInsert(OrderVO odVO, int orderNum)throws Exception{
		  odVO.setOrderNum(orderNum);
		  orderservice.orderCartInsert(odVO);
		  
		  return "redirect:/order/orderCart";
	  }
}

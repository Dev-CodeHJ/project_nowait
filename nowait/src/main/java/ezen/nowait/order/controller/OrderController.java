package ezen.nowait.order.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.nowait.member.domain.UserVO;
import ezen.nowait.order.domain.OrderMenuListDTO;
import ezen.nowait.order.domain.OrderMenuVO;
import ezen.nowait.order.domain.OrderVO;
import ezen.nowait.order.service.OrderMenuService;
import ezen.nowait.order.service.OrderService;
import ezen.nowait.store.domain.MenuOptionVO;
import ezen.nowait.store.domain.MenuVO;
import ezen.nowait.store.domain.StoreVO;
import ezen.nowait.store.service.MenuOptionService;
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
	
	private final MenuService menuService;
	
	private final MenuOptionService menuOptionService;
	
	private final OrderMenuService orderMenuService;
	
	private final StoreService storeService;
	
	HttpSession session;
	
	//손님 장바구니 이동
	@GetMapping("/orderCart")
	public void orderCart() {}

	//장바구니-주문
	@RequestMapping("/orderCart")
	public String orderCart(@ModelAttribute(value="OrderMenuListDTO") OrderMenuListDTO orderMenuList, OrderVO odVO, HttpServletRequest request, RedirectAttributes rttr) {
		
		System.out.println("omVO : " + orderMenuList);
		System.out.println("oVO : " + odVO);
		
		session = request.getSession();
		UserVO uVO = (UserVO) session.getAttribute("member");
		List<OrderMenuVO> orderList = orderMenuList.getOrderMenuList();
		
		System.out.println("orderList size : " + orderList.size());
		
		odVO.setUserId(uVO.getUserId());
		
		int addOk = 0;
		int orderMenuListAddOk = 0;
		addOk = orderservice.orderInsert(odVO);
		
		if(addOk == 1) {
			int orderNum = odVO.getOrderNum();
			int cnt = 0;
			
			for(int i=0; i<orderList.size(); i++) {
				
				orderList.get(i).setOrderNum(orderNum);
				
				int setOrderNum = orderList.get(i).getOrderNum();
				System.out.println("orderList[" + i + "]orderNum : " + setOrderNum);
				
				if(setOrderNum == orderNum) {
					cnt++;
				}
			}
			System.out.println("cnt : " + cnt + " :: orderList.size() : " + orderList.size());
			
			if(orderList.size() == cnt) {
				
				orderMenuListAddOk = orderMenuService.addOrderMenu(orderList);
				System.out.println("orderMenuListAddOk : " + orderMenuListAddOk);
				
				if(orderMenuListAddOk == 1) {
					session.removeAttribute("cart");
				}
			}
		}
		rttr.addFlashAttribute("addOk", orderMenuListAddOk);
		rttr.addAttribute("orderNum", odVO.getOrderNum());
		
		return "redirect:/order/orderBill";
	}
	
	//장바구니에 있는 선택한 메뉴 삭제
	@GetMapping("/cartMenuDelete")
	public String cartMenuDelete(int deleteIndex, HttpServletRequest request, RedirectAttributes rttr) {
		
		System.out.println("deleteIndex : " + deleteIndex);

		session = request.getSession();
		int deleteOk = 0;
		
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
		int size = cart.size();
		System.out.println("cartSize : " + size);
		
		cart.remove(deleteIndex);
		System.out.println("delete cartSize : " + cart.size());
		
		if(size-1 == cart.size()) {
			deleteOk = 1;
		}
		
		rttr.addFlashAttribute("deleteOk", deleteOk);
		
		return "redirect:/order/orderCart";
	}
	
	//손님 주문완료영수증 페이지 이동
	@GetMapping("/orderBill")
	public void orderBill(int orderNum, Model model) {
		
		System.out.println("주문page orderNum : " + orderNum);
		
		//orderVO
		OrderVO odVO = orderservice.findOrder(orderNum);
		model.addAttribute("odVO", odVO);
		
		//가게이름
		StoreVO sVO = storeService.findByCrNum(odVO.getCrNum());
		model.addAttribute("storeName", sVO.getStoreName());

		//메뉴, 옵션 리스트
		List<OrderMenuVO> orderMenuList = orderMenuService.findOrderMenuList(orderNum);
		List<MenuVO> menuList = new ArrayList<MenuVO>();
		MenuVO mVO = new MenuVO();
		
		List<MenuOptionVO> menuOptionList = new ArrayList<MenuOptionVO>();
		MenuOptionVO moVO = new MenuOptionVO();
		
		int menuNum = 0;
		int menuOptionNum = 0;
		
		for(int i=0; i<orderMenuList.size(); i++) {
			
			menuNum = orderMenuList.get(i).getMenuNum();
			mVO = menuService.findMenu(menuNum);
			menuList.add(mVO);
			
			menuOptionNum = orderMenuList.get(i).getMenuOptionNum();
			moVO = menuOptionService.findOption(menuOptionNum);
			menuOptionList.add(moVO);
		}
		
		System.out.println("menuList : " + menuList);
		System.out.println("menuOptionList : " + menuOptionList);
		
		model.addAttribute("menuList", menuList);
		model.addAttribute("menuOptionList", menuOptionList);
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
//		  orderservice.orderCartInsert(odVO);
		  
		  return "redirect:/order/orderCart";
	  }
}

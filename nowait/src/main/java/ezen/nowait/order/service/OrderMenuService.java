package ezen.nowait.order.service;

import java.util.List;

import ezen.nowait.order.domain.OrderMenuVO;

public interface OrderMenuService {

	public int addOrderMenu(List<OrderMenuVO> orderMenuList);
	
	public List<OrderMenuVO> findOrderMenuList(int orderNum);
}

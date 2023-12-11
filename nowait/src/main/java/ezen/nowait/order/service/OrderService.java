package ezen.nowait.order.service;

import java.util.List;

import ezen.nowait.order.domain.OrderVO;

public interface OrderService {

	public List<OrderVO> getOrderList(String userId);

	public OrderVO getOrderDetailList(int orderNum);

	public void orderInsert(OrderVO odVO);

	public void orderCartInsert(OrderVO odVO);

	
	
}

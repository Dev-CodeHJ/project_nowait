package ezen.nowait.order.service;

import java.util.List;

import ezen.nowait.order.domain.OrderVO;

public interface OrderService {

	public List<OrderVO> getOrderList(String userId);

	public OrderVO getOrderDetail(int orderNum);

	public int orderInsert(OrderVO odVO);

	public int orderCartInsert(OrderVO odVO);

	public OrderVO findOrder(int orderNum);
}

package ezen.nowait.order.mapper;

import java.util.List;

import ezen.nowait.order.domain.OrderVO;

public interface OrderMapper {

	//주문 간단내역 가져오기
	public List<OrderVO> getOrderList(String userId);
	
	public OrderVO getOrderDetail(int orderNum);

	public OrderVO selectOrder(int orderNum);
	
	//주문상품 insert
	public int orderInsert(OrderVO odVO);
}

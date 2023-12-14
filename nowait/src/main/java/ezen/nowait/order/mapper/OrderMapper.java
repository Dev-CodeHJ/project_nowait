package ezen.nowait.order.mapper;

import java.util.List;

import ezen.nowait.order.domain.OrderVO;

public interface OrderMapper {

	//주문 간단내역 가져오기
	public List<OrderVO> getOrderList(String userId);	
	public List<OrderVO> getOrderDetailList(String userId);

	//주문상품 insert
	public void orderInsert(OrderVO odVO);



}

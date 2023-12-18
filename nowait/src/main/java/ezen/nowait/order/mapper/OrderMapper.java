package ezen.nowait.order.mapper;

import java.util.List;

import ezen.nowait.order.domain.OrderVO;

public interface OrderMapper {

	//주문 간단내역 가져오기
	public List<OrderVO> getOrderList(String userId);	

	//주문상품 정보 insert
	public void orderInsert(OrderVO odVO);


	public OrderVO getOrderDetailList(int orderNum);

}

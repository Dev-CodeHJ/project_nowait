package ezen.nowait.order.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ezen.nowait.order.domain.OrderVO;
import ezen.nowait.order.mapper.OrderMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {
	
	private OrderMapper orderMapper;
	
	@Override
	public List<OrderVO> getOrderList(String userId) {
		return orderMapper.getOrderList(userId);
	}

	@Override
	public void orderInsert(OrderVO odVO) {
		orderMapper.orderInsert(odVO);
	}

	@Override
	public OrderVO getOrderDetailList(int orderNum) {
		return orderMapper.getOrderDetailList(orderNum);
	}

	@Override
	public void orderCartInsert(OrderVO odVO) {
		// TODO Auto-generated method stub
		
	}

	
}

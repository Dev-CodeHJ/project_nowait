package ezen.nowait.order.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ezen.nowait.order.domain.OrderVO;
import ezen.nowait.order.mapper.OrderMapper;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {
	
	private final OrderMapper orderMapper;
	
	@Override
	public List<OrderVO> getOrderList(String userId) {
		return orderMapper.getOrderList(userId);
	}

	@Override
	public int orderInsert(OrderVO odVO) {
		return orderMapper.orderInsert(odVO);
	}

	@Override
	public OrderVO getOrderDetailList(int orderNum) {
		return orderMapper.getOrderDetailList(orderNum);
	}

	@Override
	public int orderCartInsert(OrderVO odVO) {
		return 0;
	}

	@Override
	public OrderVO findOrder(int orderNum) {
		
		return orderMapper.selectOrder(orderNum);
	}

}

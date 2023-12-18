package ezen.nowait.order.mapper;

import java.util.List;

import ezen.nowait.order.domain.OrderMenuVO;

public interface OrderMenuMapper {

	public int orderMenuInsert(List<OrderMenuVO> orderMenuList);
	
	public List<OrderMenuVO> selectOrderMenuList(int orderNum);
}

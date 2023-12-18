package ezen.nowait.order.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ezen.nowait.order.domain.OrderMenuVO;
import ezen.nowait.order.mapper.OrderMenuMapper;
import ezen.nowait.store.domain.MenuVO;
import ezen.nowait.store.mapper.MenuMapper;
import ezen.nowait.store.mapper.StoreMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderMenuServiceImpl implements OrderMenuService{
	
	private final OrderMenuMapper orderMenuMapper;
	
	private final MenuMapper menuMapper;
	
	private final StoreMapper storeMapper;
	
	@Override
	public int addOrderMenu(List<OrderMenuVO> orderMenuList) {
		
		int result = 0;
		result = orderMenuMapper.orderMenuInsert(orderMenuList);
		
		System.out.println("orderMenuServiceImpl insert result : " + result);
		
		if(result == orderMenuList.size()) {
			
			result = 1;
			
			int menuNum = orderMenuList.get(0).getMenuNum();
			MenuVO mVO = menuMapper.selectMenu(menuNum);
			
			String crNum = mVO.getCrNum();
			storeMapper.orderCntUp(crNum);
		}
		return result;
	}

	@Override
	public List<OrderMenuVO> findOrderMenuList(int orderNum) {
		
		return orderMenuMapper.selectOrderMenuList(orderNum);
	}
}

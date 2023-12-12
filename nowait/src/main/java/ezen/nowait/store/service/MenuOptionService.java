package ezen.nowait.store.service;

import java.util.List;

import ezen.nowait.store.domain.MenuOptionVO;

public interface MenuOptionService {

	public List<MenuOptionVO> findOptionList(int menuNum);
	
	public MenuOptionVO findOption(int menuOptionNum);
	
	public int findOptionCnt(int menuNum);
	
	public int addOption(MenuOptionVO opVO);
	
	public int updateOption(MenuOptionVO opVO);
	
	public int deleteOption(int menuOptionNum);
}

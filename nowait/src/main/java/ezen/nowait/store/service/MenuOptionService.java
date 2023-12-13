package ezen.nowait.store.service;

import java.util.List;

import ezen.nowait.store.domain.MenuOptionVO;

public interface MenuOptionService {

	public List<MenuOptionVO> findOptionList(int menuNum);
	
	public MenuOptionVO findOption(int menuOptionNum);
	
//	public int findOptionCnt(int menuNum);
	
	public int addOption(MenuOptionVO moVO);
	
	public int updateOption(MenuOptionVO moVO);
	
	public int deleteOption(int menuOptionNum);
}

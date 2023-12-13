package ezen.nowait.store.mapper;

import java.util.List;

import ezen.nowait.store.domain.MenuOptionVO;

public interface MenuOptionMapper {

	public List<MenuOptionVO> selectOptionList(int menuNum);
	
	public MenuOptionVO selectOption(int menuOptionNum);
	
//	public int selectOptionCnt(int menuNum);
	
	public int insertOption(MenuOptionVO moVO);
	
	public int updateOption(MenuOptionVO moVO);
	
	public int deleteOption(int menuOptionNum);
	
	public int deleteAll(int menuNum);
}

package ezen.nowait.store.mapper;

import java.util.List;

import ezen.nowait.store.domain.MenuVO;

public interface MenuMapper {

	public List<MenuVO> selectMenuList(String crNum);
	
	public MenuVO selectMenu(int menuNum);
	
	public int insertMenu(MenuVO mVO);
	
	public int updateMenu(MenuVO mVO);
	
	public int deleteMenu(int menuNum);
}

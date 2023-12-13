package ezen.nowait.store.service;

import java.util.List;

import ezen.nowait.store.domain.MenuVO;

public interface MenuService {

	public List<MenuVO> findMenuList(String crNum);
	
	public MenuVO findMenu(int menuNum);
	
	public int addMenu(MenuVO mVO);
	
	public int updateMenu(MenuVO mVO);
	
	public int deleteMenu(int menuNum);
	
	public int deleteAll(String crNum);
}

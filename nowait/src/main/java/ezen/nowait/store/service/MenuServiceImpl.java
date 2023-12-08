package ezen.nowait.store.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ezen.nowait.store.domain.MenuVO;
import ezen.nowait.store.mapper.MenuMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MenuServiceImpl implements MenuService{

	private MenuMapper menuMapper;
	
	@Override
	public List<MenuVO> findMenuList(String crNum) {
		
		return menuMapper.selectMenuList(crNum);
	}

	@Override
	public MenuVO findMenu(int menuNum) {
		
		return menuMapper.selectMenu(menuNum);
	}

	@Override
	public int addMenu(MenuVO mVO) {
		
		return menuMapper.insertMenu(mVO);
	}

	@Override
	public int updateMenu(MenuVO mVO) {

		return menuMapper.updateMenu(mVO);
	}

	@Override
	public int deleteMenu(int menuNum) {
		
		return menuMapper.deleteMenu(menuNum);
	}
}

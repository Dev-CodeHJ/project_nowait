package ezen.nowait.store.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ezen.nowait.store.domain.MenuVO;
import ezen.nowait.store.mapper.MenuMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MenuServiceImpl implements MenuService{

	private final MenuMapper menuMapper;
	
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

		int result = 0;
		
		MenuVO find = menuMapper.selectMenu(mVO.getMenuNum());
		
		if(find != null) {
			
			result = menuMapper.updateMenu(mVO);
		}
		return result;
	}

	@Override
	public int deleteMenu(int menuNum) {
		
		int result = 0;
		MenuVO find = menuMapper.selectMenu(menuNum);
		
		if(find != null) {
			result = menuMapper.deleteMenu(menuNum);
		}
		return result;
	}
}

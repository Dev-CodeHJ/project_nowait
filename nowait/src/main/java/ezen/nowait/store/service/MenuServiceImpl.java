package ezen.nowait.store.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ezen.nowait.store.domain.MenuOptionVO;
import ezen.nowait.store.domain.MenuVO;
import ezen.nowait.store.mapper.MenuMapper;
import ezen.nowait.store.mapper.MenuOptionMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MenuServiceImpl implements MenuService{

	private final MenuMapper menuMapper;
	
	private final MenuOptionMapper optionMapper;
	
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
		List<MenuOptionVO> list = optionMapper.selectOptionList(menuNum);
		
		if(find != null) {
			
			int delete = optionMapper.deleteAll(menuNum);
			System.out.println("delete : " + delete);
			System.out.println("menuOptionCnt : " + list.size());
			
			if(delete == list.size()) {
				
				result = menuMapper.deleteMenu(menuNum);
				System.out.println("menuDeleteCnt : " + result);
			}
		}
		return result;
	}

	@Override
	public int deleteAll(String crNum) {
		
		int menuNum;
		int delete = 0;
		int cnt = 0;
		List<MenuVO> list = menuMapper.selectMenuList(crNum);
		
		for(int i=0; i<list.size(); i++) {
			menuNum = list.get(i).getMenuNum();
			System.out.println("menuNum : " + menuNum);
			
			delete += deleteMenu(menuNum);
			System.out.println("delete : " + delete);
		}
		if(list.size() == delete) {
			cnt = 1;
		}
		return cnt;
	}
}

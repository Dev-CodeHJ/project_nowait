package ezen.nowait.store.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ezen.nowait.store.domain.MenuOptionVO;
import ezen.nowait.store.mapper.MenuOptionMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MenuOptionServiceImpl implements MenuOptionService{

	private final MenuOptionMapper optionMapper;
	
	@Override
	public List<MenuOptionVO> findOptionList(int menuNum) {
		
		List<MenuOptionVO> list = optionMapper.selectOptionList(menuNum);
		
		return list;
	}

	@Override
	public MenuOptionVO findOption(int menuOptionNum) {
		
		return optionMapper.selectOption(menuOptionNum);
	}

	@Override
	public int addOption(MenuOptionVO moVO) {
		
		return optionMapper.insertOption(moVO);
	}

	@Override
	public int updateOption(MenuOptionVO moVO) {
		
		int result = 0;
		MenuOptionVO find = optionMapper.selectOption(moVO.getMenuOptionNum());
		
		if(find != null) {
			result = optionMapper.updateOption(moVO);
		}
		
		return result;
	}

	@Override
	public int deleteOption(int menuOptionNum) {
		
		int result = 0;
		MenuOptionVO find = optionMapper.selectOption(menuOptionNum);
		System.out.println("MenuOptionVO : " + find);
		if(find != null) {
			result = optionMapper.deleteOption(menuOptionNum);
		}
		System.out.println("result : " + result);
		return result;
	}

//	@Override
//	public int findOptionCnt(int menuNum) {
//		
//		return optionMapper.selectOptionCnt(menuNum);
//	}

}

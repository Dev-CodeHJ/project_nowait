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
		System.out.println("list : " + list);
		
		return list;
	}

	@Override
	public MenuOptionVO findOption(int menuOptionNum) {
		
		return optionMapper.selectOption(menuOptionNum);
	}

	@Override
	public int addOption(MenuOptionVO opVO) {
		
		return optionMapper.insertOption(opVO);
	}

	@Override
	public int updateOption(MenuOptionVO opVO) {
		
		int result = 0;
		MenuOptionVO find = optionMapper.selectOption(opVO.getMenuOptionNum());
		
		if(find != null) {
			result = optionMapper.updateOption(opVO);
		}
		
		return result;
	}

	@Override
	public int deleteOption(int menuOptionNum) {
		
		int result = 0;
		MenuOptionVO find = optionMapper.selectOption(menuOptionNum);
		
		if(find != null) {
			result = optionMapper.deleteOption(menuOptionNum);
		}
		
		return result;
	}

//	@Override
//	public int findOptionCnt(int menuNum) {
//		
//		return optionMapper.selectOptionCnt(menuNum);
//	}

}

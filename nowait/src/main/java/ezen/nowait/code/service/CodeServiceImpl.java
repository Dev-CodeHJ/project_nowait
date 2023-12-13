package ezen.nowait.code.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import ezen.nowait.code.domain.CodeVO;
import ezen.nowait.code.mapper.CodeMapper;
import ezen.nowait.store.mapper.MenuMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CodeServiceImpl implements CodeService{
	
	private CodeMapper codeMapper;
	
	private MenuMapper menuMapper;
	
	@Override
	public List<CodeVO> findList(String id) {
		
		return codeMapper.selectList(id);
	}

	@Override
	public CodeVO findOne(String id, int name) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("name", name);
		
		return codeMapper.selectOne(map);
	}

	@Override
	public List<CodeVO> findListByCrNum(String crNum) {
		
		
		return codeMapper.selectListByCrNum(crNum);
	}

	@Override
	public CodeVO findMenuCategory(String crNum, int name) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("crNum", crNum);
		map.put("name", name);
		
		return codeMapper.selectMenuCategory(map);
	}

	@Override
	public int selectCnt(String crNum, int name) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("crNum", crNum);
		map.put("name", name);
		
		return codeMapper.selectCnt(map);
	}
	
	@Override
	public int insertMenuCategory(CodeVO cVO) {
		
		int cnt = selectCnt(cVO.getCrNum(), cVO.getName());
		
		System.out.println("codeService insert categoryCnt : " + cnt);
		
		if(cnt == 0) {
			
			return codeMapper.insertMenuCategory(cVO);
		}
		
		return 0;
	}

	@Override
	public int updateMenuCategory(int name, CodeVO cVO) {

		String crNum = cVO.getCrNum();
		int cnt = selectCnt(crNum, name);
		int cnt2 = selectCnt(crNum, cVO.getName());
		
		System.out.println("codeService update categoryCnt : " + cnt);
		
		if((cnt == 1 && cnt2 == 0) || name == cVO.getName()) {
			
			Map<String, Object> map2 = new HashMap<String, Object>();
			
			map2.put("crNum", crNum);
			map2.put("menuCategory", name);
			map2.put("setCategory", cVO.getName());
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("crNum", crNum);
			map.put("name", name);
			map.put("setName", cVO.getName());
			map.put("value", cVO.getValue());
			
			int result = codeMapper.updateMenuCategory(map);
			
			if(result >= 1) {
				
				menuMapper.updateMenuCategory(map2);
			}
			
			return result;
		}
		
		return 0;
	}

	@Override
	public int deleteMenuCategory(String crNum, int name) {

		int cnt = selectCnt(crNum, name);
		
		System.out.println("codeService delete categoryCnt : " + cnt);
		
		if(cnt == 1) {
			
			Map<String, Object> map2 = new HashMap<String, Object>();
			
			map2.put("crNum", crNum);
			map2.put("menuCategory", name);
			map2.put("setCategory", 0);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("crNum", crNum);
			map.put("name", name);
			
			int result = codeMapper.deleteMenuCategory(map);
			
			if(result >= 1) {
				
				menuMapper.updateMenuCategory(map2);
			}

			return result;
		}
		
		return 0;
	}
}

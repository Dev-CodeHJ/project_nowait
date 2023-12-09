package ezen.nowait.code.mapper;

import java.util.List;
import java.util.Map;

import ezen.nowait.code.domain.CodeVO;

public interface CodeMapper {

	public List<CodeVO> selectList(String id);
	
	public CodeVO selectOne(Map<String, Object> map);
	
	public List<CodeVO> selectListByCrNum(String crNum);
	
	public CodeVO selectMenuCategory(Map<String, Object> map);
	
	public int selectCnt(Map<String, Object> map);
	
	public int insertMenuCategory(CodeVO cVO);
	
	public int updateMenuCategory(Map<String, Object> map);
	
	public int deleteMenuCategory(Map<String, Object> map);
}

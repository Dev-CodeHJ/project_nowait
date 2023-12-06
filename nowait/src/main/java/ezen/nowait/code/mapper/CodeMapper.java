package ezen.nowait.code.mapper;

import java.util.List;
import java.util.Map;

import ezen.nowait.code.domain.CodeVO;

public interface CodeMapper {

	public List<CodeVO> selectList(String id);
	
	public CodeVO selectOne(Map<String, Object> map);
	
}

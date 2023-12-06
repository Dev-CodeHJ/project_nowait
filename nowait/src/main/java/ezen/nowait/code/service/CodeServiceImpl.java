package ezen.nowait.code.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import ezen.nowait.code.domain.CodeVO;
import ezen.nowait.code.mapper.CodeMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CodeServiceImpl implements CodeService{
	
	private CodeMapper codeMapper;
	
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
}

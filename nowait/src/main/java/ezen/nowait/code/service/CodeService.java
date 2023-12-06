package ezen.nowait.code.service;

import java.util.List;

import ezen.nowait.code.domain.CodeVO;

public interface CodeService {

	public List<CodeVO> findList(String id);
	
	public CodeVO findOne(String id, int name);
}

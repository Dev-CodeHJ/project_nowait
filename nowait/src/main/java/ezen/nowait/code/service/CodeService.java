package ezen.nowait.code.service;

import java.util.List;

import ezen.nowait.code.domain.CodeVO;

public interface CodeService {

	public List<CodeVO> findList(String id);
	
	public CodeVO findOne(String id, int name);
	
	public List<CodeVO> findListByCrNum(String crNum);
	
	public CodeVO findMenuCategory(String crNum, int name);
	
	public int selectCnt(String crNum, int name);
	
	public int insertMenuCategory(CodeVO cVO);
	
	public int updateMenuCategory(String crNum, int name, CodeVO cVO);
	
	public int deleteMenuCategory(String crNum, int name);
}

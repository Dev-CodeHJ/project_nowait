package ezen.nowait.member.mapper;

import ezen.nowait.member.domain.OwnerVO;

public interface OwnerMapper {

	public OwnerVO selectOwner(String ownerId);
	
	public int insertOwner(OwnerVO oVO);
	
	public int updateOwner(OwnerVO oVO);
	
	public int deleteOwner(String ownerId);
	
	public int idChk(String ownerId);
}

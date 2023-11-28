package ezen.nowait.member.service;

import ezen.nowait.member.domain.OwnerVO;

public interface OwnerService {

	public OwnerVO findOwner(String ownerId);
	
	public int addOwner(OwnerVO oVO);
	
	public int updateOwner(OwnerVO oVO);
	
	public int deleteOwner(String ownerId, String ownerPw);
	
	public int loginOwner(String ownerId, String ownerPw);
}

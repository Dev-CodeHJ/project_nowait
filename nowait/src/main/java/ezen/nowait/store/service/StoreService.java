package ezen.nowait.store.service;

import java.util.List;

import ezen.nowait.store.domain.StoreVO;

public interface StoreService {

	public List<StoreVO> findAll();
	
	public List<StoreVO> findByCategory(int storeCategory);
	
	public List<StoreVO> findByOwnerId(String ownerId);
	
	public StoreVO findByCrNum(String crNum);
	
	public int addStore(StoreVO sVO);
	
	public int addOwnerStore(String ownerId, String crNum, String secretCode);
	
	public int updateStore(StoreVO sVO);
	
	public int deleteStore(String crNum, String secretCode);
}

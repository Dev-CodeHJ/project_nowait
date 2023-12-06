package ezen.nowait.store.service;

import java.util.List;

import ezen.nowait.store.domain.StoreVO;

public interface StoreService {

	public List<StoreVO> findAll();
	
//	public List<StoreVO> findByCategory(int storeCategory);
	
	public List<StoreVO> findByOwnerId(String ownerId);
	
	public StoreVO findByCrNum(String crNum);
	
	public int addStore(StoreVO sVO);
	
	public int addOwnerStore(String ownerId, String crNum, String secretCode);
	
	public int updateStore(StoreVO sVO);
	
	//owner_store table에서 해당 가게정보를 가지고 있는 모든 사장에게서 가게 정보 삭제 후 해당 가게 정보 삭제
	public int deleteStore(String crNum, String secretCode);

	//해당 사장님의 가게 목록에서만 가게 정보 삭제
	public int deleteOwnerStoreOneByOwnerId(String ownerId, String crNum, String secretCode);
}

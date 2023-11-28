package ezen.nowait.store.mapper;

import java.util.List;

import ezen.nowait.store.domain.StoreVO;

public interface StoreMapper {

	public List<StoreVO> selectAll();
	
	public List<StoreVO> selectByCategory(int storeCategory);
	
	public List<StoreVO> selectByOwnerId(String ownerId);
	
	public StoreVO selectStoreByCrNum(String crNum);
	
	public int insertStore(StoreVO sVO);
	
	public int insertOwnerStore(String ownerId, String crNum, String secretCode);
	
	public int updateStore(StoreVO sVO);
	
	public int deleteStore(String crNum, String secretCode);
}

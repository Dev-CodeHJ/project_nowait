package ezen.nowait.store.mapper;

import java.util.List;
import java.util.Map;

import ezen.nowait.store.domain.StoreVO;

public interface StoreMapper {

	public List<StoreVO> selectAll();
	
//	public List<StoreVO> selectByCategory(int storeCategory);
	
	public List<StoreVO> selectByOwnerId(String ownerId);
	
	public StoreVO selectStoreByCrNum(String crNum);
	
	public int insertStore(StoreVO sVO);
	
//	public int insertOwnerStore(String ownerId, String crNum, String secretCode);
	public int insertOwnerStore(Map<String, Object> map);
	
	public int updateStore(StoreVO sVO);
	
	public int reviewSet(Map<String, Object>map);
	
//	public int updateOwnerStore(StoreVO sVO);
	
	//pk를 받아 store table에 있는 가게 정보 삭제
	public int deleteStore(String crNum);
	
	//모든 사장들에게서 동일 가게 정보 삭제, (deleteStore)실행 전에 실행돼야함
	public int deleteAllByCrNum(String crNum);
	
	//ownerId, crNum받아서 사장님 가게 목록의 선택한 가게 정보 삭제
	public int deleteOwnerStoreOneByOwnerId(Map<String, Object> map);
	
	//사장님이 등록한 모든 가게정보 사장님에게서만 삭제
	public int deleteAllByOwnerId(String ownerId);
}

package ezen.nowait.store.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.nowait.store.domain.StoreVO;
import ezen.nowait.store.mapper.StoreMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class StoreServiceImpl implements StoreService {

	@Setter(onMethod_ = @Autowired)
	private StoreMapper storeMapper;

	@Override
	public List<StoreVO> findAll() {
		log.info("findAll......");
		return storeMapper.selectAll();
	}

//	@Override
//	public List<StoreVO> findByCategory(int storeCategory) {
//		log.info("findByCategory......" + storeCategory);
//		return storeMapper.selectByCategory(storeCategory);
//	}

	@Override
	public List<StoreVO> findByOwnerId(String ownerId) {
		log.info("findByOwnerId......" + ownerId);
		return storeMapper.selectByOwnerId(ownerId);
	}

	@Override
	public StoreVO findByCrNum(String crNum) {
		log.info("findByCrNum......" + crNum);
		return storeMapper.selectStoreByCrNum(crNum);
	}

	@Override
	public int addStore(StoreVO sVO) {
		log.info("addStore......" + sVO);
		return storeMapper.insertStore(sVO);
	}

	@Override
	public int addOwnerStore(String ownerId, String crNum, String secretCode) {
		
		int result = 0;
		
		StoreVO sVO = storeMapper.selectStoreByCrNum(crNum);
		
		if(sVO.getCrNum() != null) {
			if(sVO.getSecretCode().equals(secretCode)) {
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("ownerId", ownerId);
				map.put("crNum", crNum);
				
				result = storeMapper.insertOwnerStore(map);
			} 
		} else {
			result = -1;
		}
		
		System.out.println("result : " + result);
		return result;
	}

	@Override
	public int updateStore(StoreVO sVO) {
		return storeMapper.updateStore(sVO);
	}

	@Override
	public int deleteStore(String crNum, String crNum2, String secretCode) {

		int result = 0;
		
		StoreVO sVO = storeMapper.selectStoreByCrNum(crNum);
		
		if(crNum.equals(crNum2)) {
			if(sVO.getSecretCode().equals(secretCode)) {
				
				result = storeMapper.deleteAllByCrNum(crNum2);

				if(result >= 1) {
					
					return storeMapper.deleteStore(crNum2);
				}
			} 
		} else {
			result = -1;
		}
		
		return result;
	}

	@Override
	public int deleteOwnerStoreOneByOwnerId(String ownerId, String crNum, String crNum2, String secretCode) {
		
		System.out.println("serviceImpl--------");
		
		int result = 0;
		
		StoreVO sVO = storeMapper.selectStoreByCrNum(crNum);
		
		System.out.println("crNum : " + sVO.getCrNum());
		System.out.println("secretCode : " + sVO.getSecretCode());
		
		if(crNum.equals(crNum2)) {
			if(sVO.getSecretCode().equals(secretCode)) {
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("ownerId", ownerId);
				map.put("crNum", crNum2);
				
				result = storeMapper.deleteOwnerStoreOneByOwnerId(map);
				
				System.out.println("result : " + result);
			} 
		} else {
			result = -1;
		}
		return result;
	}
}

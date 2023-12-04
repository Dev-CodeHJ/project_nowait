package ezen.nowait.store.service;

import java.util.List;

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

	@Override
	public List<StoreVO> findByCategory(int storeCategory) {
		log.info("findByCategory......" + storeCategory);
		return storeMapper.selectByCategory(storeCategory);
	}

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
		log.info("addOwnerStore......ownerId : " + ownerId);
		log.info("addOwnerStore......crNum : " + crNum);
		log.info("addOwnerStore......secretCode : " + secretCode);
		return storeMapper.insertOwnerStore(ownerId, crNum, secretCode);
	}

	@Override
	public int updateStore(StoreVO sVO) {
		log.info("updateStore......" + sVO);
		return storeMapper.updateStore(sVO);
	}

	@Override
	public int deleteStore(String crNum, String secretCode) {

		int result = storeMapper.deleteOwnerStore(crNum, secretCode);
		
		if(result >= 1) {
			return storeMapper.deleteStore(crNum);
		}
		return 0;
	}
	
	
}

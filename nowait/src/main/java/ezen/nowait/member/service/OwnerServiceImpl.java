package ezen.nowait.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.nowait.member.domain.OwnerVO;
import ezen.nowait.member.mapper.OwnerMapper;
import ezen.nowait.store.mapper.StoreMapper;
import ezen.nowait.store.service.StoreService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class OwnerServiceImpl implements OwnerService{
	
	@Setter(onMethod_ = @Autowired)
	private OwnerMapper ownerMapper;
	
	@Setter(onMethod_ = @Autowired)
	private StoreMapper storeMapper;
	
	@Override
	public OwnerVO findOwner(String ownerId) {
		log.info("findOwner............." + ownerId);
		OwnerVO oVO = ownerMapper.selectOwner(ownerId);
		return oVO;
	}

	@Override
	public int addOwner(OwnerVO oVO) {
		log.info("addOwner............." + oVO);
		return ownerMapper.insertOwner(oVO);
	}

	@Override
	public int updateOwner(OwnerVO oVO) {
		log.info("updateOwner............." + oVO);
		return ownerMapper.updateOwner(oVO);
	}

	@Override
	public int deleteOwner(String ownerId, String ownerPw) {
		log.info("deleteOwner............." + ownerId);
		log.info("deleteOwner............." + ownerPw);
		OwnerVO oVO = ownerMapper.selectOwner(ownerId);
		if(oVO != null) {
			
			if(oVO.getOwnerPw().equals(ownerPw)) {
			
				int result = storeMapper.deleteAllByOwnerId(ownerId);
				if(result >= 1) {
					
					return ownerMapper.deleteOwner(ownerId);
				}
			}
		}
		return 0;
	}

	@Override
	public int loginOwner(String ownerId, String ownerPw) {
		
		log.info("loginOwner............." + ownerId);
		log.info("loginOwner............." + ownerPw);
		
		OwnerVO oVO = ownerMapper.selectOwner(ownerId);
		
		if(oVO != null) {
			log.info("ownerId is not null.........");
			if(oVO.getOwnerPw().equals(ownerPw)) {
				log.info("login success.........");
				return 1;
			}
			log.info("login fail...pw different");
			return 0;
		}
		log.info("ownerId is null.........");
		return -1;
	}

	@Override
	public int idChk(String ownerId) {
		return ownerMapper.idChk(ownerId);
	}
	
}

package ezen.nowait.store.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ezen.nowait.store.domain.StoreVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class StoreMapperTests {

	@Setter(onMethod_ = @Autowired)
	private StoreMapper storeMapper;
	
	@Test
	public void testInsert() {
		StoreVO sVO = new StoreVO();
		sVO.setCrNum("52153-253-27");
		sVO.setStoreName("야래향");
		sVO.setStoreCategory(3);
		sVO.setStoreAddr("수원시 팔달구");
		sVO.setStoreTel(null);
		sVO.setStoreEmail("");
		sVO.setOpentime("09:00-22:30");
		sVO.setStoreInfo("탕수육이 맛있는 야래향");
		storeMapper.insertStore(sVO);
		log.info(sVO);
	}
	
	@Test
	public void testSelectAll() {
		log.info(storeMapper.selectAll());
	}
	
	@Test
	public void testSelectOne() {
		StoreVO sVO = storeMapper.selectStoreByCrNum("52153-253-27");
		log.info(sVO);
	}
	
	@Test
	public void testSelectByOwnerId() {
		List<StoreVO> list = storeMapper.selectByOwnerId("");
		log.info(list);
	}
}

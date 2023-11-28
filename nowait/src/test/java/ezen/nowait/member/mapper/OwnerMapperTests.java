package ezen.nowait.member.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ezen.nowait.member.domain.OwnerVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OwnerMapperTests {

	@Setter(onMethod_ = @Autowired)
	private OwnerMapper ownerMapper;
	
//	@Test
//	public void testInsert() {
//		OwnerVO oVO = new OwnerVO();
//		oVO.setOwnerId("asd");
//		oVO.setOwnerPw("123");
//		oVO.setOwnerName("bigboss");
//		oVO.setOwnerBirth(null);
//		oVO.setOwnerPhone("010-1234-5678");
//		oVO.setOwnerEmail(null);
//		ownerMapper.insertOwner(oVO);
//		log.info(oVO);
//	}
	
	@Test
	public void testselectOwner() {
		OwnerVO oVO = ownerMapper.selectOwner("asd");
		log.info(oVO);
	}
	
//	@Test
//	public void testupdateOwner() {
//		OwnerVO oVO = new OwnerVO();
//		oVO.setOwnerId("aa");
//		oVO.setOwnerPw("a1234");
//		oVO.setOwnerName("update");
//		oVO.setOwnerBirth("231128");
//		oVO.setOwnerPhone("010-1111-2222");
//		oVO.setOwnerEmail("abc@def.com");
//		ownerMapper.updateOwner(oVO);
//		log.info(oVO);
//	}
	
//	@Test
//	public void testdeleteOwner() {
//		log.info(ownerMapper.deleteOwner("asd"));
//	}
}

package org.final_proj.mapper;

import java.util.List;

import org.final_proj.domain.AdminVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class PwdMapperTests {
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder bc;
	
	@Test
	public void allOrderlist() {
		List<AdminVO> vo = null;
		vo = mapper.orderlist();
		log.info(vo);
	}
	
	@Test
	public void pwdTest() {
		mapper.findPwd("yyyyu01", "김유림", "rrim3246@gamil.com", bc.encode("abc"));
	}

	

}

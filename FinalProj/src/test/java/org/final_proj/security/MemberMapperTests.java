package org.final_proj.security;

import org.final_proj.domain.AuthVO;
import org.final_proj.domain.MemberVO;
import org.final_proj.mapper.MemberMapper;
import org.final_proj.service.MemberService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberMapperTests {

	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private MemberService service;


	//Mapper Test vo에 담은 db user1의 정보를 불러 올 수 있는가?
	@Test
	public void testRead() {

		MemberVO vo = mapper.read("test0000");

		log.info(vo);

		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}

	@Test
	public void testInsert() {
		MemberVO member = new MemberVO();

		member.setUserId("new11");
		member.setUserId("new11");
		member.setRePwd("new11");
		member.setUserName("new member11");
		member.setMailAddress("new11mem@naver.com");
		member.setAddress("new11 address");
		
		mapper.insert(member);
		
		log.info(member);
		

	}
	@Test
	public void testInsertAuth() {
		AuthVO auth = new AuthVO();
		auth.setAuthority("ROLE_ADMIN");
		auth.setUserId("new11");	
		mapper.authinsert(auth);
		log.info(auth);
		
	}


}

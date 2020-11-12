package org.final_proj.service;

import org.final_proj.domain.AuthVO;
import org.final_proj.domain.MemberVO;
import org.final_proj.service.MemberService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTest {

	@Setter(onMethod_ = {@Autowired})
	private MemberService service;
	
	@Test
	public void testRegister() {
		MemberVO member = new MemberVO();
		AuthVO auth = new AuthVO();

		member.setUserId("new13");
		member.setUserPwd("new12");
		member.setRePwd("new12");
		member.setUserName("new member12");
		member.setMailAddress("new12mem@naver.com");
		member.setAddress("new12 address");
		auth.setAuthority("ROLE_ADMIN");
		auth.setUserId("new13");	
		
		try {
			service.register(member, auth);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//
		
		log.info(member);
		

	}
	
	@Test
	public void testRegisterMember() {
		MemberVO member = new MemberVO();
		//AuthVO auth = new AuthVO();

		member.setUserId("new13");
		member.setUserPwd("new12");
		member.setRePwd("new12");
		member.setUserName("new member12");
		member.setMailAddress("new12mem@naver.com");
		member.setAddress("new12 address");
		//auth.setAuthority("ROLE_ADMIN");
	//	auth.setUserId("new13");	
		
		try {
			service.registerMember(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//
		
		log.info(member);
		

	}

}

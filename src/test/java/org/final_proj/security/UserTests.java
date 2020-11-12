package org.final_proj.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class UserTests {
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder passwordEncoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;
	
	@Test
	public void testInsertUser() {
		String sql ="INSERT INTO proj_user (user_id, user_pwd, user_name, address, phone, email)"
				+ " VALUES ('user0000', ?, '공영영', '경상북도 울릉군', '010-0000-0000', '000@naver.com')";
		try {
			Connection co = dataSource.getConnection();
			PreparedStatement ps = co.prepareStatement(sql);
			ps.setString(1, passwordEncoder.encode("0000"));
			ps.executeUpdate();
			
		} catch(Exception e) {
			e.getMessage();
		}
		
	}
}

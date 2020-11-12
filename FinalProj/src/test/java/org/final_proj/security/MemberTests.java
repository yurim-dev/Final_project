package org.final_proj.security;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.final_proj.domain.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class MemberTests {
			
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwdencoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	@Test
	public void testInsertMember() {
		
		
		String sql = "insert into final_member(userId, userPwd, rePwd, userName, mailaddress, address) values (?,?,?,?,?,?)";
	
			Connection con = null;
			PreparedStatement pstmt = null;
			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				for(int i=0; i<3; i++) {
					
					pstmt.setString(1, "user"+i);
					pstmt.setString(2, pwdencoder.encode("pwd"+i));
					pstmt.setString(3, pwdencoder.encode("pwd"+i));
					pstmt.setString(4, "user"+i);
					pstmt.setString(5, "user"+i+"@naver.com");
					pstmt.setString(6, "address"+i);
					
					pstmt.executeUpdate();
				}//end for

			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) { try { pstmt.close(); } catch(Exception e){} }
				if(con != null) { try { con.close(); } catch(Exception e){} }
			}//end finally



	} //end test
	
	@Test
	public void testInsertAuth() {
		
		
		String sql = "insert into final_auth values (?,?)";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			for(int i=0; i<3; i++) {
				
				if(i==0) {
					pstmt.setString(1, "user"+i);
					pstmt.setString(2, "ROLE_ADMIN");
				}else if(i==1) {
					pstmt.setString(1, "user"+i);
					pstmt.setString(2, "ROLE_MEMBER");
				}else {
					pstmt.setString(1, "user"+i);
					pstmt.setString(2, "ROLE_USER");
				}
				
				pstmt.executeUpdate();
			}//end for

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e){} }
			if(con != null) { try { con.close(); } catch(Exception e){} }
		}//end finally

	} //end test
	
	@Test
	public void testInsertnew() {
		
		
		String sql= "insert into final_member(userId, userPwd, rePwd, userName, mailAddress, address) values (?,?,?,?,?,?)";
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "conan2");
			pstmt.setString(2, pwdencoder.encode("pwd"));
			pstmt.setString(3, pwdencoder.encode("pwd"));
			pstmt.setString(4, "conan1");
			pstmt.setString(5, "conan1@naver.com");
			pstmt.setString(6, "conan1's home");
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e){} }
			if(con != null) { try { con.close(); } catch(Exception e){} }
		}//end finally

	} //end test
}
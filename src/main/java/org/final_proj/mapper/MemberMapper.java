package org.final_proj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.final_proj.domain.AdminVO;
import org.final_proj.domain.AuthVO;
import org.final_proj.domain.CartDTO;
import org.final_proj.domain.MemberVO;
import org.final_proj.domain.deOrderVO;


public interface MemberMapper {
		public MemberVO read(String userId);
		
		public MemberVO login(String userId);
		
		public void insert(MemberVO member);
		
		public void authinsert(AuthVO auth);
		
		public String findId(@Param("findName") String findname, @Param("findMail") String findmail);
		
		public int idCheck(MemberVO vo);
		
		public void updatemyinfo(MemberVO vo);
		
		int findPwd(String findid, String findname, String findmail, String key);
		
		//public void findPwd(String findid, String findname, String findmail, String key);
		
		public void deleteorder(deOrderVO order);
		
		public void deletecart(CartDTO dto);
		
		public void deleteauth(AuthVO auth);
		
		public int deletemember(MemberVO vo);
		
		public int pwdCheck(MemberVO vo);
		
		public List<MemberVO> allmember();
		
		public List<AdminVO> orderlist();
		


}

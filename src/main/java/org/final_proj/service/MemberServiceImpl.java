package org.final_proj.service;

import org.final_proj.domain.AuthVO;
import org.final_proj.domain.CartDTO;
import org.final_proj.domain.MemberVO;
import org.final_proj.domain.OrderVO;
import org.final_proj.domain.deOrderVO;
import org.final_proj.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Override
	public void registerMember(MemberVO vo) throws Exception {
		
		System.out.println("insert vo");
		memberMapper.insert(vo);
	}

	@Transactional
	@Override
	public void register(MemberVO vo, AuthVO auth) throws Exception {	
		
		
		System.out.println("암호화 되기 전 : "+vo.getUserPwd());
		vo.setUserPwd(bcryptPasswordEncoder.encode(vo.getUserPwd()));
		vo.setRePwd(bcryptPasswordEncoder.encode(vo.getRePwd()));
		System.out.println("암호화 된 후 : "+vo.getUserPwd());
		System.out.println("insert vo");
		memberMapper.insert(vo);
		
		
		System.out.println("insert auth");
		memberMapper.authinsert(auth);

		
		System.out.println("end insert");
		
	}

	@Override
	public String findid(String findname, String findmail) {
			String findid = "";
			
			findid = memberMapper.findId(findname, findmail);
			System.out.println("Find ID :"+"========"+findid+"=========");
			return findid;
		
	}

	@Override
	public int idCheck(MemberVO vo) throws Exception {
		int result = memberMapper.idCheck(vo);
		return result;
	}

	@Override
	public void updatemyinfo(MemberVO vo) throws Exception {
		System.out.println("update my info: "+vo);
		vo.setUserPwd(bcryptPasswordEncoder.encode(vo.getUserPwd()));
		vo.setRePwd(bcryptPasswordEncoder.encode(vo.getRePwd()));
		memberMapper.updatemyinfo(vo);
		
	}



	@Override
	public void deleteauth(AuthVO auth) throws Exception {
		System.out.println("delete auth");
		memberMapper.deleteauth(auth);
		
	}
	@Override
	public void deletecart(CartDTO dto) throws Exception {
		log.info("delete cart");
		memberMapper.deletecart(dto);
		
	}
	@Override
	public void deleteorder(deOrderVO order) throws Exception {
		log.info("delete order");
		memberMapper.deleteorder(order);
	}

	@Override
	public void deletemember(MemberVO vo) throws Exception {
		System.out.println("delete member");
		memberMapper.deletemember(vo);
	}

	@Override
	public MemberVO login(String userId) throws Exception {
		MemberVO userInfo = memberMapper.login(userId);
		return userInfo;
	}

	@Override
	public int pwdCheck(MemberVO vo) throws Exception {
		System.out.println("pwd service:"+vo);
		vo.setUserPwd(vo.getUserPwd());
		int result = memberMapper.pwdCheck(vo);
		return result;
	}





}

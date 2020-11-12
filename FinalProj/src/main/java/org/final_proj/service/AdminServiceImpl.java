package org.final_proj.service;

import java.util.List;

import org.final_proj.domain.AdminVO;
import org.final_proj.domain.MemberVO;
import org.final_proj.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;


	
	
	@Override
	public List<MemberVO> allmember() throws Exception {
		return memberMapper.allmember();
	}

	@Override
	public List<AdminVO> orderlist() throws Exception {
		
		log.info("service userID: "+memberMapper.orderlist().get(0).getUserId());
		return memberMapper.orderlist();
		
	}

}

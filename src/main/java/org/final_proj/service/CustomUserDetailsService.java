package org.final_proj.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.final_proj.domain.MemberVO;
import org.final_proj.mapper.MemberMapper;
import org.final_proj.service.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;

@Log4j
@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;
	
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		
		log.warn("Load User By UserName : "+ userName);
		
		//userName means userid
		MemberVO vo = memberMapper.read(userName);
		
		log.warn("queried by member mapper: "+ vo);
		
		return vo == null ? null : new CustomUser(vo);
	}

}
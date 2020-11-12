package org.final_proj.service;

import java.util.List;

import org.final_proj.domain.AdminVO;
import org.final_proj.domain.MemberVO;

public interface AdminService {

	public List<MemberVO> allmember() throws Exception;
	public List<AdminVO> orderlist() throws Exception;
}

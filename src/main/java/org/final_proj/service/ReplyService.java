package org.final_proj.service;

import java.util.List;

import org.final_proj.domain.Criteria;
import org.final_proj.domain.ReplyPageDTO;
import org.final_proj.domain.ReplyVO;

public interface ReplyService {

	
	public int register(ReplyVO vo);
	
	public ReplyVO get (Long rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long rno);
	
	public List<ReplyVO> getList(Criteria cri, Long bno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
}

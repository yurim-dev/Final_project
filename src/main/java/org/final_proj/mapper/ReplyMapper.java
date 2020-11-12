package org.final_proj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.final_proj.domain.Criteria;
import org.final_proj.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long bno);
	
	public int delete(Long targetRno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	
	public int getCountByBno(Long bno);
	
	
	
	
}

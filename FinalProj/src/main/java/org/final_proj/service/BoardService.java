package org.final_proj.service;

import java.util.List;

import org.final_proj.domain.BoardAttachVO;
import org.final_proj.domain.BoardVO;
import org.final_proj.domain.Criteria;

public interface BoardService {

	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getList(Criteria cri);

	public int getTotal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(Long bno);

}

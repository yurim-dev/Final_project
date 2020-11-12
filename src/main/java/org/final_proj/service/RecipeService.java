package org.final_proj.service;

import java.util.List;

import org.final_proj.domain.RecipeVO;
import org.final_proj.domain.SearchDTO;

public interface RecipeService {
	public RecipeVO getDetail(Long id);
	public List<RecipeVO> getList();
}

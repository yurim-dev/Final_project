package org.final_proj.service;

import java.util.List;

import org.final_proj.domain.RecipeVO;
import org.final_proj.domain.SearchDTO;
import org.final_proj.mapper.RecipeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class RecipeServiceImpl implements RecipeService {
	@Setter(onMethod_ = @Autowired)
	private RecipeMapper mapper;
	
	@Override
	public RecipeVO getDetail(Long id) {
		log.info(id +"번 레시피 불러오기---------------------------------------------------");
		return mapper.getDetail(id);
	}

	@Override
	public List<RecipeVO> getList() {
		log.info("목록 불러오기---------------------------------------------------------------");
		return mapper.getList();
	}
	
}

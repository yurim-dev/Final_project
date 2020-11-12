package org.final_proj.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.final_proj.domain.GoodsVO;
import org.final_proj.domain.SearchDTO;
import org.final_proj.mapper.RecommendMapper;
import org.final_proj.mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class RecommendServiceImpl implements RecommendService {
	@Setter(onMethod_ = @Autowired)
	private RecommendMapper mapper;

	@Override
	public HashSet<GoodsVO> getIngredient(SearchDTO search) {
		log.info("추천 식재료 가져오기-----------------------------------------------");
		return mapper.getIngredient(search);
	}

	@Override
	public HashSet<GoodsVO> getMealKit(SearchDTO search) {
		log.info("추천 밀키트 가져오기-----------------------------------------------");
		return mapper.getMealkit(search);
	}
}

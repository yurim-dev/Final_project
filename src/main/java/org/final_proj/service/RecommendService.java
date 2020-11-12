package org.final_proj.service;

import java.util.HashMap;
import java.util.HashSet;

import org.final_proj.domain.GoodsVO;
import org.final_proj.domain.SearchDTO;

public interface RecommendService {
	// 키워드를 포함한 식재료를 가져옴
	public HashSet<GoodsVO> getIngredient (SearchDTO search);
	
	// 키워드를 포함한 밀키트를 가져옴
	public HashSet<GoodsVO> getMealKit (SearchDTO search);
}

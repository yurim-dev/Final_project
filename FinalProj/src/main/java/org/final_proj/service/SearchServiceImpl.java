package org.final_proj.service;

import java.util.List;

import org.final_proj.domain.RecipeVO;
import org.final_proj.domain.SearchDTO;
import org.final_proj.mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class SearchServiceImpl implements SearchService{
	@Setter(onMethod_ = @Autowired)
	private SearchMapper mapper;
	
	
	@Override
	public List<RecipeVO> getSearch(SearchDTO query) {
		log.info("검색 결과 불러오기----------------------------------------------------------");
		return mapper.getResult(query);
	}


	@Override
	public List<String> searchWay(SearchDTO query) {
		log.info("검색 결과에서 방법 키워드만 가져오기-------------------------------------------------");
		return mapper.searchWay(query);
	}

	@Override
	public List<String> searchKind(SearchDTO query) {
		log.info("검색 결과에서 요리 종류 키워드만 가져오기--------------------------------------------");
		return mapper.searchKind(query);
	}


	@Override
	public List<RecipeVO> searchFilteredResult(SearchDTO query) {
		log.info("검색 결과 필터링해서 가져오기------------------------------------------------------");
		return mapper.getFilteredResult(query);
	}
}

package org.final_proj.service;

import java.util.*;

import org.final_proj.domain.RecipeVO;
import org.final_proj.domain.SearchDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


public interface SearchService {
	// 검색 결과 출력
	public List<RecipeVO> getSearch(SearchDTO query);
	
	// 검색 결과에서 방법 키워드만 가져옴
	public List<String> searchWay(SearchDTO query);

	// 검색 결과에서 종류 키워드만 가져옴
	public List<String> searchKind(SearchDTO query);

	// 검색 결과를 키워드로 필터링한 후 가져옴
	public List<RecipeVO> searchFilteredResult(SearchDTO query);
}

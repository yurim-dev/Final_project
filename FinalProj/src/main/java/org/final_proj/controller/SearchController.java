/** 검색 결과를 담당하는 REST 방식 컨트롤러
 * REST 방식: view(html 페이지)를 반환하는게 아닌 데이터(JSON 형식)만 반환함
 *
 */

package org.final_proj.controller;

import java.util.List;

import org.final_proj.domain.RecipeVO;
import org.final_proj.domain.SearchDTO;
import org.final_proj.service.SearchService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@RestController
@RequestMapping("/search/*")
@Log4j
@AllArgsConstructor
public class SearchController {
	private SearchService service;
	// 필터링을 적용하지 않은 검색 결과를 출력함
	@GetMapping(value="/result", produces = "application/json;charset=UTF-8")
	public ResponseEntity<List<RecipeVO>> getSearchResult (@RequestParam("type") String type, @RequestParam("query") String query) {
		log.info("search--------------------------------------------------------");
		SearchDTO search = new SearchDTO();
		search.setType(type);
		search.setQuery(query);
		log.info(search);
		return new ResponseEntity<>(service.getSearch(search), HttpStatus.OK);
	}
	
	// 필터링할 키워드를 출력함
	@GetMapping(value="/kind", produces = "application/json;charset=UTF-8")
	public ResponseEntity<List<String>> getKind (@RequestParam("type") String type, @RequestParam("query") String query) {
		log.info("get Kind--------------------------------------------------------");
		SearchDTO search = new SearchDTO();
		search.setType(type);
		search.setQuery(query);
		log.info(search);
		return new ResponseEntity<>(service.searchKind(search), HttpStatus.OK);
	}
	
	// 필터링할 키워드를 출력함
	@GetMapping(value="/way", produces = "application/json;charset=UTF-8")
	public ResponseEntity<List<String>> getWay (@RequestParam("type") String type, @RequestParam("query") String query) {
		log.info("get Way--------------------------------------------------------");
		SearchDTO search = new SearchDTO();
		search.setType(type);
		search.setQuery(query);
		log.info(search);
		return new ResponseEntity<>(service.searchWay(search), HttpStatus.OK);
	}
	
	// 필터링을 적용한 검색 결과를 출력함
	@GetMapping(value="/filter", produces = "application/json;charset=UTF-8")
	public ResponseEntity<List<RecipeVO>>getFilteredResult (@RequestParam("type") String type, 
			@RequestParam("query") String query, @RequestParam("filter") String filter,
			@RequestParam("keyword") String keyword) { 
		log.info("filtered results---------------------------------------------------------------------");
		SearchDTO search = new SearchDTO();
		search.setType(type);
		search.setQuery(query);
		search.setFilter(filter);
		search.setFilterWord(keyword);
		return new ResponseEntity<>(service.searchFilteredResult(search), HttpStatus.OK);
	}
}

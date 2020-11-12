/** 추천 상품을 출력하는 REST 방식의 컨트롤러
 * 
 * */
package org.final_proj.controller;

import java.util.*;

import org.final_proj.domain.GoodsVO;
import org.final_proj.domain.ReqBodyDTO;
import org.final_proj.domain.SearchDTO;
import org.final_proj.service.RecommendService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/recommend/*")
@Log4j
@AllArgsConstructor
public class RecommendController {
	private RecommendService service;

	// 1. 받아온 문자열을 잘라서 문자열 배열로 만듦.
	// 2. 문자열을 포함한 상품을 가져와서 리스트에 넣음.
	// 3. JSON 형식으로 출력함

	@PostMapping(value="/ingredient", produces= "application/json;charset=UTF-8")
	public ResponseEntity<HashSet<GoodsVO>> getRecIngre(@RequestBody ReqBodyDTO reqbody) {
		// 매개변수 길이 제한 때문에 RequestParam 대신 RequestBody로 받을 것
		log.info(">>>>>>> 문자열 도착: " + reqbody.getStr());
		reqbody.setStr(reqbody.getStr().replace("\n", " "));
		reqbody.setStr(reqbody.getStr().replace("\'", " "));
		reqbody.setStr(reqbody.getStr().replace("\"", " "));
		reqbody.setStr(reqbody.getStr().replace("\t", " "));
		log.info(">>>>>> 문자열 치환 결과: " + reqbody.getStr());
		StringTokenizer token = new StringTokenizer(reqbody.getStr()); 

		HashSet<GoodsVO> recommendGoods = new HashSet<GoodsVO>();
		SearchDTO search = new SearchDTO();
		
		// 검색
		while(token.hasMoreTokens()) {
			String tmpToken = token.nextToken();
			log.info(tmpToken);
			search.setQuery(tmpToken);
			recommendGoods.addAll(service.getIngredient(search));
		}
		return new ResponseEntity<>(recommendGoods, HttpStatus.OK);
	}

}

/** 
 * 레시피(recipe)에 관한 것을 담당하는 컨트롤러
 * 기능: 검색, 상세보기, 검색 결과 필터링
 */
package org.final_proj.controller;
//누가무엇때문에 수정햇음 최종수정일 추가된 내용들 
import java.util.List;

import org.final_proj.domain.GoodsVO;
import org.final_proj.domain.RecipeVO;
import org.final_proj.domain.SearchDTO;
import org.final_proj.service.GoodsService;
import org.final_proj.service.RecipeService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// /recipe가 들어가는 주소는 모두 이 컨트롤러로 옴
@Controller
@Log4j
@RequestMapping("/recipe/*")
@AllArgsConstructor
public class RecipeController {
	private RecipeService service;
	private GoodsService gService;

	// **검색 결과를 표시함
	// 파라미터 전달 받아야함
	// 리다이렉트할 게 없으므로 void임
	
	
	// 레시피의 상세 정보를 출력함
	// pathvariable로 바꿀 것
	@GetMapping("/detail")
	@PreAuthorize("isAuthenticated()") 
	public void getDetail(@RequestParam Long rcp_seq, Model model) {
		log.info("detail-id: " + rcp_seq + "----------------------------------");
		RecipeVO vo = service.getDetail(rcp_seq);
		model.addAttribute("recipe", vo);
		String ingre = vo.getRcp_dtls();
		List<GoodsVO> gList = gService.goodsList(ingre); // 
		log.info("상품이름: "+gList);
		model.addAttribute("gList",gList);
		//log.info("상품이름: "+gList.get(0).getGoodsName());
		
		
		
	}
	
	// 검색 페이지를 출력하고 검색어를 searchController로 넘김
	@GetMapping("/search")
	public void getSearch(@RequestParam("type") String type, @RequestParam("query") String query, Model model) {
		log.info("검색 - 타입: " + type + "검색어: " + query);
		SearchDTO search = new SearchDTO();
		search.setQuery(query);
		search.setType(type);
		model.addAttribute("query", query);
		model.addAttribute("type", type);
		model.addAttribute("search", search);
	}
	
//	// 상품 추천 시스템 테스트용 메소드
//	@RequestMapping("/recTest")
//	public void recommendTest(@RequestParam("rcp_seq") Long rcp_seq, Model model) {
//		// 재료 출력
//		log.info("●테스트용 : "+rcp_seq + "번 출력----------------------------------------");
//		String ingredient = service.getDetail(rcp_seq).getRcp_parts_dtls();
//		model.addAttribute("ingredient", ingredient);
//	}
	

}

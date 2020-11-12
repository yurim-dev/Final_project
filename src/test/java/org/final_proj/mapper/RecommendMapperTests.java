package org.final_proj.mapper;

import java.util.*;

import org.final_proj.domain.GoodsVO;
import org.final_proj.domain.SearchDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class RecommendMapperTests {
	@Setter(onMethod_ = @Autowired)
	private RecommendMapper mapper;


	/*
	 * @Test public void getIngredientTest() { SearchDTO search = new SearchDTO();
	 * search.setQuery("당근"); List<GoodsVO> gl = mapper.getIngredient(search);
	 * gl.forEach(goods -> log.info(goods)); }
	 * 
	 * @Test public void getMealkitTest () { SearchDTO search = new SearchDTO();
	 * search.setQuery("칼국수"); List<GoodsVO> gl = mapper.getMealkit(search);
	 * gl.forEach(goods -> log.info(goods)); }
	 * 
	 * @Test public void 재료_추천_테스트() { SearchDTO search = new SearchDTO(); String
	 * str = "옥수수 물 당근"; StringTokenizer token = new StringTokenizer(str, "\n ");
	 * HashSet<GoodsVO> gSet = new HashSet<GoodsVO>(); while(token.hasMoreTokens())
	 * { String keyword = token.nextToken(); search.setQuery(keyword);}
	 * mapper.getIngredient(search); log.info("재료 추천 테스트 결과: "); }
	 */
	
	@Test
	public void 재료_추천_테스트() {
		HashSet<GoodsVO> goodsSet = new HashSet<GoodsVO>();
		// 1. 유튜브 영상 설명을 문자열로 받아옴
		String str = "재료\r\n" + 
				": 계란 5개 / 밥은 국그릇만큼 / 김밥김\r\n" + 
				"\r\n" + 
				"밥 배합초\r\n" + 
				": 설탕 1스푼 + 식초 2스푼 + 소금 조금\r\n" + 
				"\r\n" + 
				"계란 간하기\r\n" + 
				": 설탕 1스푼 + 우유 5스푼 + 소금 조금\r\n" + 
				"\r\n" + 
				"만들기\r\n" + 
				"1. 밥에 배합초 섞고 식혀서 하나씩 뭉쳐둔다 (손에 물 묻혀서 하면 밥이 안들러붙고 좋음)\r\n" + 
				"2. 팬에 식용유 넣고 키친타올로 닦는다\r\n" + 
				"3. 약불에 계란물 2국자 넣고 익을동 말동 할때 말기 시작한다\r\n" + 
				"(다 익어버리면 말기힘듦!)\r\n" + 
				"4. 다 만든 계란말이는 한 김 식히고 밥 갯수에 맞게 썬다\r\n" + 
				"5. 밥, 계란을 김밥김으로 두른다\r\n" + 
				"6. 취향에 맞게 고추냉이, 간장 등을 곁들여 먹는다";
		// 2. 문자열의 특수문자를 전부 공백으로 치환함
		str = str.replace('\r', ' ');
		str = str.replace('\n', ' ');
		str = str.replace(',', ' ');
		str = str.replace('.', ' ');
		str = str.replace('\'', ' ');
		str = str.replace('\"', ' ');
		str = str.replace('!', ' ');
		str = str.replace('(', ' ');
		str = str.replace(')', ' ');
		str = str.replace('?', ' ');
		str = str.replace('+', ' ');
		str = str.replace('-', ' ');
		str = str.replace(':', ' ');
		str = str.replace('/', ' ');
		//log.info(str);
		// 3. 문자열을 StringTokenizer를 이용해 공백을 기준으로 다 잘라서 String 토큰으로 만듦
		StringTokenizer token = new StringTokenizer(str);
		/*
		 * while (token.hasMoreElements()) { System.out.println(token.nextToken()); }
		 */
		// 4. 토큰과 데이터베이스의 식재료를 비교해 포함하는 문자열이 있으면 가져옴
		while (token.hasMoreElements()) {
			SearchDTO query = new SearchDTO();
			query.setQuery(token.nextToken());
			goodsSet.addAll(mapper.getIngredient(query));
		}
		// 5. HashSet에 add 시킴
		
		// 6. 출력
		log.info("▶결과: " + goodsSet);
	}
}

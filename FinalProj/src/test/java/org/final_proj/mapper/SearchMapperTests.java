package org.final_proj.mapper;

import java.util.List;

import org.final_proj.domain.RecipeVO;
import org.final_proj.domain.SearchDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SearchMapperTests {
	@Setter(onMethod_ = @Autowired)
	private SearchMapper mapper;
	
	@Test
	public void testSearchRecipe() {
		SearchDTO query = new SearchDTO();
		query.setQuery("당근");
		query.setType("I");
		List <RecipeVO> l = mapper.getResult(query);
		
		l.forEach(r -> log.info(r));
	}
	
	@Test
	public void testGetKind() {
		SearchDTO query = new SearchDTO();
		query.setQuery("당근");
		query.setType("I");
		List <String> kl = mapper.searchKind(query);
		kl.forEach(k -> log.info(k));
	}
	
	@Test
	public void testGetWay() {
		SearchDTO query = new SearchDTO();
		query.setQuery("당근");
		query.setType("I");
		List <String> wl = mapper.searchKind(query);
		wl.forEach(w -> log.info(w));
	}
	
	@Test
	public void testFilteredResult() {
		SearchDTO query = new SearchDTO();
		query.setQuery("당근");
		query.setType("I");
		query.setFilter("k");
		query.setFilterWord("후식");
		List <RecipeVO> l = mapper.getFilteredResult(query);
		
		l.forEach(r -> log.info(r));
	}
}

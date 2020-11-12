package org.final_proj.service;

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
public class SearchServiceTests {
	@Setter(onMethod_ = @Autowired)
	private SearchService service;
	
	@Test
	public void testSearchResult() {
		SearchDTO query = new SearchDTO();
		query.setQuery("후식");
		query.setType("K");
		service.getSearch(query).forEach(result -> log.info(result));
	}
	
	@Test
	public void testSearchWay() {
		SearchDTO query = new SearchDTO();
		query.setQuery("당근");
		query.setType("I");
		service.searchWay(query).forEach(result -> log.info(result));
	}
	
	@Test
	public void testSearchKind() {
		SearchDTO query = new SearchDTO();
		query.setQuery("당근");
		query.setType("I");
		service.searchKind(query).forEach(result -> log.info(result));
	}
	
	@Test
	public void testFilterResult () {
		SearchDTO query = new SearchDTO();
		query.setQuery("당근");
		query.setType("I");
		query.setFilter("k");
		query.setFilterWord("후식");
		service.searchFilteredResult(query).forEach(result -> log.info(result));
	}
}

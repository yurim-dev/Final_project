package org.final_proj.mapper;

import java.util.List;

import org.final_proj.domain.Criteria;
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
public class RecipeMapperTests {
	@Setter(onMethod_ = @Autowired)
	private RecipeMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(recipe -> log.info(recipe));
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		// 3개 씩 2 페이지
		cri.setPageNum(1);
		cri.setAmount(5);
		List<RecipeVO> list = mapper.getListWithPaging(cri);
		list.forEach(recipe -> log.info(recipe.getId()));
	}
	 

}

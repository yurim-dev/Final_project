package org.final_proj.service;

import java.util.List;

import org.final_proj.domain.ChannelVO;
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
public class VideoServiceTests {
	@Setter(onMethod_ = @Autowired)
	private VideoService service;
	
	@Test 
	public void getChannelTest () {
		service.getChannel().forEach(cList -> log.info(cList));
	}
}

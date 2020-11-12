package org.final_proj.mapper;

import java.util.*;

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
public class VideoMapperTests {
	@Setter(onMethod_ = @Autowired)
	private VideoMapper mapper;
	
	@Test
	public void getChannelTest () {
		List<ChannelVO> cList = mapper.getChannels();
		cList.forEach(channel -> log.info(channel));
	}
}

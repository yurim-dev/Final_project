package org.final_proj.service;

import java.util.List;

import org.final_proj.domain.ChannelVO;
import org.final_proj.mapper.RecipeMapper;
import org.final_proj.mapper.VideoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class VideoServiceImpl implements VideoService {
	@Setter(onMethod_ = @Autowired)
	private VideoMapper mapper;
	
	@Override
	public List<ChannelVO> getChannel() {
		return mapper.getChannels();
	}

}

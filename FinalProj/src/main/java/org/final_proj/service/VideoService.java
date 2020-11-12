package org.final_proj.service;

import java.util.*;

import org.final_proj.domain.ChannelVO;

public interface VideoService {
	// 모든 채널을 출력함
	public List<ChannelVO> getChannel();
}

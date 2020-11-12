/** 유튜브 재생 목록을 출력하는 맵퍼
 * */
package org.final_proj.mapper;

import java.util.*;

import org.final_proj.domain.ChannelVO;

public interface VideoMapper {
	public List<ChannelVO> getChannels();
}

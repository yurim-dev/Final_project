/** 요리비책(video) 페이지를 담당하는 컨트롤러
 * 실제 데이터는 자바스크립트 코드에서 가져오므로 사실상의 기능은 페이지 이동 밖에 없음 
 * 
 */
package org.final_proj.controller;

import java.util.List;

import org.final_proj.domain.ChannelVO;
import org.final_proj.service.VideoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/video/*")
@Controller
@Log4j
@AllArgsConstructor
public class VideoController {
	private VideoService service;
	
	// 요리비책(동영상) 페이지로 넘어감
	@GetMapping("/main")
	public void channelPage(Model model) {
		List<ChannelVO> cList = service.getChannel();
		model.addAttribute("cList", cList);
	}
	
	// 재생목록 페이지로 넘어감
	@GetMapping("/playlist")
	public void playlistPage(@RequestParam("pid") String pid, Model model) {
		model.addAttribute("pid", pid);
	}
	
	@GetMapping("/playlistOther")
	public void playlistOtherPage(@RequestParam("pid") String pid, @RequestParam("pageToken") String pageToken,Model model) {
		model.addAttribute("pid", pid);
		if(pageToken != null) {
			model.addAttribute("pageToken", pageToken);
		}
	}
	
	// 동영상과 동영상의 상세 정보를 보여줌
	@GetMapping("/play")
	public void playVideo(@RequestParam("vid") String vid, Model model) {
		model.addAttribute("vid", vid);
		
	}
	
	// 유튜브 검색 결과 페이지
	@GetMapping("/search")
	public void getSearchResult(@RequestParam("query")String query, Model model) {
		model.addAttribute("query", query);
	}
	
}

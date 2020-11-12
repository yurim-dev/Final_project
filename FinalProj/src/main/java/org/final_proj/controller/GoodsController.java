package org.final_proj.controller;

import org.final_proj.domain.Criteria;
import org.final_proj.domain.PageDTO;
import org.final_proj.service.GoodsService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/goods/*")
@Log4j
@AllArgsConstructor
public class GoodsController {

	private GoodsService service;
	   
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list" + cri);
		//cri.setKeyword("아삭");
		log.info("keyword" + cri.getKeyword());
		model.addAttribute("list", service.getGoodsAll(cri));
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri ,9));
	}
	
	@PreAuthorize("isAuthenticated()") 	
	@GetMapping("/detail")
	public void detail(@RequestParam("goodsNo") String goodsNo, Model model) {
		log.info("/detail");
		model.addAttribute("detail", service.getDetail(goodsNo));
		
	}
	
}

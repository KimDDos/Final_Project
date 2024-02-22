package com.four.www.main.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.four.www.main.service.MainService;
import com.four.www.main.service.PlaceSearchService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main/**")
@RequiredArgsConstructor
public class MainController {
	
	private final MainService mainsv;
	
	@GetMapping("/footerPi")
	public String footerpi() {
		return "/footerdetail/privateinformation";
	}
	
	@GetMapping("/footerSt")
	public String footerSt() {
		return "/footerdetail/serviceterms";
	}

	@GetMapping("/footerRight")
	public String footerRight() {
		return "/footerdetail/right";
	}
	@GetMapping("/searchMap")
	public void searchMap(@RequestParam(value="address", required = true)String keyword) {
		PlaceSearchService pss = new PlaceSearchService();
		List<String>KeywordLists = pss.searchPlace(keyword);
		
		log.info("KEYWORDS >>>>>>>>>>>>>>>>>>>>>>>>>> " + KeywordLists);
	}
	

}

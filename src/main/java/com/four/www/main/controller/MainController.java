package com.four.www.main.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.four.www.main.repository.SearchDTO;
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
	public String searchMap(@RequestParam(value="address", required = true)String keyword, Model m) {
		PlaceSearchService pss = new PlaceSearchService();
		List<SearchDTO>KeywordLists = pss.searchPlace(keyword);
		log.info(KeywordLists.toString());
		m.addAttribute("KList",KeywordLists);
		
		return "/reservation/gymSelect";
	}
	

}
